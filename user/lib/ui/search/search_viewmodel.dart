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
    await getUser();

    if (_currentUserExist) {
      _gigOrders = await _firestoreApi.getGigOrders(_currentUser!);
    } else {
      log.e('Failed to get gig orders');
    }
  }

  List<Gig?>? _gigList;
  List<Gig?>? get gigList => _gigList;

  void getGigs() async {
    await getUser();

    if (_currentUserExist) {
      _gigList = await _firestoreApi.getOrderedGigs(_currentUser!);
    } else {
      log.e('currentUser not found');
    }
    notifyListeners();
  }

  List<Client>? _vendorList;
  List<Client>? get vendorList => _vendorList;

  void getVendors() async {
    await getGigOrders();

    List<Client> _gigVendors = <Client>[];

    if (_gigOrders != null) {
      _vendorList = await _firestoreApi.getVendorsForOrder(_gigOrders!);
    } else {
      log.e('gigOrder is empty: $_gigOrders');
    }
  }

  List<Appointment>? _appointmentList;
  List<Appointment>? get appointmentList => _appointmentList;

  void getAppointments() async {
    await getGigOrders();

    List<Appointment> _gigAppointments = <Appointment>[];

    if (_gigOrders != null) {
      for (var _gigOrder in _gigOrders!) {
        final _appointment = await _orderService.getAppointment(_gigOrder);
        _gigAppointments.add(_appointment);
      }
    } else {
      log.e('gigOrder is empty: $_gigOrders');
    }

    _appointmentList = _gigAppointments;
    notifyListeners();
  }
}
