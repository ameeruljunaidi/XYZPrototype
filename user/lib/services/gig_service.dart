import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';

class GigService {
  final log = getLogger('GigService');

  Gig? _currentGig;
  Gig? get currentGig => _currentGig;

  void initGig(gigSubcategory) {
    addGigSubCategory(gigSubcategory);
  }

  void addGigId(gigId) {
    _currentGig = _currentGig!.copyWith(gigId: gigId);
  }

  void addGigSubCategory(gigSubcategory) {
    _currentGig = _currentGig!.copyWith(gigSubCategory: gigSubcategory);
  }

  void addGigService(gigService) {
    _currentGig = _currentGig!.copyWith(gigServiceType: gigService);
  }

  void addGigTitle(gigTitle, gigSubtitle, gigDescription) {
    _currentGig = _currentGig!.copyWith(
      gigTitle: gigTitle,
      gigSubtitle: gigSubtitle,
      gigDescription: gigDescription,
    );
  }

  void addGigLocation(gigLocation) {
    _currentGig = _currentGig!.copyWith(gigLocation: gigLocation);
  }

  void addGigPhotos(gigPhotos) {
    _currentGig = _currentGig!.copyWith(gigPhotos: gigPhotos);
  }

  void addGigVendorId(gigVendorId) {
    _currentGig = _currentGig!.copyWith(gigVendorId: gigVendorId);
  }

  void clearGig() {
    _currentGig = Gig();
  }
}
