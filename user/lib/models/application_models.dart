import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class Client with _$Client {
  Client._();

  factory Client({
    required String clientId,
    required String clientType,
    String? clientEmail,
    String? clientName,
    String? clientAddress,
    String? clientPhone,
    String? clientAvatar,
    String? clientPaymentInfo,
  }) = _Client;

  bool get hasAddress => clientAddress?.isNotEmpty ?? false;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    String? id,
    required String placeId,
    required double latitude,
    required double longitude,
    String? street,
    String? streetNumber,
    String? city,
    String? state,
    String? postalCode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
