import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:xyz_prototype/constants/app_keys.dart';

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
  bool get isBusiness => clientType == describeEnum(ClientType.business);
  bool get isAnonymous => clientEmail == null;

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
  Vendor._();

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
    bool? vendorVerifiedStatus,
    String? vendorRank,
  }) = _Vendor;

  bool get isVerified => vendorVerifiedStatus == true;

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
}

@freezed
class Gig with _$Gig {
  factory Gig({
    String? gigId,
    String? gigVendorId,
    String? gigTitle,
    String? gigDescription,
    List<String>? gigPhotos,
    Map<String, String>? gigFaqs,
    Map<String, String>? gigReviews,
    String? gigCategory,
    String? gigServiceType,
    Map<String, Map<String, dynamic>>? gigPrice,
    bool? gigQuote,
    String? gigLocation,
    double? gigRating,
    int? gigRatingNumber,
    DateTime? gigDateTimeAdded,
  }) = _Gigs;

  factory Gig.fromJson(Map<String, dynamic> json) => _$GigFromJson(json);
}

@freezed
class Service with _$Service {
  factory Service({
    String? serviceId,
    String? serviceName,
    String? serviceCategory,
    String? serviceSubcategory,
    List<String>? servicePriceTypes,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class ServiceSubCategory with _$ServiceSubCategory {
  factory ServiceSubCategory({
    String? serviceSubCategoryId,
    String? serviceSubCategoryName,
    String? serviceSubCategoryPhoto,
    List<String>? serviceSuggestedFeatures,
    List<String>? serviceSuggestedFeaturesTypes,
    List<String>? serviceSugggestedQuoteDetails,
  }) = _ServiceSubCategory;

  factory ServiceSubCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceSubCategoryFromJson(json);
}

@freezed
class ServiceFeatures with _$ServiceFeatures {
  factory ServiceFeatures({
    String? serviceFeatureName,
    String? serviceFeatureType,
    String? serviceFeatureValue,
  }) = _ServiceFeatures;

  factory ServiceFeatures.fromJson(Map<String, dynamic> json) =>
      _$ServiceFeaturesFromJson(json);
}

@freezed
class GigPagination with _$GigPagination {
  GigPagination._();

  factory GigPagination({
    List<Gig>? gigs,
    int? page,
    String? errorMessage,
  }) = _GigPagination;

  bool get refreshError => errorMessage != '' && gigs!.length <= 20;

  factory GigPagination.fromJson(Map<String, dynamic> json) =>
      _$GigPaginationFromJson(json);
}

@freezed
class GigOrder with _$GigOrder {
  factory GigOrder({
    String? gigOrderId,
    String? gigOrderGigId,
    String? gigOrderVendorId,
    String? gigOrderClientId,
    String? gigOrderAppointment,
  }) = _GigOrder;

  factory GigOrder.fromJson(Map<String, dynamic> json) =>
      _$GigOrderFromJson(json);
}

@freezed
class GigAppointment with _$GigAppointment {
  factory GigAppointment({
    String? gigAppointmentId,
    DateTime? startTime,
    DateTime? endTime,
    bool? isAllDay,
    String? subject,
    String? startTimeZone,
    String? endTimeZone,
    String? recurrenceRule,
    List<DateTime>? recurrenceExceptionDates,
    String? notes,
    String? location,
    List<Object>? resourceIds,
    Object? recurrenceId,
    Object? id,
  }) = _GigAppointment;

  factory GigAppointment.fromJson(Map<String, dynamic> json) =>
      _$GigAppointmentFromJson(json);
}
