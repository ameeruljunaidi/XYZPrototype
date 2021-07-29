import 'package:xyz_prototype/app/app.logger.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:xyz_prototype/models/application_models.dart';

class RealtimeService {
  final log = getLogger('RealtimeService');

  List<Service>? _allServiceList;
  List<Service>? get allServiceList => _allServiceList;

  List<String>? _categoriesList;
  List<String>? get categoriesList => _categoriesList;

  final databaseServicesRef = FirebaseDatabase.instance
      .reference()
      .child('1HtxWhWuZKoEdkqflRuc3BaPOVsZSLB5F91mjIjtG-S4')
      .child('gigData');

  final databaseServiceSubCategoriesRef = FirebaseDatabase.instance
      .reference()
      .child('1HtxWhWuZKoEdkqflRuc3BaPOVsZSLB5F91mjIjtG-S4')
      .child('gigSubcategory');

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

  List<String> getSubCategories() {
    final _subCategoriesListDup = [];

    if (_allServiceList != null) {
      _allServiceList!.forEach(
        (service) {
          _subCategoriesListDup.add(service.serviceSubcategory);
        },
      );

      final _subCategoriesList = [
        ...{..._subCategoriesListDup}
      ];

      log.v('list of subCategories: $_subCategoriesList');
      return List<String>.from(_subCategoriesList);
    }
    return List<String>.from(_subCategoriesListDup);
  }
}
