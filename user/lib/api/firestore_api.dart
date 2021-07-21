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

  Future<Business?> getBusiness({required Client client}) async {
    log.i('clientBusinessId: ${client.clientBusinessId}');

    final businessDoc = await getBusinessCollectionForUser(client.clientId)
        .doc(client.clientBusinessId)
        .get();

    final businessData = businessDoc.data();

    return Business.fromJson(businessData as Map<String, dynamic>);
  }

  Future<Vendor?> getVendor({required Client client}) async {
    log.i('clientVendorId: ${client.clientVendorId}');

    final vendorDoc = await getVendorCollectionForUser(client.clientId)
        .doc(client.clientVendorId)
        .get();

    final vendorData = vendorDoc.data();

    return Vendor.fromJson(vendorData as Map<String, dynamic>);
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

  Future<bool> saveBusiness({
    required Business business,
    required Client client,
  }) async {
    log.i('Saved business: $business');

    try {
      // Get business collection and documents
      final businessColl = getBusinessCollectionForUser(client.clientId);
      final businessDoc = businessColl.doc();
      final newBusinessId = businessDoc.id;
      log.v('Business will be stored with id:$newBusinessId');

      // Every business by default has one vendor i.e. the business creator
      final vendorColl = getVendorCollectionForUser(client.clientId);
      final vendorDoc = vendorColl.doc();
      final newVendorId = vendorDoc.id;
      log.v('Vendor will be stored with id: $newVendorId');

      // Assign defautl vendor values to the client
      final defaultVendor = Vendor(
        vendorRegistrationDate: DateTime.now().toIso8601String(),
        vendorAddress: business.businessAddress,
        vendorAvatar: business.businessAvatar,
        vendorEmail: business.businessEmail,
        vendorId: newVendorId,
        vendorName: business.businessName,
        vendorPhone: business.businessPhone,
        vendorPhotos: business.businessPhotos,
        vendorSocialMedias: business.businessSocialMedias,
      );

      // Check if it is already a business
      final isABusiness = client.isBusiness;
      log.v('isABusiness is $isABusiness.');

      if (!isABusiness) {
        // If not a business, add a new busines to the collection
        await businessDoc.set(
          business.copyWith(businessId: newBusinessId).toJson(),
        );
        log.v(
            'New business document added to business collection to id: $newBusinessId');

        // Add the default vendor values to the collection
        await vendorDoc.set(
          defaultVendor.copyWith(vendorId: newVendorId).toJson(),
        );
        log.v('Default vendor values are added to id: $newVendorId');

        // Change client to business and add the vendor and business Id
        await userCollection.doc(client.clientId).set(client
            .copyWith(
              clientBusinessId: newBusinessId,
              clientVendorId: newVendorId,
              clientType: 'business',
            )
            .toJson());
        log.v(
            'Client type changed to business from user, and business and vendor Id added');

        return true;
      } else {
        final existingBusiness = await getBusiness(client: client);
        final existingVendor = await getVendor(client: client);

        await businessColl.doc(client.clientBusinessId).update(business
            .copyWith(
              businessId: existingBusiness!.businessId,
              businessRegistrationDate:
                  existingBusiness.businessRegistrationDate,
            )
            .toJson());

        await vendorColl.doc(client.clientVendorId).update(defaultVendor
            .copyWith(
              vendorId: existingVendor!.vendorId,
              vendorRegistrationDate: existingVendor.vendorRegistrationDate,
            )
            .toJson());

        return true;
      }
    } on Exception catch (e) {
      log.e('We could not save the businesss. $e');

      return false;
    }
  }

  CollectionReference getVendorCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(VendorFirestoreKey);
  }

  CollectionReference getBusinessCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(BusinessFirestoreKey);
  }

  CollectionReference getAddressCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(AddressFirestoreKey);
  }

  Future<bool> isCityServiced({required String city}) {
    return Future.value(false);
  }
}
