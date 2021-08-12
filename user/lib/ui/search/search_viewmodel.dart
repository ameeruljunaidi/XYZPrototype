import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/orders_services.dart';
import 'package:xyz_prototype/services/user_service.dart';

class SearchViewModel extends BaseViewModel {
  final log = getLogger('SearchViewModel');
  final _userService = locator<UserService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _orderService = locator<OrderService>();

  void startupLogic() async {
    setBusy(true);
    await getUser();
    await getGigOrders();
    await getGigs();
    await getVendors();
    await getAppointments();
    setBusy(true);
  }

  Client? _currentUser;
  bool _currentUserExist = false;

  Future<void> getUser() async {
    await _userService.syncUserAccount();
    _currentUser = _userService.currentUser;
    _currentUserExist = true;

    notifyListeners();
  }

  // Get the list of pages for inbox view
  List<String>? _pages = [
    'Today',
    'Tomorrow',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  List<String>? get pages => _pages;

  // Functions for page controller on inbox page
  PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  int _selectedActivitiesPage = 0;
  int get selectedActivitiesPage => _selectedActivitiesPage;

  // Controller for pages
  void goToPageIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );

    _selectedActivitiesPage = index;

    notifyListeners();
  }

  void updateSelectedPricePage(index) {
    _selectedActivitiesPage = index;

    notifyListeners();
  }

  /// Need to get a couple of things
  /// 1. List of all the gig orders based on the current user
  /// 2. The gigs themselves
  /// 3. All the vendors for the gigs
  /// 4. List of all the appointments for the gigs

  List<GigOrder>? _gigOrders;
  List<GigOrder>? get gigOrders => _gigOrders;

  Future<void> getGigOrders() async {
    if (_currentUserExist) {
      _gigOrders = await _firestoreApi.getGigOrders(_currentUser!);

      if (_gigOrders != null) {
        List<String> _previewGigOrder = <String>[];

        _gigOrders!.forEach((gigOrder) {
          _previewGigOrder.add(gigOrder.gigOrderId!);
        });

        log.v('Loaded gigOrder: ${_previewGigOrder}');
      }
    } else {
      log.e('Failed to get gig orders');
    }

    notifyListeners();
  }

  List<Gig?>? _gigList;
  List<Gig?>? get gigList => _gigList;

  Future<void> getGigs() async {
    if (_currentUserExist) {
      _gigList = await _firestoreApi.getOrderedGigs(_currentUser!);

      if (_gigList != null) {
        List<String> _previewGig = <String>[];

        _gigList!.forEach((gig) {
          _previewGig.add(gig!.gigId!);
        });

        log.v('Loaded gigs: $_previewGig');
      }
    } else {
      log.e('currentUser not found');
    }
    notifyListeners();
  }

  List<Client>? _vendorList;
  List<Client>? get vendorList => _vendorList;

  Future<void> getVendors() async {
    if (_gigOrders != null) {
      _vendorList = await _firestoreApi.getVendorsForOrder(_gigOrders!);

      if (_vendorList != null) {
        List<String> _previewVendors = <String>[];

        _vendorList!.forEach((vendor) {
          _previewVendors.add(vendor.clientVendorId!);
        });

        log.v('Loaded vendors: $_previewVendors');
      }
    } else {
      log.e('gigOrder is empty: $_gigOrders');
    }

    notifyListeners();
  }

  List<Appointment>? _appointmentList;
  List<Appointment>? get appointmentList => _appointmentList;

  Future<void> getAppointments() async {
    List<Appointment> _gigAppointments = <Appointment>[];

    if (_gigOrders != null) {
      for (var _gigOrder in _gigOrders!) {
        final _appointment = await _orderService.getAppointment(_gigOrder);
        _gigAppointments.add(_appointment);
      }

      List<String> _previewAppointment = <String>[];

      _gigAppointments.forEach((appointment) {
        _previewAppointment.add(appointment.id.toString());
      });

      log.v('Loaded appointment: $_previewAppointment');
    } else {
      log.e('gigOrder is empty: $_gigOrders');
    }

    _appointmentList = _gigAppointments;
    notifyListeners();
  }
}
