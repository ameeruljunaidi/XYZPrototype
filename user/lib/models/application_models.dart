import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class Client with _$Client {
  Client._();

  factory Client({
    required String clientId,
    required String clientType,
    required String clientRegistrationDate,
    String? clientEmail,
    String? clientName,
    String? clientAddress,
    String? clientPhone,
    String? clientAvatar,
    String? clientPaymentInfo,
    String? clientBusinessId,
    String? clientVendorId,
  }) = _Client;

  bool get hasAddress => clientAddress?.isNotEmpty ?? false;
  bool get isBusiness => clientBusinessId?.isNotEmpty ?? false;

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

@freezed
class Business with _$Business {
  factory Business({
    required String businessRegistrationDate,
    String? businessId,
    String? businessName,
    String? businessEmail,
    String? businessPhone,
    Address? businessAddress,
    String? businessDescription,
    String? businessWebsite,
    List<String>? businessPhotos,
    String? businessAvatar,
    Map<String, String>? businessSocialMedias,
    Map<String, List<String>>? businessCategories,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}

@freezed
class Vendor with _$Vendor {
  factory Vendor({
    required String vendorRegistrationDate,
    String? vendorId,
    String? vendorName,
    String? vendorEmail,
    String? vendorPhone,
    Address? vendorAddress,
    List<String>? vendorPhotos,
    String? vendorAvatar,
    Map<String, String>? vendorSocialMedias,
    List<String>? vendorLanguages,
    Map<String, List<String>>? vendorAccreditations,
    String? vendorAge,
    String? vendorGender,
    List<String>? vendorSkills,
    Map<String, Map<String, String>>? vendorEducationHistory,
    Map<String, Map<String, String>>? vendorOccupationHistory,
  }) = _Vendor;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}
