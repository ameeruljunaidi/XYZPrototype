import 'package:enum_to_string/enum_to_string.dart';

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

String defaultClientType = EnumToString.convertToString(ClientType.user);
String defaultRegistrationDate = DateTime.now().toIso8601String();
