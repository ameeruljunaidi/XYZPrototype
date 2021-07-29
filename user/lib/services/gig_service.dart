import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';

class GigService {
  final log = getLogger('GigService');

  Gig? _currentGig;
  Gig? get currentGig => _currentGig;

  void initGig({gigTitle, gigSubtitle, gigDescription, gigVendorId}) {
    final gig = Gig(
      gigTitle: gigTitle,
      gigSubtitle: gigSubtitle,
      gigDescription: gigDescription,
      gigVendorId: gigVendorId,
    );

    _currentGig = gig;
  }

  void addGigId(gigId) {
    _currentGig = _currentGig!.copyWith(gigId: gigId);
  }

  void addGigAddress(gigAddress) {
    _currentGig = _currentGig!.copyWith(gigLocation: gigAddress);
  }

  void clearGig() {
    _currentGig = Gig();
  }
}
