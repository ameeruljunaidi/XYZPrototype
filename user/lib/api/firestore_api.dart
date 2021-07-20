import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/exceptions/firestore_api_exceptions.dart';
import 'package:xyz_prototype/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('firestoreApi');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('User created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
          message: 'Failed to create new user', devDetails: '$error');
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await userCollection.doc(userId).get();

      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return User.fromJson(userData as Map<String, dynamic>);
    } else {
      throw FirestoreApiException(
          message:
              'Your userId passed in is empty. Plase pass in a valid user if from your Firebase user');
    }
  }

  Future<void> saveAddress({required Address address}) async {}
}
