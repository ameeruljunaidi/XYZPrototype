import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';
import 'package:xyz_prototype/services/user_service.dart';

class OrderService {
  final log = getLogger('OrderService');
  final _userService = locator<UserService>();
  final _gigService = locator<GigService>();
  final _firestoreService = locator<FirestoreApi>();

  GigOrder? _currentOrder;
  GigOrder? get currentOrder => _currentOrder;

  void createGigOrder() async {
    await _userService.syncUserAccount();

    final bool _currentGigExist = _gigService.currentGig != null;
    final bool _currentUserExist = _userService.currentUser != null;

    if (_currentGigExist && _currentUserExist) {
      final String _gigOrderGigId = _gigService.currentGig!.gigId!;
      final String _gigOrderVendorId = _gigService.currentGig!.gigVendorId!;
      final String _gigOrderClientId = _userService.currentUser!.clientId;

      final _loadedAppointment = GigAppointment(
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        isAllDay: false,
        subject: 'test appointment',
        notes: 'test notes',
        location: 'test location',
      );

      final _loadedGigOrder = GigOrder(
        gigOrderGigId: _gigOrderGigId,
        gigOrderVendorId: _gigOrderVendorId,
        gigOrderClientId: _gigOrderClientId,
      );

      final addOrderSuccess = await _firestoreService.createOder(
        _loadedGigOrder,
        _loadedAppointment,
      );

      if (addOrderSuccess) {
        return;
      } else {
        log.e('Something wrong with adding order');
      }
      ;
    } else {
      log.e('Current gig: $_currentGigExist. Current user: $_currentUserExist');
    }
  }

  Future<Appointment> getAppointment(
    GigOrder gigOrder,
  ) async {
    final _gigAppointment =
        await _firestoreService.getCalendarAppointment(gigOrder);

    return Appointment(
      startTime: _gigAppointment.startTime!,
      endTime: _gigAppointment.endTime!,
      startTimeZone: _gigAppointment.startTimeZone,
      endTimeZone: _gigAppointment.endTimeZone,
      isAllDay: _gigAppointment.isAllDay!,
      subject: _gigAppointment.subject!,
      notes: _gigAppointment.notes,
      location: _gigAppointment.location,
      recurrenceRule: _gigAppointment.recurrenceRule,
      recurrenceExceptionDates: _gigAppointment.recurrenceExceptionDates,
      resourceIds: _gigAppointment.resourceIds,
      recurrenceId: _gigAppointment.recurrenceId,
      id: _gigAppointment.gigAppointmentId,
    );
  }
}
