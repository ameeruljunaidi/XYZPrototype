import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:xyz_prototype/api/firestore_api.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/app/app.router.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:xyz_prototype/services/gig_service.dart';

class GigListViewModel extends BaseViewModel {
  final log = getLogger('GigListViewModel');
  final _navigationService = locator<NavigationService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _gigService = locator<GigService>();

  // Navigation functions
  void goBack() {
    _navigationService.back();
  }

  int? _documentLimit = 5;
  List<DocumentSnapshot> _gigSnaphots = <DocumentSnapshot>[];

  bool _hasNext = true;
  bool get hasNext => _hasNext;

  List<Gig>? _gigList = <Gig>[];
  List<Gig>? get gigList => _gigList;

  ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  void addScrollListener() {
    _scrollController.addListener(_scrollListener);
    notifyListeners();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange &&
        hasNext) {
      getNextGigs();
    }
  }

  void getNextGigs() async {
    log.v('Get gigs.');

    if (isBusy) return;
    setBusy(true);

    try {
      final snapshot = await _firestoreApi.getGigSnaphot(
        limit: _documentLimit!,
        startAfter: _gigSnaphots.isNotEmpty ? _gigSnaphots.last : null,
      );

      _gigSnaphots = snapshot.docs;

      final gigs = _gigSnaphots.map((element) {
        final gigData = element.data();
        return Gig.fromJson(gigData as Map<String, dynamic>);
      });

      _gigList!.addAll(gigs);

      if (_gigSnaphots.length < _documentLimit!) _hasNext = false;

      notifyListeners();
    } catch (e) {
      log.v('${e.toString()}');
      notifyListeners();
    }

    setBusy(false);
  }

  // Navigation functions
  void goToGigProfile(index) {
    if (_gigList != null) {
      final Gig _loadGig = _gigList![index];
      _gigService.loadGig(_loadGig);

      _navigationService.navigateTo(Routes.gigProfileView);
    } else {
      log.e('gigList is empty');
    }
  }
}
