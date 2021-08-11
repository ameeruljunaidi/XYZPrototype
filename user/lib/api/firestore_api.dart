import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:xyz_prototype/app/app.locator.dart';
import 'package:xyz_prototype/app/app.logger.dart';
import 'package:xyz_prototype/constants/app_keys.dart';
import 'package:xyz_prototype/exceptions/firestore_api_exceptions.dart';
import 'package:xyz_prototype/models/application_models.dart';
import 'package:collection/collection.dart';
import 'package:xyz_prototype/services/gig_service.dart';

class FirestoreApi {
  // Log everything that is happening in this api call
  final log = getLogger('firestoreApi');
  final _gigService = locator<GigService>();

  // Collection reference for firebase
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection(UsersFirestoreKey);
  final CollectionReference gigsCollection =
      FirebaseFirestore.instance.collection(GigsFirestoreKey);
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection(OrdersFirestoreKey);

  // Get collection reference base on client Id
  CollectionReference getVendorCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(VendorFirestoreKey);
  }

  CollectionReference getBusinessCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(BusinessFirestoreKey);
  }

  CollectionReference getAddressCollectionForUser(String clientId) {
    return userCollection.doc(clientId).collection(AddressFirestoreKey);
  }

  // Get collection reference based on gigId
  CollectionReference getAddressCollectionForGig(String gigId) {
    return gigsCollection.doc(gigId).collection(AddressFirestoreKey);
  }

  // Get appointment reference based on gigOrderId
  CollectionReference getAppointmentCollections(String gigOrderId) {
    return ordersCollection.doc(gigOrderId).collection(AppointmentFirestoreKey);
  }

  // Getting a stream controller for gigs
  final StreamController<List<Gig>> _gigsController =
      StreamController<List<Gig>>.broadcast();

  // Getting a stream controller for currentuser
  final StreamController<Client> _clientController =
      StreamController<Client>.broadcast();

  // Firebase functions that get stuff

  // Getting the user
  Future<Client?> getUser({required String clientId}) async {
    log.i('Getting clientId:$clientId');

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

  // Getting a vendor for a given  gigOrders
  Future<Client> getVendorForOrder(GigOrder gigOrder) async {
    log.i('loaded gigOrder: $gigOrder');

    final _vendorId = gigOrder.gigOrderVendorId;
    final _vendorDoc = await userCollection
        .where('clientVendorId', isEqualTo: _vendorId)
        .get();

    final _vendorData = _vendorDoc.docs.first.data();
    return Client.fromJson(_vendorData as Map<String, dynamic>);
  }

  Future<List<Client>> getVendorsForOrder(List<GigOrder> gigOrders) async {
    List<Client> _vendorsList = [];

    for (var _gigOrder in gigOrders) {
      final _vendor = await getVendorForOrder(_gigOrder);
      _vendorsList.add(_vendor);
    }

    return _vendorsList;
  }

  // Getting the client's business info
  Future<Business?> getBusiness({required Client client}) async {
    log.i('clientBusinessId: ${client.clientBusinessId}');

    final businessDoc = await getBusinessCollectionForUser(client.clientId)
        .doc(client.clientBusinessId)
        .get();

    final businessData = businessDoc.data();

    return Business.fromJson(businessData as Map<String, dynamic>);
  }

  // Getting the client's vendor info
  Future<Vendor?> getVendor({required Client client}) async {
    log.i('clientVendorId: ${client.clientVendorId}');

    final vendorDoc = await getVendorCollectionForUser(client.clientId)
        .doc(client.clientVendorId)
        .get();

    final vendorData = vendorDoc.data();

    return Vendor.fromJson(vendorData as Map<String, dynamic>);
  }

  // Getting all gigs
  Future<List<Gig?>> getOrderedGigs(
    Client client,
  ) async {
    final List<GigOrder> _gigOrderList = await getGigOrders(client);
    final List<String> _gigIdList = _gigOrderList.map((element) {
      return element.gigOrderGigId!;
    }).toList();
    log.v('gigIdList loaded: $_gigIdList');

    List<Gig> _gigList = <Gig>[];

    for (String gigId in _gigIdList) {
      final gigDocs =
          await gigsCollection.where('gigId', isEqualTo: gigId).get();

      gigDocs.docs.map((element) {
        final gigData = element.data();

        _gigList.add(Gig.fromJson(gigData as Map<String, dynamic>));
      }).toList();
    }

    return _gigList;
  }

  // Getting gig snapshots, mostly for paginations
  Future<QuerySnapshot> getGigSnaphot({
    int limit = 3,
    DocumentSnapshot? startAfter,
  }) async {
    final refGigs =
        await gigsCollection.orderBy('gigDateTimeAdded').limit(limit);

    if (startAfter == null) {
      log.v('First fetch for gigs');

      return refGigs.get();
    } else {
      log.v('Folow-on fetch for gigs');

      return refGigs.startAfterDocument(startAfter).get();
    }
  }

  Future<List<GigOrder>> getGigOrders(Client client) async {
    log.i('client loaded: $client');

    final gigOrderDocs = await ordersCollection
        .where(
          'gigOrderClientId',
          isEqualTo: client.clientVendorId,
        )
        .get();

    return gigOrderDocs.docs.map((element) {
      final _orderData = element.data();

      return GigOrder.fromJson(_orderData as Map<String, dynamic>);
    }).toList();
  }

  // Getting all calendar appointments
  Future<GigAppointment> getCalendarAppointment(
    GigOrder gigOrder,
  ) async {
    final _gigOrderId = gigOrder.gigOrderId;
    final _gigOrderAppointment = gigOrder.gigOrderAppointment;

    if (_gigOrderId != null) {
      final appointmentRef = getAppointmentCollections(_gigOrderId);
      final appointmentDoc =
          await appointmentRef.doc(_gigOrderAppointment).get();
      final appointmentData = appointmentDoc.data();

      return GigAppointment.fromJson(
        appointmentData as Map<String, dynamic>,
      );
    } else {
      throw UnimplementedError();
    }
  }

  // Stream for all gigs based on clientId
  Stream getGigsRealtime(Client client) {
    log.v('client for gig stream: $client');

    gigsCollection.snapshots().listen(
      (gigsSnapshot) {
        if (gigsSnapshot.docs.isNotEmpty) {
          log.v('gigSnaphot not empty');

          var gigs = gigsSnapshot.docs
              .map((snapshot) =>
                  Gig.fromJson(snapshot.data() as Map<String, dynamic>))
              .where((mappedItem) =>
                  mappedItem.gigVendorId == client.clientVendorId)
              .toList();

          log.v('gigSnapshot mapped properly');

          _gigsController.add(gigs);
          log.v('Added gigs to controller: $gigs');
        }
      },
    );

    return _gigsController.stream;
  }

  // Stream for current user
  Stream getUserRealtime(String clientId) {
    log.v('client for user stream $clientId');

    userCollection.snapshots().listen(
      (userSnapshot) {
        if (userSnapshot.docs.isNotEmpty) {
          var user = userSnapshot.docs
              .map((snapshot) =>
                  Client.fromJson(snapshot.data() as Map<String, dynamic>))
              // .where((mappedItem) => mappedItem.clientId == clientId)
              .firstWhereOrNull(
                  (mappedItem) => mappedItem.clientId == clientId);

          log.v('user retrieved from firebase');

          _clientController.add(
            user ??
                Client(
                    clientId: 'anonymous',
                    clientType: 'anonymous',
                    clientRegistrationDate: 'anonymous'),
          );
        }
      },
    );

    return _clientController.stream;
  }

  // Firebase functions for CRUD

  // Creating a user
  Future<void> createUser({required Client client}) async {
    log.i('client:$client');

    try {
      final userDocument = userCollection.doc(client.clientId);
      await userDocument.set(client.toJson());
      log.v('User created at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      );
    }
  }

  // Saving the users adderss
  Future<bool> saveAddress({
    required Address address,
    Client? user,
    Gig? gig,
  }) async {
    log.i('Saved address: $address');

    try {
      if (user != null && gig == null) {
        final addressDoc = getAddressCollectionForUser(user.clientId).doc();
        final newAddressId = addressDoc.id;
        log.v('Address will be stored with id:$newAddressId');

        await addressDoc.set(
          address.copyWith(id: newAddressId).toJson(),
        );

        final hasDefaultAddress = user.hasAddress;

        if (!hasDefaultAddress) {
          log.v('User has not default address, set current to default');

          await userCollection.doc(user.clientId).set(
                user.copyWith(clientAddress: newAddressId).toJson(),
              );
          log.v('User ${user.clientId} defaultAddress set to $newAddressId');
        }

        return true;
      } else if (gig != null) {
        log.v('See gig loaded from form: $gig');
        final addressDoc = getAddressCollectionForGig(gig.gigId!).doc();
        final newAddressId = addressDoc.id;
        log.v('Address will be stored with id:$newAddressId');

        await addressDoc.set(
          address.copyWith(id: newAddressId).toJson(),
        );

        await gigsCollection.doc(gig.gigId).update(
              gig.copyWith(gigLocation: newAddressId).toJson(),
            );

        _gigService.addGigLocation(newAddressId);

        log.i('addressView check: ${_gigService.currentGig}');

        return true;
      }

      return false;
    } on Exception catch (e) {
      log.e('We could not save the users addres. $e');

      return false;
    }
  }

  // Saving/editing the client's business
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
        vendorRegistrationDate: business.businessRegistrationDate,
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
              clientType: describeEnum(ClientType.business),
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

  // Add a vendor's gig
  Future<bool> addGig({required Gig gig}) async {
    log.i('Gig loaded: $gig');

    if (gig.gigId == null || gig.gigId == '') {
      final gigDoc = gigsCollection.doc();
      final newGigId = gigDoc.id;
      log.v('newGigId will be $newGigId');

      try {
        await gigDoc.set(gig.copyWith(gigId: newGigId).toJson());
        log.v('Gig will be stored at id: $newGigId');

        _gigService.addGigId(newGigId);

        return true;
      } on Exception catch (e) {
        log.e('We could no add the gig. $e');

        return false;
      }
    } else if (gig.gigId != null) {
      final gigDoc = gigsCollection.doc(gig.gigId);

      try {
        await gigDoc.update(gig.toJson());

        return true;
      } on Exception catch (e) {
        log.e('We could not update the gig. $e');

        return false;
      }
    }

    return false;
  }

  // Updating user avatar
  Future<bool> addUserAvatar({
    required Client client,
    required String avatarUrl,
  }) async {
    log.i('client loaded: $client');

    try {
      final userDocument = userCollection.doc(client.clientId);
      await userDocument.update(
        client.copyWith(clientAvatar: avatarUrl).toJson(),
      );

      return true;
    } catch (e) {
      throw FirestoreApiException(
          message: 'Failed to upload user avatar', devDetails: '$e');
    }
  }

  // Adding an order
  Future<bool> createOder(
    GigOrder gigOrder,
    GigAppointment gigAppointment,
  ) async {
    log.i('Loaded gigOrder');

    try {
      DocumentReference gigOrderDoc = ordersCollection.doc();
      final String newGigOrderId = gigOrderDoc.id;
      log.v('newGigOrder will be added at $newGigOrderId');

      GigOrder _gigOrder = gigOrder.copyWith(gigOrderId: newGigOrderId);

      await gigOrderDoc.set(_gigOrder.toJson());

      final String _appointmentId = await addAppointmentToOrder(
        newGigOrderId,
        gigAppointment,
      );

      gigOrderDoc = ordersCollection.doc(newGigOrderId);
      _gigOrder = _gigOrder.copyWith(
        gigOrderAppointment: _appointmentId,
      );

      await gigOrderDoc.set(_gigOrder.toJson());
      log.v('gigOrder later set at $_gigOrder at $_appointmentId');

      return true;
    } catch (error) {
      throw FirestoreApiException(
        message: 'Failed to add order',
        devDetails: '$error',
      );
    }
  }

  // Add an appointement item
  Future<String> addAppointmentToOrder(
    String gigOrderId,
    GigAppointment gigAppointment,
  ) async {
    log.i('Loaded $gigAppointment');

    final appointmentCollection = getAppointmentCollections(gigOrderId);
    final appointmentDoc = appointmentCollection.doc();
    final newAppointmentId = appointmentDoc.id;
    log.v('New appointment at $newAppointmentId');

    final _gigAppointment = gigAppointment.copyWith(
      gigAppointmentId: newAppointmentId,
    );

    await appointmentDoc.set(_gigAppointment.toJson());
    return newAppointmentId;
  }

  // Deleting a vendor's gig
  Future deleteGig(String gigId) async {
    log.v('got gigId: $gigId');
    await gigsCollection.doc(gigId).delete();
  }

  // Updating a vendor's gig
  Future updateGig(Gig gig) async {
    await gigsCollection.doc(gig.gigId).update(gig.toJson());
  }

  // Other firebase functions //////////////////////////////////////////////////

  // Check if the city is serviced
  Future<bool> isCityServiced({required String city}) {
    return Future.value(false);
  }
}
