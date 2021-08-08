import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';

class GigService {
  final log = getLogger('GigService');

  Gig? _currentGig;
  Gig? get currentGig => _currentGig;

  void initGig(gigSubcategory) {
    addGigCategory(gigSubcategory);
  }

  void addGigId(gigId) {
    _currentGig = _currentGig!.copyWith(gigId: gigId);
  }

  void addGigCategory(gigCategory) {
    _currentGig = _currentGig!.copyWith(gigCategory: gigCategory);
  }

  void addGigService(gigService) {
    _currentGig = _currentGig!.copyWith(gigServiceType: gigService);
  }

  void addGigTitle(gigTitle, gigDescription) {
    _currentGig = _currentGig!.copyWith(
      gigTitle: gigTitle,
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

  void addPriceData(gigPrice) {
    _currentGig = _currentGig!.copyWith(gigPrice: gigPrice);
  }

  void addQuoteData(gigQuote) {
    _currentGig = _currentGig!.copyWith(gigQuote: gigQuote);
  }

  void clearGig() {
    _currentGig = Gig();
    log.v('Temp gig cleared');
  }

  void cancelAddGig() {}
}
