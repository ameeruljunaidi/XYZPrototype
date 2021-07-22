import 'package:flutter/foundation.dart';

// Firestore keys
const String UsersFirestoreKey = 'clients';
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
String defaultRegistrationDate = DateTime.now().toIso8601String();
