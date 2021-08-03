import 'package:firebase_storage/firebase_storage.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:xyz_prototype/constants/app_urls.dart';
import 'package:xyz_prototype/models/application_models.dart';

class RealtimeService {
  final log = getLogger('RealtimeService');

  List<Service>? _allServiceList;
  List<Service>? get allServiceList => _allServiceList;

  List<String>? _categoriesList;
  List<String>? get categoriesList => _categoriesList;

  List<String>? _subCategoriesList;
  List<String>? get subCcategoriesList => _subCategoriesList;

  final databaseServicesRef = FirebaseDatabase.instance
      .reference()
      .child('1HtxWhWuZKoEdkqflRuc3BaPOVsZSLB5F91mjIjtG-S4')
      .child('gigData');

  final databaseServiceSubCategoriesRef = FirebaseDatabase.instance
      .reference()
      .child('1HtxWhWuZKoEdkqflRuc3BaPOVsZSLB5F91mjIjtG-S4')
      .child('gigSubCategory');

  Future<List<Service>> getServices() async {
    final List<Service> _services = [];

    await databaseServicesRef.get().then(
      (snapshot) {
        if (snapshot != null) {
          final _snapshotValue = snapshot.value;
          final _snapshotValueMap = Map<String, dynamic>.from(_snapshotValue);
          log.v('sample from realtime: ${_snapshotValueMap['sambo']}');

          _snapshotValueMap.forEach(
            (serviceId, serviceData) {
              _services.add(
                Service(
                  serviceId: serviceData['serviceId'],
                  serviceName: serviceData['serviceName'],
                  serviceCategory: serviceData['serviceCategory'],
                  serviceSubcategory: serviceData['serviceSubCategory'],
                  servicePriceTypes:
                      serviceData['servicePriceTypes'].split(','),
                ),
              );
            },
          );

          _allServiceList = _services;

          log.v('sample serviceData: ${_services[0]}');
          log.v('sample price type: ${_services[0].servicePriceTypes![0]}');
          return _services;
        }
      },
    );

    return _services;
  }

  List<String> getCategories() {
    final _categoriesListDup = [];

    if (_allServiceList != null) {
      _allServiceList!.forEach(
        (service) {
          _categoriesListDup.add(service.serviceCategory);
        },
      );

      final _categoriesList = [
        ...{..._categoriesListDup}
      ];

      log.v('list of categories: $_categoriesList');
      return List<String>.from(_categoriesList);
    }
    return List<String>.from(_categoriesListDup);
  }

  Future<String> getServiceSubCategoryPhotoUrl(
      String serviceSubCategoryId) async {
    final Reference _firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('assets')
        .child('serviceSubCategoryPhotos')
        .child('$serviceSubCategoryId.jpeg');

    try {
      var _downloadUrl = await _firebaseStorageRef.getDownloadURL();
      var _url = _downloadUrl.toString();

      return _url;
    } catch (e) {
      log.e('firebase storage error: $e');
      return NoPhotoUrl;
    }
  }

  Future<List<ServiceSubCategory>> getSubCategories() async {
    final List<ServiceSubCategory> _subCategoriesList = [];

    await databaseServiceSubCategoriesRef.get().then(
      (snapshot) async {
        if (snapshot != null) {
          final _snapshotValue = snapshot.value;
          final _snapshotValueMap = Map<String, dynamic>.from(_snapshotValue);
          log.v('snapshotValueRetrieved: $_snapshotValue');

          for (var entry in _snapshotValueMap.entries) {
            await forEachServiceSubCategory(
              entry.value,
              _subCategoriesList,
            );
          }

          return _subCategoriesList;
        }
      },
    );
    return _subCategoriesList;
  }

  Future<void> forEachServiceSubCategory(
      subCategoryData, _subCategoriesList) async {
    final _subCategoryPhoto = await getServiceSubCategoryPhotoUrl(
        subCategoryData['serviceSubCategoryId']);

    _subCategoriesList.add(
      ServiceSubCategory(
        serviceSubCategoryId: subCategoryData['serviceSubCategoryId'],
        serviceSubCategoryName: subCategoryData['serviceSubCategory'],
        serviceSubCategoryPhoto: _subCategoryPhoto,
        serviceSuggestedFeatures:
            subCategoryData['serviceSuggestedFeatures']['List'].split(','),
        serviceSuggestedFeaturesTypes:
            subCategoryData['serviceSuggestedFeatures']['Type'].split(','),
        serviceSugggestedQuoteDetails:
            subCategoryData['serviceSuggestedQuoteDetails'].split(','),
      ),
    );
  }
}
