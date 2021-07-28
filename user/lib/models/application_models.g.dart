// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Client _$_$_ClientFromJson(Map<String, dynamic> json) {
  return _$_Client(
    clientId: json['clientId'] as String,
    clientType: json['clientType'] as String,
    clientRegistrationDate: json['clientRegistrationDate'] as String,
    clientEmail: json['clientEmail'] as String?,
    clientName: json['clientName'] as String?,
    clientAddress: json['clientAddress'] as String?,
    clientPhone: json['clientPhone'] as String?,
    clientAvatar: json['clientAvatar'] as String?,
    clientPaymentInfo: json['clientPaymentInfo'] as String?,
    clientBusinessId: json['clientBusinessId'] as String?,
    clientVendorId: json['clientVendorId'] as String?,
  );
}

Map<String, dynamic> _$_$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'clientId': instance.clientId,
      'clientType': instance.clientType,
      'clientRegistrationDate': instance.clientRegistrationDate,
      'clientEmail': instance.clientEmail,
      'clientName': instance.clientName,
      'clientAddress': instance.clientAddress,
      'clientPhone': instance.clientPhone,
      'clientAvatar': instance.clientAvatar,
      'clientPaymentInfo': instance.clientPaymentInfo,
      'clientBusinessId': instance.clientBusinessId,
      'clientVendorId': instance.clientVendorId,
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

_$_Business _$_$_BusinessFromJson(Map<String, dynamic> json) {
  return _$_Business(
    businessRegistrationDate: json['businessRegistrationDate'] as String,
    businessId: json['businessId'] as String?,
    businessName: json['businessName'] as String?,
    businessEmail: json['businessEmail'] as String?,
    businessPhone: json['businessPhone'] as String?,
    businessAddress: json['businessAddress'] == null
        ? null
        : Address.fromJson(json['businessAddress'] as Map<String, dynamic>),
    businessDescription: json['businessDescription'] as String?,
    businessWebsite: json['businessWebsite'] as String?,
    businessPhotos: (json['businessPhotos'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    businessAvatar: json['businessAvatar'] as String?,
    businessSocialMedias:
        (json['businessSocialMedias'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    businessCategories:
        (json['businessCategories'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$_$_BusinessToJson(_$_Business instance) =>
    <String, dynamic>{
      'businessRegistrationDate': instance.businessRegistrationDate,
      'businessId': instance.businessId,
      'businessName': instance.businessName,
      'businessEmail': instance.businessEmail,
      'businessPhone': instance.businessPhone,
      'businessAddress': instance.businessAddress,
      'businessDescription': instance.businessDescription,
      'businessWebsite': instance.businessWebsite,
      'businessPhotos': instance.businessPhotos,
      'businessAvatar': instance.businessAvatar,
      'businessSocialMedias': instance.businessSocialMedias,
      'businessCategories': instance.businessCategories,
    };

_$_Vendor _$_$_VendorFromJson(Map<String, dynamic> json) {
  return _$_Vendor(
    vendorRegistrationDate: json['vendorRegistrationDate'] as String,
    vendorId: json['vendorId'] as String?,
    vendorName: json['vendorName'] as String?,
    vendorEmail: json['vendorEmail'] as String?,
    vendorPhone: json['vendorPhone'] as String?,
    vendorAddress: json['vendorAddress'] == null
        ? null
        : Address.fromJson(json['vendorAddress'] as Map<String, dynamic>),
    vendorPhotos: (json['vendorPhotos'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    vendorAvatar: json['vendorAvatar'] as String?,
    vendorSocialMedias:
        (json['vendorSocialMedias'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    vendorLanguages: (json['vendorLanguages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    vendorAccreditations:
        (json['vendorAccreditations'] as Map<String, dynamic>?)?.map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
    vendorAge: json['vendorAge'] as String?,
    vendorGender: json['vendorGender'] as String?,
    vendorSkills: (json['vendorSkills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    vendorEducationHistory:
        (json['vendorEducationHistory'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
    ),
    vendorOccupationHistory:
        (json['vendorOccupationHistory'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
    ),
  );
}

Map<String, dynamic> _$_$_VendorToJson(_$_Vendor instance) => <String, dynamic>{
      'vendorRegistrationDate': instance.vendorRegistrationDate,
      'vendorId': instance.vendorId,
      'vendorName': instance.vendorName,
      'vendorEmail': instance.vendorEmail,
      'vendorPhone': instance.vendorPhone,
      'vendorAddress': instance.vendorAddress,
      'vendorPhotos': instance.vendorPhotos,
      'vendorAvatar': instance.vendorAvatar,
      'vendorSocialMedias': instance.vendorSocialMedias,
      'vendorLanguages': instance.vendorLanguages,
      'vendorAccreditations': instance.vendorAccreditations,
      'vendorAge': instance.vendorAge,
      'vendorGender': instance.vendorGender,
      'vendorSkills': instance.vendorSkills,
      'vendorEducationHistory': instance.vendorEducationHistory,
      'vendorOccupationHistory': instance.vendorOccupationHistory,
    };

_$_Gigs _$_$_GigsFromJson(Map<String, dynamic> json) {
  return _$_Gigs(
    gigId: json['gigId'] as String?,
    gigVendorId: json['gigVendorId'] as String?,
    gigTitle: json['gigTitle'] as String?,
    gigSubtitle: json['gigSubtitle'] as String?,
    gigDescription: json['gigDescription'] as String?,
    gigPhotos:
        (json['gigPhotos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    gigFeatures: (json['gigFeatures'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    gigFaqs: (json['gigFaqs'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    gigReviews: (json['gigReviews'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, (e as num).toDouble()),
    ),
    gigCategory: json['gigCategory'] as String?,
    gigSubCategory: json['gigSubCategory'] as String?,
    gigFilters: json['gigFilters'] as Map<String, dynamic>?,
    gigPrice: json['gigPrice'] as Map<String, dynamic>?,
    gigLocation: json['gigLocation'] == null
        ? null
        : Address.fromJson(json['gigLocation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GigsToJson(_$_Gigs instance) => <String, dynamic>{
      'gigId': instance.gigId,
      'gigVendorId': instance.gigVendorId,
      'gigTitle': instance.gigTitle,
      'gigSubtitle': instance.gigSubtitle,
      'gigDescription': instance.gigDescription,
      'gigPhotos': instance.gigPhotos,
      'gigFeatures': instance.gigFeatures,
      'gigFaqs': instance.gigFaqs,
      'gigReviews': instance.gigReviews,
      'gigCategory': instance.gigCategory,
      'gigSubCategory': instance.gigSubCategory,
      'gigFilters': instance.gigFilters,
      'gigPrice': instance.gigPrice,
      'gigLocation': instance.gigLocation,
    };
