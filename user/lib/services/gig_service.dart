import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';

class GigService {
  final log = getLogger('GigService');

  Gig? _currentGig;
  Gig? get currentGig => _currentGig;

  void initGig({gigTitle, gigSubtitle, gigDescription}) {
    final gig = Gig(
      gigTitle: gigTitle,
      gigSubtitle: gigSubtitle,
      gigDescription: gigDescription,
    );

    _currentGig = gig;
  }
}
