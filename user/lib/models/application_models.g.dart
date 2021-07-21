// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Client _$_$_ClientFromJson(Map<String, dynamic> json) {
  return _$_Client(
    clientId: json['clientId'] as String,
    clientType: json['clientType'] as String,
    clientEmail: json['clientEmail'] as String?,
    clientName: json['clientName'] as String?,
    clientAddress: json['clientAddress'] as String?,
    clientPhone: json['clientPhone'] as String?,
    clientAvatar: json['clientAvatar'] as String?,
    clientPaymentInfo: json['clientPaymentInfo'] as String?,
  );
}

Map<String, dynamic> _$_$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'clientType': instance.clientType,
      'clientEmail': instance.clientEmail,
      'clientName': instance.clientName,
      'clientAddress': instance.clientAddress,
      'clientPhone': instance.clientPhone,
      'clientAvatar': instance.clientAvatar,
      'clientPaymentInfo': instance.clientPaymentInfo,
    };

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as String?,
    placeId: json['placeId'] as String,
    latitude: (json['latitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    street: json['street'] as String?,
    streetNumber: json['streetNumber'] as String?,
    city: json['city'] as String?,
    state: json['state'] as String?,
    postalCode: json['postalCode'] as String?,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'street': instance.street,
      'streetNumber': instance.streetNumber,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
    };
