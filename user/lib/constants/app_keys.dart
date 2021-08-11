import 'package:flutter/foundation.dart';

// Firestore keys
const String UsersFirestoreKey = 'clients';
const String GigsFirestoreKey = 'gigs';
const String OrdersFirestoreKey = 'orders';
const String AppointmentFirestoreKey = 'appointment';
const String AddressFirestoreKey = 'addresses';
const String BusinessFirestoreKey = 'business';
const String VendorFirestoreKey = 'vendor';

// Clienttype keys
enum ClientType {
  user,
  business,
  vendor,
}

String defaultClientType = describeEnum(ClientType.user);
String defaultDateTime = DateTime.now().toIso8601String();
