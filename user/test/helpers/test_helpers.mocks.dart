// Mocks generated by Mockito 5.0.11 from annotations
// in xyz_prototype/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:ui' as _i19;

import 'package:cloud_firestore/cloud_firestore.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter/src/animation/curves.dart' as _i12;
import 'package:flutter/src/widgets/framework.dart' as _i10;
import 'package:flutter/src/widgets/navigator.dart' as _i11;
import 'package:get/get_instance/src/bindings_interface.dart' as _i13;
import 'package:get/get_navigation/src/routes/transitions_type.dart' as _i14;
import 'package:mockito/mockito.dart' as _i1;
import 'package:places_service/src/models/application_models.dart' as _i2;
import 'package:places_service/src/places_service.dart' as _i15;
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart'
    as _i5;
import 'package:stacked_services/src/dialog/dialog_service.dart' as _i16;
import 'package:stacked_services/src/models/overlay_request.dart' as _i17;
import 'package:stacked_services/src/models/overlay_response.dart' as _i18;
import 'package:stacked_services/src/navigation_service.dart' as _i9;
import 'package:xyz_prototype/api/firestore_api.dart' as _i20;
import 'package:xyz_prototype/models/application_models.dart' as _i8;
import 'package:xyz_prototype/services/user_service.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakePlacesLocation extends _i1.Fake implements _i2.PlacesLocation {}

class _FakePlacesDetails extends _i1.Fake implements _i2.PlacesDetails {}

class _FakeCollectionReference<T extends Object?> extends _i1.Fake
    implements _i3.CollectionReference<T> {}

class _FakeFirebaseAuth extends _i1.Fake implements _i4.FirebaseAuth {
  @override
  String toString() => super.toString();
}

class _FakeFirebaseAuthenticationResult extends _i1.Fake
    implements _i5.FirebaseAuthenticationResult {}

/// A class which mocks [UserService].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserService extends _i1.Mock implements _i6.UserService {
  @override
  bool get hasLoggedInUser => (super
          .noSuchMethod(Invocation.getter(#hasLoggedInUser), returnValue: false)
      as bool);
  @override
  _i7.Future<void> syncUserAccount() =>
      (super.noSuchMethod(Invocation.method(#syncUserAccount, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<void> syncOrCreateUserAccount({_i8.User? user}) =>
      (super.noSuchMethod(
          Invocation.method(#syncOrCreateUserAccount, [], {#user: user}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
}

/// A class which mocks [NavigationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigationService extends _i1.Mock implements _i9.NavigationService {
  @override
  String get previousRoute =>
      (super.noSuchMethod(Invocation.getter(#previousRoute), returnValue: '')
          as String);
  @override
  String get currentRoute =>
      (super.noSuchMethod(Invocation.getter(#currentRoute), returnValue: '')
          as String);
  @override
  _i10.GlobalKey<_i11.NavigatorState>? nestedNavigationKey(int? index) =>
      (super.noSuchMethod(Invocation.method(#nestedNavigationKey, [index]))
          as _i10.GlobalKey<_i11.NavigatorState>?);
  @override
  void config(
          {bool? enableLog,
          bool? defaultPopGesture,
          bool? defaultOpaqueRoute,
          Duration? defaultDurationTransition,
          bool? defaultGlobalState,
          String? defaultTransition}) =>
      super.noSuchMethod(
          Invocation.method(#config, [], {
            #enableLog: enableLog,
            #defaultPopGesture: defaultPopGesture,
            #defaultOpaqueRoute: defaultOpaqueRoute,
            #defaultDurationTransition: defaultDurationTransition,
            #defaultGlobalState: defaultGlobalState,
            #defaultTransition: defaultTransition
          }),
          returnValueForMissingStub: null);
  @override
  _i7.Future<T?>? navigateWithTransition<T>(_i10.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id,
          _i12.Curve? curve,
          _i13.Bindings? binding,
          bool? fullscreenDialog = false,
          bool? preventDuplicates = true,
          _i14.Transition? transitionClass}) =>
      (super.noSuchMethod(Invocation.method(#navigateWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id,
        #curve: curve,
        #binding: binding,
        #fullscreenDialog: fullscreenDialog,
        #preventDuplicates: preventDuplicates,
        #transitionClass: transitionClass
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWithTransition<T>(_i10.Widget? page,
          {bool? opaque,
          String? transition = r'',
          Duration? duration,
          bool? popGesture,
          int? id,
          _i12.Curve? curve,
          _i13.Bindings? binding,
          bool? fullscreenDialog = false,
          bool? preventDuplicates = true,
          _i14.Transition? transitionClass}) =>
      (super.noSuchMethod(Invocation.method(#replaceWithTransition, [
        page
      ], {
        #opaque: opaque,
        #transition: transition,
        #duration: duration,
        #popGesture: popGesture,
        #id: id,
        #curve: curve,
        #binding: binding,
        #fullscreenDialog: fullscreenDialog,
        #preventDuplicates: preventDuplicates,
        #transitionClass: transitionClass
      })) as _i7.Future<T?>?);
  @override
  bool back<T>({T? result, int? id}) => (super.noSuchMethod(
      Invocation.method(#back, [], {#result: result, #id: id}),
      returnValue: false) as bool);
  @override
  void popUntil(_i11.RoutePredicate? predicate) =>
      super.noSuchMethod(Invocation.method(#popUntil, [predicate]),
          returnValueForMissingStub: null);
  @override
  void popRepeated(int? popTimes) =>
      super.noSuchMethod(Invocation.method(#popRepeated, [popTimes]),
          returnValueForMissingStub: null);
  @override
  _i7.Future<T?>? navigateTo<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#navigateTo, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? navigateToView<T>(_i10.Widget? view,
          {dynamic arguments,
          int? id,
          bool? opaque,
          _i12.Curve? curve,
          _i13.Bindings? binding,
          Duration? duration,
          bool? fullscreenDialog = false,
          bool? popGesture,
          bool? preventDuplicates = true,
          _i14.Transition? transition}) =>
      (super.noSuchMethod(Invocation.method(#navigateToView, [
        view
      ], {
        #arguments: arguments,
        #id: id,
        #opaque: opaque,
        #curve: curve,
        #binding: binding,
        #duration: duration,
        #fullscreenDialog: fullscreenDialog,
        #popGesture: popGesture,
        #preventDuplicates: preventDuplicates,
        #transition: transition
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? replaceWith<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#replaceWith, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearStackAndShow<T>(String? routeName,
          {dynamic arguments, int? id, Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearStackAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #parameters: parameters
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShow<T>(String? routeName,
          {dynamic arguments,
          int? id,
          bool? preventDuplicates = true,
          Map<String, String>? parameters}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShow, [
        routeName
      ], {
        #arguments: arguments,
        #id: id,
        #preventDuplicates: preventDuplicates,
        #parameters: parameters
      })) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? clearTillFirstAndShowView<T>(_i10.Widget? view,
          {dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#clearTillFirstAndShowView, [view],
          {#arguments: arguments, #id: id})) as _i7.Future<T?>?);
  @override
  _i7.Future<T?>? pushNamedAndRemoveUntil<T>(String? routeName,
          {_i11.RoutePredicate? predicate, dynamic arguments, int? id}) =>
      (super.noSuchMethod(Invocation.method(#pushNamedAndRemoveUntil, [
        routeName
      ], {
        #predicate: predicate,
        #arguments: arguments,
        #id: id
      })) as _i7.Future<T?>?);
}

/// A class which mocks [PlacesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlacesService extends _i1.Mock implements _i15.PlacesService {
  @override
  _i2.PlacesLocation get currentPosition =>
      (super.noSuchMethod(Invocation.getter(#currentPosition),
          returnValue: _FakePlacesLocation()) as _i2.PlacesLocation);
  @override
  void initialize({String? apiKey}) =>
      super.noSuchMethod(Invocation.method(#initialize, [], {#apiKey: apiKey}),
          returnValueForMissingStub: null);
  @override
  _i7.Future<List<_i2.PlacesAutoCompleteResult>> getAutoComplete(
          String? input) =>
      (super.noSuchMethod(Invocation.method(#getAutoComplete, [input]),
              returnValue: Future<List<_i2.PlacesAutoCompleteResult>>.value(
                  <_i2.PlacesAutoCompleteResult>[]))
          as _i7.Future<List<_i2.PlacesAutoCompleteResult>>);
  @override
  _i7.Future<_i2.PlacesDetails> getPlaceDetails(String? placeId) =>
      (super.noSuchMethod(Invocation.method(#getPlaceDetails, [placeId]),
              returnValue:
                  Future<_i2.PlacesDetails>.value(_FakePlacesDetails()))
          as _i7.Future<_i2.PlacesDetails>);
  @override
  _i7.Future<dynamic> getPlacesAtCurrentLocation() =>
      (super.noSuchMethod(Invocation.method(#getPlacesAtCurrentLocation, []),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
}

/// A class which mocks [DialogService].
///
/// See the documentation for Mockito's code generation for more information.
class MockDialogService extends _i1.Mock implements _i16.DialogService {
  @override
  void registerCustomDialogBuilders(
          Map<dynamic, _i16.DialogBuilder>? builders) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomDialogBuilders, [builders]),
          returnValueForMissingStub: null);
  @override
  void registerCustomDialogBuilder(
          {dynamic variant,
          _i10.Widget Function(_i10.BuildContext, _i17.DialogRequest<dynamic>,
                  dynamic Function(_i18.DialogResponse<dynamic>))?
              builder}) =>
      super.noSuchMethod(
          Invocation.method(#registerCustomDialogBuilder, [],
              {#variant: variant, #builder: builder}),
          returnValueForMissingStub: null);
  @override
  _i7.Future<_i18.DialogResponse<dynamic>?> showDialog(
          {String? title,
          String? description,
          String? cancelTitle,
          _i19.Color? cancelTitleColor,
          String? buttonTitle = r'Ok',
          _i19.Color? buttonTitleColor,
          bool? barrierDismissible = false,
          _i16.DialogPlatform? dialogPlatform}) =>
      (super.noSuchMethod(
              Invocation.method(#showDialog, [], {
                #title: title,
                #description: description,
                #cancelTitle: cancelTitle,
                #cancelTitleColor: cancelTitleColor,
                #buttonTitle: buttonTitle,
                #buttonTitleColor: buttonTitleColor,
                #barrierDismissible: barrierDismissible,
                #dialogPlatform: dialogPlatform
              }),
              returnValue: Future<_i18.DialogResponse<dynamic>?>.value())
          as _i7.Future<_i18.DialogResponse<dynamic>?>);
  @override
  _i7.Future<_i18.DialogResponse<T>?> showCustomDialog<T, R>(
          {dynamic variant,
          String? title,
          String? description,
          bool? hasImage = false,
          String? imageUrl,
          bool? showIconInMainButton = false,
          String? mainButtonTitle,
          bool? showIconInSecondaryButton = false,
          String? secondaryButtonTitle,
          bool? showIconInAdditionalButton = false,
          String? additionalButtonTitle,
          bool? takesInput = false,
          _i19.Color? barrierColor = const _i19.Color(2315255808),
          bool? barrierDismissible = false,
          String? barrierLabel = r'',
          dynamic customData,
          R? data}) =>
      (super.noSuchMethod(
              Invocation.method(#showCustomDialog, [], {
                #variant: variant,
                #title: title,
                #description: description,
                #hasImage: hasImage,
                #imageUrl: imageUrl,
                #showIconInMainButton: showIconInMainButton,
                #mainButtonTitle: mainButtonTitle,
                #showIconInSecondaryButton: showIconInSecondaryButton,
                #secondaryButtonTitle: secondaryButtonTitle,
                #showIconInAdditionalButton: showIconInAdditionalButton,
                #additionalButtonTitle: additionalButtonTitle,
                #takesInput: takesInput,
                #barrierColor: barrierColor,
                #barrierDismissible: barrierDismissible,
                #barrierLabel: barrierLabel,
                #customData: customData,
                #data: data
              }),
              returnValue: Future<_i18.DialogResponse<T>?>.value())
          as _i7.Future<_i18.DialogResponse<T>?>);
  @override
  _i7.Future<_i18.DialogResponse<dynamic>?> showConfirmationDialog(
          {String? title,
          String? description,
          String? cancelTitle = r'Cancel',
          String? confirmationTitle = r'Ok',
          bool? barrierDismissible = false,
          _i16.DialogPlatform? dialogPlatform}) =>
      (super.noSuchMethod(
              Invocation.method(#showConfirmationDialog, [], {
                #title: title,
                #description: description,
                #cancelTitle: cancelTitle,
                #confirmationTitle: confirmationTitle,
                #barrierDismissible: barrierDismissible,
                #dialogPlatform: dialogPlatform
              }),
              returnValue: Future<_i18.DialogResponse<dynamic>?>.value())
          as _i7.Future<_i18.DialogResponse<dynamic>?>);
  @override
  void completeDialog(_i18.DialogResponse<dynamic>? response) =>
      super.noSuchMethod(Invocation.method(#completeDialog, [response]),
          returnValueForMissingStub: null);
}

/// A class which mocks [FirestoreApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirestoreApi extends _i1.Mock implements _i20.FirestoreApi {
  @override
  _i3.CollectionReference<Object?> get userCollection =>
      (super.noSuchMethod(Invocation.getter(#userCollection),
              returnValue: _FakeCollectionReference<Object?>())
          as _i3.CollectionReference<Object?>);
  @override
  _i7.Future<void> createUser({_i8.User? user}) =>
      (super.noSuchMethod(Invocation.method(#createUser, [], {#user: user}),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i7.Future<void>);
  @override
  _i7.Future<_i8.User?> getUser({String? userId}) =>
      (super.noSuchMethod(Invocation.method(#getUser, [], {#userId: userId}),
          returnValue: Future<_i8.User?>.value()) as _i7.Future<_i8.User?>);
  @override
  _i7.Future<bool> saveAddress({_i8.Address? address, _i8.User? user}) =>
      (super.noSuchMethod(
          Invocation.method(#saveAddress, [], {#address: address, #user: user}),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i3.CollectionReference<Object?> getAddressCollectionForUser(
          String? userId) =>
      (super.noSuchMethod(
              Invocation.method(#getAddressCollectionForUser, [userId]),
              returnValue: _FakeCollectionReference<Object?>())
          as _i3.CollectionReference<Object?>);
}

/// A class which mocks [FirebaseAuthenticationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseAuthenticationService extends _i1.Mock
    implements _i5.FirebaseAuthenticationService {
  @override
  _i4.FirebaseAuth get firebaseAuth =>
      (super.noSuchMethod(Invocation.getter(#firebaseAuth),
          returnValue: _FakeFirebaseAuth()) as _i4.FirebaseAuth);
  @override
  bool get hasUser =>
      (super.noSuchMethod(Invocation.getter(#hasUser), returnValue: false)
          as bool);
  @override
  _i7.Future<bool> emailExists(String? email) =>
      (super.noSuchMethod(Invocation.method(#emailExists, [email]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i5.FirebaseAuthenticationResult> signInWithGoogle() =>
      (super.noSuchMethod(Invocation.method(#signInWithGoogle, []),
              returnValue: Future<_i5.FirebaseAuthenticationResult>.value(
                  _FakeFirebaseAuthenticationResult()))
          as _i7.Future<_i5.FirebaseAuthenticationResult>);
  @override
  _i7.Future<bool> isAppleSignInAvailable() =>
      (super.noSuchMethod(Invocation.method(#isAppleSignInAvailable, []),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  _i7.Future<_i5.FirebaseAuthenticationResult> signInWithApple(
          {String? appleRedirectUri, String? appleClientId}) =>
      (super.noSuchMethod(
              Invocation.method(#signInWithApple, [], {
                #appleRedirectUri: appleRedirectUri,
                #appleClientId: appleClientId
              }),
              returnValue: Future<_i5.FirebaseAuthenticationResult>.value(
                  _FakeFirebaseAuthenticationResult()))
          as _i7.Future<_i5.FirebaseAuthenticationResult>);
  @override
  _i7.Future<_i5.FirebaseAuthenticationResult> loginAnonymously() =>
      (super.noSuchMethod(Invocation.method(#loginAnonymously, []),
              returnValue: Future<_i5.FirebaseAuthenticationResult>.value(
                  _FakeFirebaseAuthenticationResult()))
          as _i7.Future<_i5.FirebaseAuthenticationResult>);
  @override
  _i7.Future<_i5.FirebaseAuthenticationResult> loginWithEmail(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #loginWithEmail, [], {#email: email, #password: password}),
              returnValue: Future<_i5.FirebaseAuthenticationResult>.value(
                  _FakeFirebaseAuthenticationResult()))
          as _i7.Future<_i5.FirebaseAuthenticationResult>);
  @override
  _i7.Future<_i5.FirebaseAuthenticationResult> createAccountWithEmail(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#createAccountWithEmail, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i5.FirebaseAuthenticationResult>.value(
                  _FakeFirebaseAuthenticationResult()))
          as _i7.Future<_i5.FirebaseAuthenticationResult>);
  @override
  _i7.Future<dynamic> logout() =>
      (super.noSuchMethod(Invocation.method(#logout, []),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> sendResetPasswordLink(String? email) =>
      (super.noSuchMethod(Invocation.method(#sendResetPasswordLink, [email]),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> validatePassword(String? password) =>
      (super.noSuchMethod(Invocation.method(#validatePassword, [password]),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
  @override
  _i7.Future<dynamic> updatePassword(String? password) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [password]),
          returnValue: Future<dynamic>.value()) as _i7.Future<dynamic>);
  @override
  String generateNonce([int? length = 32]) =>
      (super.noSuchMethod(Invocation.method(#generateNonce, [length]),
          returnValue: '') as String);
  @override
  String sha256ofString(String? input) =>
      (super.noSuchMethod(Invocation.method(#sha256ofString, [input]),
          returnValue: '') as String);
}
