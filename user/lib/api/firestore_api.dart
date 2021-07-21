import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/exceptions/firestore_api_exceptions.dart';
import 'package:xyz_prototype/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('firestoreApi');

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);

  Future<void> createUser({required Client client}) async {
    log.i('client:$client');

    try {
      final userDocument = userCollection.doc(client.clientId);
      await userDocument.set(client.toJson());
      log.v('User created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
          message: 'Failed to create new user', devDetails: '$error');
    }
  }

  Future<Client?> getUser({required String clientId}) async {
    log.i('clientId:$clientId');

    if (clientId.isNotEmpty) {
      final userDoc = await userCollection.doc(clientId).get();

      if (!userDoc.exists) {
        log.v('We have no user with id $clientId in our database');
        return null;
      }

      final clientData = userDoc.data();
      log.v('Client found. Data: $clientData');

      return Client.fromJson(clientData as Map<String, dynamic>);
    } else {
      throw FirestoreApiException(
          message:
              'Your clientId passed in is empty. Plase pass in a valid user if from your Firebase user');
    }
  }

  Future<bool> saveAddress({
    required Address address,
    required Client user,
  }) async {
    log.i('Saved address: $address');

    try {
      final addressDoc = getAddressCollectionForUser(user.clientId).doc();
      final newAddressId = addressDoc.id;
      log.v('Address will be stored with id:$newAddressId');

      await addressDoc.set(
        address.copyWith(id: newAddressId).toJson(),
      );

      final hasDefaultAddress = user.hasAddress;

      if (!hasDefaultAddress) {
        log.v('User has not default address, set current to default');
        await userCollection
            .doc(user.clientId)
            .set(user.copyWith(clientAddress: newAddressId).toJson());
        log.v('User ${user.clientId} defaultAddress set to $newAddressId');
      }

      return true;
    } on Exception catch (e) {
      log.e('We could not save the users addres. $e');

      return false;
    }
  }

  CollectionReference getAddressCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(AddressFirestoreKey);
  }

  Future<bool> isCityServiced({required String city}) {
    return Future.value(false);
  }
}
