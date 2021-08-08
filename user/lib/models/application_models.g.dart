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
    gigDescription: json['gigDescription'] as String?,
    gigPhotos:
        (json['gigPhotos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    gigFaqs: (json['gigFaqs'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    gigReviews: (json['gigReviews'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    gigCategory: json['gigCategory'] as String?,
    gigServiceType: json['gigServiceType'] as String?,
    gigPrice: (json['gigPrice'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as Map<String, dynamic>),
    ),
    gigQuote: json['gigQuote'] as bool?,
    gigLocation: json['gigLocation'] as String?,
    gigRating: (json['gigRating'] as num?)?.toDouble(),
    gigRatingNumber: json['gigRatingNumber'] as int?,
  );
}

Map<String, dynamic> _$_$_GigsToJson(_$_Gigs instance) => <String, dynamic>{
      'gigId': instance.gigId,
      'gigVendorId': instance.gigVendorId,
      'gigTitle': instance.gigTitle,
      'gigDescription': instance.gigDescription,
      'gigPhotos': instance.gigPhotos,
      'gigFaqs': instance.gigFaqs,
      'gigReviews': instance.gigReviews,
      'gigCategory': instance.gigCategory,
      'gigServiceType': instance.gigServiceType,
      'gigPrice': instance.gigPrice,
      'gigQuote': instance.gigQuote,
      'gigLocation': instance.gigLocation,
      'gigRating': instance.gigRating,
      'gigRatingNumber': instance.gigRatingNumber,
    };

_$_Service _$_$_ServiceFromJson(Map<String, dynamic> json) {
  return _$_Service(
    serviceId: json['serviceId'] as String?,
    serviceName: json['serviceName'] as String?,
    serviceCategory: json['serviceCategory'] as String?,
    serviceSubcategory: json['serviceSubcategory'] as String?,
    servicePriceTypes: (json['servicePriceTypes'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$_$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'serviceCategory': instance.serviceCategory,
      'serviceSubcategory': instance.serviceSubcategory,
      'servicePriceTypes': instance.servicePriceTypes,
    };

_$_ServiceSubCategory _$_$_ServiceSubCategoryFromJson(
    Map<String, dynamic> json) {
  return _$_ServiceSubCategory(
    serviceSubCategoryId: json['serviceSubCategoryId'] as String?,
    serviceSubCategoryName: json['serviceSubCategoryName'] as String?,
    serviceSubCategoryPhoto: json['serviceSubCategoryPhoto'] as String?,
    serviceSuggestedFeatures:
        (json['serviceSuggestedFeatures'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    serviceSuggestedFeaturesTypes:
        (json['serviceSuggestedFeaturesTypes'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
    serviceSugggestedQuoteDetails:
        (json['serviceSugggestedQuoteDetails'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
  );
}

Map<String, dynamic> _$_$_ServiceSubCategoryToJson(
        _$_ServiceSubCategory instance) =>
    <String, dynamic>{
      'serviceSubCategoryId': instance.serviceSubCategoryId,
      'serviceSubCategoryName': instance.serviceSubCategoryName,
      'serviceSubCategoryPhoto': instance.serviceSubCategoryPhoto,
      'serviceSuggestedFeatures': instance.serviceSuggestedFeatures,
      'serviceSuggestedFeaturesTypes': instance.serviceSuggestedFeaturesTypes,
      'serviceSugggestedQuoteDetails': instance.serviceSugggestedQuoteDetails,
    };

_$_ServiceFeatures _$_$_ServiceFeaturesFromJson(Map<String, dynamic> json) {
  return _$_ServiceFeatures(
    serviceFeatureName: json['serviceFeatureName'] as String?,
    serviceFeatureType: json['serviceFeatureType'] as String?,
    serviceFeatureValue: json['serviceFeatureValue'] as String?,
  );
}

Map<String, dynamic> _$_$_ServiceFeaturesToJson(_$_ServiceFeatures instance) =>
    <String, dynamic>{
      'serviceFeatureName': instance.serviceFeatureName,
      'serviceFeatureType': instance.serviceFeatureType,
      'serviceFeatureValue': instance.serviceFeatureValue,
    };

_$_GigPagination _$_$_GigPaginationFromJson(Map<String, dynamic> json) {
  return _$_GigPagination(
    gigs: (json['gigs'] as List<dynamic>?)
        ?.map((e) => Gig.fromJson(e as Map<String, dynamic>))
        .toList(),
    page: json['page'] as int?,
    errorMessage: json['errorMessage'] as String?,
  );
}

Map<String, dynamic> _$_$_GigPaginationToJson(_$_GigPagination instance) =>
    <String, dynamic>{
      'gigs': instance.gigs,
      'page': instance.page,
      'errorMessage': instance.errorMessage,
    };
