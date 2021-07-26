import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:xyz_prototype/ui/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

StartUpViewModel _getModel() => StartUpViewModel();

void main() {
  group('StartupViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => unregisterServices());
    group('runStartupLogic -', () {
      test('When called, check if we have a logged in user on UserService',
          () async {
        final userService = getAndRegisterUserService();
        final model = _getModel();
        await model.runStartupLogic();

        verify(userService.hasLoggedInUser);
      });

      test(
          'When hasLoggedInUser is true, call syncUserAccount on the userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartupLogic();

        verify(userService.syncUserAccount());
      });

      test('When hasLoggedInUser is true, get currentUser from userService',
          () async {
        final userService = getAndRegisterUserService(hasLoggedInUser: true);
        final model = _getModel();
        await model.runStartupLogic();

        verify(userService.currentUser);
      });
    });
  });
}
