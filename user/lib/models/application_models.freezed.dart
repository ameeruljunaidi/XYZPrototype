// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
class _$ClientTearOff {
  const _$ClientTearOff();

  _Client call(
      {required String clientId,
      required String clientType,
      required String clientRegistrationDate,
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo,
      String? clientBusinessId,
      String? clientVendorId}) {
    return _Client(
      clientId: clientId,
      clientType: clientType,
      clientRegistrationDate: clientRegistrationDate,
      clientEmail: clientEmail,
      clientName: clientName,
      clientAddress: clientAddress,
      clientPhone: clientPhone,
      clientAvatar: clientAvatar,
      clientPaymentInfo: clientPaymentInfo,
      clientBusinessId: clientBusinessId,
      clientVendorId: clientVendorId,
    );
  }

  Client fromJson(Map<String, Object> json) {
    return Client.fromJson(json);
  }
}

/// @nodoc
const $Client = _$ClientTearOff();

/// @nodoc
mixin _$Client {
  String get clientId => throw _privateConstructorUsedError;
  String get clientType => throw _privateConstructorUsedError;
  String get clientRegistrationDate => throw _privateConstructorUsedError;
  String? get clientEmail => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientAddress => throw _privateConstructorUsedError;
  String? get clientPhone => throw _privateConstructorUsedError;
  String? get clientAvatar => throw _privateConstructorUsedError;
  String? get clientPaymentInfo => throw _privateConstructorUsedError;
  String? get clientBusinessId => throw _privateConstructorUsedError;
  String? get clientVendorId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res>;
  $Res call(
      {String clientId,
      String clientType,
      String clientRegistrationDate,
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo,
      String? clientBusinessId,
      String? clientVendorId});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res> implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  final Client _value;
  // ignore: unused_field
  final $Res Function(Client) _then;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientType = freezed,
    Object? clientRegistrationDate = freezed,
    Object? clientEmail = freezed,
    Object? clientName = freezed,
    Object? clientAddress = freezed,
    Object? clientPhone = freezed,
    Object? clientAvatar = freezed,
    Object? clientPaymentInfo = freezed,
    Object? clientBusinessId = freezed,
    Object? clientVendorId = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String,
      clientRegistrationDate: clientRegistrationDate == freezed
          ? _value.clientRegistrationDate
          : clientRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: clientEmail == freezed
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAddress: clientAddress == freezed
          ? _value.clientAddress
          : clientAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: clientPhone == freezed
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAvatar: clientAvatar == freezed
          ? _value.clientAvatar
          : clientAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPaymentInfo: clientPaymentInfo == freezed
          ? _value.clientPaymentInfo
          : clientPaymentInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      clientBusinessId: clientBusinessId == freezed
          ? _value.clientBusinessId
          : clientBusinessId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVendorId: clientVendorId == freezed
          ? _value.clientVendorId
          : clientVendorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$ClientCopyWith(_Client value, $Res Function(_Client) then) =
      __$ClientCopyWithImpl<$Res>;
  @override
  $Res call(
      {String clientId,
      String clientType,
      String clientRegistrationDate,
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo,
      String? clientBusinessId,
      String? clientVendorId});
}

/// @nodoc
class __$ClientCopyWithImpl<$Res> extends _$ClientCopyWithImpl<$Res>
    implements _$ClientCopyWith<$Res> {
  __$ClientCopyWithImpl(_Client _value, $Res Function(_Client) _then)
      : super(_value, (v) => _then(v as _Client));

  @override
  _Client get _value => super._value as _Client;

  @override
  $Res call({
    Object? clientId = freezed,
    Object? clientType = freezed,
    Object? clientRegistrationDate = freezed,
    Object? clientEmail = freezed,
    Object? clientName = freezed,
    Object? clientAddress = freezed,
    Object? clientPhone = freezed,
    Object? clientAvatar = freezed,
    Object? clientPaymentInfo = freezed,
    Object? clientBusinessId = freezed,
    Object? clientVendorId = freezed,
  }) {
    return _then(_Client(
      clientId: clientId == freezed
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String,
      clientType: clientType == freezed
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as String,
      clientRegistrationDate: clientRegistrationDate == freezed
          ? _value.clientRegistrationDate
          : clientRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      clientEmail: clientEmail == freezed
          ? _value.clientEmail
          : clientEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: clientName == freezed
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAddress: clientAddress == freezed
          ? _value.clientAddress
          : clientAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhone: clientPhone == freezed
          ? _value.clientPhone
          : clientPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      clientAvatar: clientAvatar == freezed
          ? _value.clientAvatar
          : clientAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPaymentInfo: clientPaymentInfo == freezed
          ? _value.clientPaymentInfo
          : clientPaymentInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      clientBusinessId: clientBusinessId == freezed
          ? _value.clientBusinessId
          : clientBusinessId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientVendorId: clientVendorId == freezed
          ? _value.clientVendorId
          : clientVendorId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Client extends _Client {
  _$_Client(
      {required this.clientId,
      required this.clientType,
      required this.clientRegistrationDate,
      this.clientEmail,
      this.clientName,
      this.clientAddress,
      this.clientPhone,
      this.clientAvatar,
      this.clientPaymentInfo,
      this.clientBusinessId,
      this.clientVendorId})
      : super._();

  factory _$_Client.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientFromJson(json);

  @override
  final String clientId;
  @override
  final String clientType;
  @override
  final String clientRegistrationDate;
  @override
  final String? clientEmail;
  @override
  final String? clientName;
  @override
  final String? clientAddress;
  @override
  final String? clientPhone;
  @override
  final String? clientAvatar;
  @override
  final String? clientPaymentInfo;
  @override
  final String? clientBusinessId;
  @override
  final String? clientVendorId;

  @override
  String toString() {
    return 'Client(clientId: $clientId, clientType: $clientType, clientRegistrationDate: $clientRegistrationDate, clientEmail: $clientEmail, clientName: $clientName, clientAddress: $clientAddress, clientPhone: $clientPhone, clientAvatar: $clientAvatar, clientPaymentInfo: $clientPaymentInfo, clientBusinessId: $clientBusinessId, clientVendorId: $clientVendorId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Client &&
            (identical(other.clientId, clientId) ||
                const DeepCollectionEquality()
                    .equals(other.clientId, clientId)) &&
            (identical(other.clientType, clientType) ||
                const DeepCollectionEquality()
                    .equals(other.clientType, clientType)) &&
            (identical(other.clientRegistrationDate, clientRegistrationDate) ||
                const DeepCollectionEquality().equals(
                    other.clientRegistrationDate, clientRegistrationDate)) &&
            (identical(other.clientEmail, clientEmail) ||
                const DeepCollectionEquality()
                    .equals(other.clientEmail, clientEmail)) &&
            (identical(other.clientName, clientName) ||
                const DeepCollectionEquality()
                    .equals(other.clientName, clientName)) &&
            (identical(other.clientAddress, clientAddress) ||
                const DeepCollectionEquality()
                    .equals(other.clientAddress, clientAddress)) &&
            (identical(other.clientPhone, clientPhone) ||
                const DeepCollectionEquality()
                    .equals(other.clientPhone, clientPhone)) &&
            (identical(other.clientAvatar, clientAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.clientAvatar, clientAvatar)) &&
            (identical(other.clientPaymentInfo, clientPaymentInfo) ||
                const DeepCollectionEquality()
                    .equals(other.clientPaymentInfo, clientPaymentInfo)) &&
            (identical(other.clientBusinessId, clientBusinessId) ||
                const DeepCollectionEquality()
                    .equals(other.clientBusinessId, clientBusinessId)) &&
            (identical(other.clientVendorId, clientVendorId) ||
                const DeepCollectionEquality()
                    .equals(other.clientVendorId, clientVendorId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(clientRegistrationDate) ^
      const DeepCollectionEquality().hash(clientEmail) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientAddress) ^
      const DeepCollectionEquality().hash(clientPhone) ^
      const DeepCollectionEquality().hash(clientAvatar) ^
      const DeepCollectionEquality().hash(clientPaymentInfo) ^
      const DeepCollectionEquality().hash(clientBusinessId) ^
      const DeepCollectionEquality().hash(clientVendorId);

  @JsonKey(ignore: true)
  @override
  _$ClientCopyWith<_Client> get copyWith =>
      __$ClientCopyWithImpl<_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ClientToJson(this);
  }
}

abstract class _Client extends Client {
  factory _Client(
      {required String clientId,
      required String clientType,
      required String clientRegistrationDate,
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo,
      String? clientBusinessId,
      String? clientVendorId}) = _$_Client;
  _Client._() : super._();

  factory _Client.fromJson(Map<String, dynamic> json) = _$_Client.fromJson;

  @override
  String get clientId => throw _privateConstructorUsedError;
  @override
  String get clientType => throw _privateConstructorUsedError;
  @override
  String get clientRegistrationDate => throw _privateConstructorUsedError;
  @override
  String? get clientEmail => throw _privateConstructorUsedError;
  @override
  String? get clientName => throw _privateConstructorUsedError;
  @override
  String? get clientAddress => throw _privateConstructorUsedError;
  @override
  String? get clientPhone => throw _privateConstructorUsedError;
  @override
  String? get clientAvatar => throw _privateConstructorUsedError;
  @override
  String? get clientPaymentInfo => throw _privateConstructorUsedError;
  @override
  String? get clientBusinessId => throw _privateConstructorUsedError;
  @override
  String? get clientVendorId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClientCopyWith<_Client> get copyWith => throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

  _Address call(
      {String? id,
      required String placeId,
      required double latitude,
      required double longitude,
      String? street,
      String? streetNumber,
      String? city,
      String? state,
      String? postalCode}) {
    return _Address(
      id: id,
      placeId: placeId,
      latitude: latitude,
      longitude: longitude,
      street: street,
      streetNumber: streetNumber,
      city: city,
      state: state,
      postalCode: postalCode,
    );
  }

  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  String? get id => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String? get street => throw _privateConstructorUsedError;
  String? get streetNumber => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String placeId,
      double latitude,
      double longitude,
      String? street,
      String? streetNumber,
      String? city,
      String? state,
      String? postalCode});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? street = freezed,
    Object? streetNumber = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      streetNumber: streetNumber == freezed
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String placeId,
      double latitude,
      double longitude,
      String? street,
      String? streetNumber,
      String? city,
      String? state,
      String? postalCode});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object? id = freezed,
    Object? placeId = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? street = freezed,
    Object? streetNumber = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
  }) {
    return _then(_Address(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      streetNumber: streetNumber == freezed
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: postalCode == freezed
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.id,
      required this.placeId,
      required this.latitude,
      required this.longitude,
      this.street,
      this.streetNumber,
      this.city,
      this.state,
      this.postalCode});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  final String? id;
  @override
  final String placeId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String? street;
  @override
  final String? streetNumber;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;

  @override
  String toString() {
    return 'Address(id: $id, placeId: $placeId, latitude: $latitude, longitude: $longitude, street: $street, streetNumber: $streetNumber, city: $city, state: $state, postalCode: $postalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality()
                    .equals(other.placeId, placeId)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.streetNumber, streetNumber) ||
                const DeepCollectionEquality()
                    .equals(other.streetNumber, streetNumber)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(placeId) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(streetNumber) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(postalCode);

  @JsonKey(ignore: true)
  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {String? id,
      required String placeId,
      required double latitude,
      required double longitude,
      String? street,
      String? streetNumber,
      String? city,
      String? state,
      String? postalCode}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get placeId => throw _privateConstructorUsedError;
  @override
  double get latitude => throw _privateConstructorUsedError;
  @override
  double get longitude => throw _privateConstructorUsedError;
  @override
  String? get street => throw _privateConstructorUsedError;
  @override
  String? get streetNumber => throw _privateConstructorUsedError;
  @override
  String? get city => throw _privateConstructorUsedError;
  @override
  String? get state => throw _privateConstructorUsedError;
  @override
  String? get postalCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddressCopyWith<_Address> get copyWith =>
      throw _privateConstructorUsedError;
}

Business _$BusinessFromJson(Map<String, dynamic> json) {
  return _Business.fromJson(json);
}

/// @nodoc
class _$BusinessTearOff {
  const _$BusinessTearOff();

  _Business call(
      {required String businessRegistrationDate,
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
      Map<String, List<String>>? businessCategories}) {
    return _Business(
      businessRegistrationDate: businessRegistrationDate,
      businessId: businessId,
      businessName: businessName,
      businessEmail: businessEmail,
      businessPhone: businessPhone,
      businessAddress: businessAddress,
      businessDescription: businessDescription,
      businessWebsite: businessWebsite,
      businessPhotos: businessPhotos,
      businessAvatar: businessAvatar,
      businessSocialMedias: businessSocialMedias,
      businessCategories: businessCategories,
    );
  }

  Business fromJson(Map<String, Object> json) {
    return Business.fromJson(json);
  }
}

/// @nodoc
const $Business = _$BusinessTearOff();

/// @nodoc
mixin _$Business {
  String get businessRegistrationDate => throw _privateConstructorUsedError;
  String? get businessId => throw _privateConstructorUsedError;
  String? get businessName => throw _privateConstructorUsedError;
  String? get businessEmail => throw _privateConstructorUsedError;
  String? get businessPhone => throw _privateConstructorUsedError;
  Address? get businessAddress => throw _privateConstructorUsedError;
  String? get businessDescription => throw _privateConstructorUsedError;
  String? get businessWebsite => throw _privateConstructorUsedError;
  List<String>? get businessPhotos => throw _privateConstructorUsedError;
  String? get businessAvatar => throw _privateConstructorUsedError;
  Map<String, String>? get businessSocialMedias =>
      throw _privateConstructorUsedError;
  Map<String, List<String>>? get businessCategories =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessCopyWith<Business> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessCopyWith<$Res> {
  factory $BusinessCopyWith(Business value, $Res Function(Business) then) =
      _$BusinessCopyWithImpl<$Res>;
  $Res call(
      {String businessRegistrationDate,
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
      Map<String, List<String>>? businessCategories});

  $AddressCopyWith<$Res>? get businessAddress;
}

/// @nodoc
class _$BusinessCopyWithImpl<$Res> implements $BusinessCopyWith<$Res> {
  _$BusinessCopyWithImpl(this._value, this._then);

  final Business _value;
  // ignore: unused_field
  final $Res Function(Business) _then;

  @override
  $Res call({
    Object? businessRegistrationDate = freezed,
    Object? businessId = freezed,
    Object? businessName = freezed,
    Object? businessEmail = freezed,
    Object? businessPhone = freezed,
    Object? businessAddress = freezed,
    Object? businessDescription = freezed,
    Object? businessWebsite = freezed,
    Object? businessPhotos = freezed,
    Object? businessAvatar = freezed,
    Object? businessSocialMedias = freezed,
    Object? businessCategories = freezed,
  }) {
    return _then(_value.copyWith(
      businessRegistrationDate: businessRegistrationDate == freezed
          ? _value.businessRegistrationDate
          : businessRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: businessId == freezed
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: businessName == freezed
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessEmail: businessEmail == freezed
          ? _value.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: businessPhone == freezed
          ? _value.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: businessAddress == freezed
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      businessDescription: businessDescription == freezed
          ? _value.businessDescription
          : businessDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      businessWebsite: businessWebsite == freezed
          ? _value.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhotos: businessPhotos == freezed
          ? _value.businessPhotos
          : businessPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      businessAvatar: businessAvatar == freezed
          ? _value.businessAvatar
          : businessAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      businessSocialMedias: businessSocialMedias == freezed
          ? _value.businessSocialMedias
          : businessSocialMedias // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      businessCategories: businessCategories == freezed
          ? _value.businessCategories
          : businessCategories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }

  @override
  $AddressCopyWith<$Res>? get businessAddress {
    if (_value.businessAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.businessAddress!, (value) {
      return _then(_value.copyWith(businessAddress: value));
    });
  }
}

/// @nodoc
abstract class _$BusinessCopyWith<$Res> implements $BusinessCopyWith<$Res> {
  factory _$BusinessCopyWith(_Business value, $Res Function(_Business) then) =
      __$BusinessCopyWithImpl<$Res>;
  @override
  $Res call(
      {String businessRegistrationDate,
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
      Map<String, List<String>>? businessCategories});

  @override
  $AddressCopyWith<$Res>? get businessAddress;
}

/// @nodoc
class __$BusinessCopyWithImpl<$Res> extends _$BusinessCopyWithImpl<$Res>
    implements _$BusinessCopyWith<$Res> {
  __$BusinessCopyWithImpl(_Business _value, $Res Function(_Business) _then)
      : super(_value, (v) => _then(v as _Business));

  @override
  _Business get _value => super._value as _Business;

  @override
  $Res call({
    Object? businessRegistrationDate = freezed,
    Object? businessId = freezed,
    Object? businessName = freezed,
    Object? businessEmail = freezed,
    Object? businessPhone = freezed,
    Object? businessAddress = freezed,
    Object? businessDescription = freezed,
    Object? businessWebsite = freezed,
    Object? businessPhotos = freezed,
    Object? businessAvatar = freezed,
    Object? businessSocialMedias = freezed,
    Object? businessCategories = freezed,
  }) {
    return _then(_Business(
      businessRegistrationDate: businessRegistrationDate == freezed
          ? _value.businessRegistrationDate
          : businessRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      businessId: businessId == freezed
          ? _value.businessId
          : businessId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessName: businessName == freezed
          ? _value.businessName
          : businessName // ignore: cast_nullable_to_non_nullable
              as String?,
      businessEmail: businessEmail == freezed
          ? _value.businessEmail
          : businessEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhone: businessPhone == freezed
          ? _value.businessPhone
          : businessPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      businessAddress: businessAddress == freezed
          ? _value.businessAddress
          : businessAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      businessDescription: businessDescription == freezed
          ? _value.businessDescription
          : businessDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      businessWebsite: businessWebsite == freezed
          ? _value.businessWebsite
          : businessWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      businessPhotos: businessPhotos == freezed
          ? _value.businessPhotos
          : businessPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      businessAvatar: businessAvatar == freezed
          ? _value.businessAvatar
          : businessAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      businessSocialMedias: businessSocialMedias == freezed
          ? _value.businessSocialMedias
          : businessSocialMedias // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      businessCategories: businessCategories == freezed
          ? _value.businessCategories
          : businessCategories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Business implements _Business {
  _$_Business(
      {required this.businessRegistrationDate,
      this.businessId,
      this.businessName,
      this.businessEmail,
      this.businessPhone,
      this.businessAddress,
      this.businessDescription,
      this.businessWebsite,
      this.businessPhotos,
      this.businessAvatar,
      this.businessSocialMedias,
      this.businessCategories});

  factory _$_Business.fromJson(Map<String, dynamic> json) =>
      _$_$_BusinessFromJson(json);

  @override
  final String businessRegistrationDate;
  @override
  final String? businessId;
  @override
  final String? businessName;
  @override
  final String? businessEmail;
  @override
  final String? businessPhone;
  @override
  final Address? businessAddress;
  @override
  final String? businessDescription;
  @override
  final String? businessWebsite;
  @override
  final List<String>? businessPhotos;
  @override
  final String? businessAvatar;
  @override
  final Map<String, String>? businessSocialMedias;
  @override
  final Map<String, List<String>>? businessCategories;

  @override
  String toString() {
    return 'Business(businessRegistrationDate: $businessRegistrationDate, businessId: $businessId, businessName: $businessName, businessEmail: $businessEmail, businessPhone: $businessPhone, businessAddress: $businessAddress, businessDescription: $businessDescription, businessWebsite: $businessWebsite, businessPhotos: $businessPhotos, businessAvatar: $businessAvatar, businessSocialMedias: $businessSocialMedias, businessCategories: $businessCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Business &&
            (identical(
                    other.businessRegistrationDate, businessRegistrationDate) ||
                const DeepCollectionEquality().equals(
                    other.businessRegistrationDate,
                    businessRegistrationDate)) &&
            (identical(other.businessId, businessId) ||
                const DeepCollectionEquality()
                    .equals(other.businessId, businessId)) &&
            (identical(other.businessName, businessName) ||
                const DeepCollectionEquality()
                    .equals(other.businessName, businessName)) &&
            (identical(other.businessEmail, businessEmail) ||
                const DeepCollectionEquality()
                    .equals(other.businessEmail, businessEmail)) &&
            (identical(other.businessPhone, businessPhone) ||
                const DeepCollectionEquality()
                    .equals(other.businessPhone, businessPhone)) &&
            (identical(other.businessAddress, businessAddress) ||
                const DeepCollectionEquality()
                    .equals(other.businessAddress, businessAddress)) &&
            (identical(other.businessDescription, businessDescription) ||
                const DeepCollectionEquality()
                    .equals(other.businessDescription, businessDescription)) &&
            (identical(other.businessWebsite, businessWebsite) ||
                const DeepCollectionEquality()
                    .equals(other.businessWebsite, businessWebsite)) &&
            (identical(other.businessPhotos, businessPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.businessPhotos, businessPhotos)) &&
            (identical(other.businessAvatar, businessAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.businessAvatar, businessAvatar)) &&
            (identical(other.businessSocialMedias, businessSocialMedias) ||
                const DeepCollectionEquality().equals(
                    other.businessSocialMedias, businessSocialMedias)) &&
            (identical(other.businessCategories, businessCategories) ||
                const DeepCollectionEquality()
                    .equals(other.businessCategories, businessCategories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(businessRegistrationDate) ^
      const DeepCollectionEquality().hash(businessId) ^
      const DeepCollectionEquality().hash(businessName) ^
      const DeepCollectionEquality().hash(businessEmail) ^
      const DeepCollectionEquality().hash(businessPhone) ^
      const DeepCollectionEquality().hash(businessAddress) ^
      const DeepCollectionEquality().hash(businessDescription) ^
      const DeepCollectionEquality().hash(businessWebsite) ^
      const DeepCollectionEquality().hash(businessPhotos) ^
      const DeepCollectionEquality().hash(businessAvatar) ^
      const DeepCollectionEquality().hash(businessSocialMedias) ^
      const DeepCollectionEquality().hash(businessCategories);

  @JsonKey(ignore: true)
  @override
  _$BusinessCopyWith<_Business> get copyWith =>
      __$BusinessCopyWithImpl<_Business>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BusinessToJson(this);
  }
}

abstract class _Business implements Business {
  factory _Business(
      {required String businessRegistrationDate,
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
      Map<String, List<String>>? businessCategories}) = _$_Business;

  factory _Business.fromJson(Map<String, dynamic> json) = _$_Business.fromJson;

  @override
  String get businessRegistrationDate => throw _privateConstructorUsedError;
  @override
  String? get businessId => throw _privateConstructorUsedError;
  @override
  String? get businessName => throw _privateConstructorUsedError;
  @override
  String? get businessEmail => throw _privateConstructorUsedError;
  @override
  String? get businessPhone => throw _privateConstructorUsedError;
  @override
  Address? get businessAddress => throw _privateConstructorUsedError;
  @override
  String? get businessDescription => throw _privateConstructorUsedError;
  @override
  String? get businessWebsite => throw _privateConstructorUsedError;
  @override
  List<String>? get businessPhotos => throw _privateConstructorUsedError;
  @override
  String? get businessAvatar => throw _privateConstructorUsedError;
  @override
  Map<String, String>? get businessSocialMedias =>
      throw _privateConstructorUsedError;
  @override
  Map<String, List<String>>? get businessCategories =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BusinessCopyWith<_Business> get copyWith =>
      throw _privateConstructorUsedError;
}

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendor.fromJson(json);
}

/// @nodoc
class _$VendorTearOff {
  const _$VendorTearOff();

  _Vendor call(
      {required String vendorRegistrationDate,
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
      Map<String, Map<String, String>>? vendorOccupationHistory}) {
    return _Vendor(
      vendorRegistrationDate: vendorRegistrationDate,
      vendorId: vendorId,
      vendorName: vendorName,
      vendorEmail: vendorEmail,
      vendorPhone: vendorPhone,
      vendorAddress: vendorAddress,
      vendorPhotos: vendorPhotos,
      vendorAvatar: vendorAvatar,
      vendorSocialMedias: vendorSocialMedias,
      vendorLanguages: vendorLanguages,
      vendorAccreditations: vendorAccreditations,
      vendorAge: vendorAge,
      vendorGender: vendorGender,
      vendorSkills: vendorSkills,
      vendorEducationHistory: vendorEducationHistory,
      vendorOccupationHistory: vendorOccupationHistory,
    );
  }

  Vendor fromJson(Map<String, Object> json) {
    return Vendor.fromJson(json);
  }
}

/// @nodoc
const $Vendor = _$VendorTearOff();

/// @nodoc
mixin _$Vendor {
  String get vendorRegistrationDate => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  String? get vendorEmail => throw _privateConstructorUsedError;
  String? get vendorPhone => throw _privateConstructorUsedError;
  Address? get vendorAddress => throw _privateConstructorUsedError;
  List<String>? get vendorPhotos => throw _privateConstructorUsedError;
  String? get vendorAvatar => throw _privateConstructorUsedError;
  Map<String, String>? get vendorSocialMedias =>
      throw _privateConstructorUsedError;
  List<String>? get vendorLanguages => throw _privateConstructorUsedError;
  Map<String, List<String>>? get vendorAccreditations =>
      throw _privateConstructorUsedError;
  String? get vendorAge => throw _privateConstructorUsedError;
  String? get vendorGender => throw _privateConstructorUsedError;
  List<String>? get vendorSkills => throw _privateConstructorUsedError;
  Map<String, Map<String, String>>? get vendorEducationHistory =>
      throw _privateConstructorUsedError;
  Map<String, Map<String, String>>? get vendorOccupationHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res>;
  $Res call(
      {String vendorRegistrationDate,
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
      Map<String, Map<String, String>>? vendorOccupationHistory});

  $AddressCopyWith<$Res>? get vendorAddress;
}

/// @nodoc
class _$VendorCopyWithImpl<$Res> implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  final Vendor _value;
  // ignore: unused_field
  final $Res Function(Vendor) _then;

  @override
  $Res call({
    Object? vendorRegistrationDate = freezed,
    Object? vendorId = freezed,
    Object? vendorName = freezed,
    Object? vendorEmail = freezed,
    Object? vendorPhone = freezed,
    Object? vendorAddress = freezed,
    Object? vendorPhotos = freezed,
    Object? vendorAvatar = freezed,
    Object? vendorSocialMedias = freezed,
    Object? vendorLanguages = freezed,
    Object? vendorAccreditations = freezed,
    Object? vendorAge = freezed,
    Object? vendorGender = freezed,
    Object? vendorSkills = freezed,
    Object? vendorEducationHistory = freezed,
    Object? vendorOccupationHistory = freezed,
  }) {
    return _then(_value.copyWith(
      vendorRegistrationDate: vendorRegistrationDate == freezed
          ? _value.vendorRegistrationDate
          : vendorRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: vendorName == freezed
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorEmail: vendorEmail == freezed
          ? _value.vendorEmail
          : vendorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorPhone: vendorPhone == freezed
          ? _value.vendorPhone
          : vendorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorAddress: vendorAddress == freezed
          ? _value.vendorAddress
          : vendorAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      vendorPhotos: vendorPhotos == freezed
          ? _value.vendorPhotos
          : vendorPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorAvatar: vendorAvatar == freezed
          ? _value.vendorAvatar
          : vendorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorSocialMedias: vendorSocialMedias == freezed
          ? _value.vendorSocialMedias
          : vendorSocialMedias // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      vendorLanguages: vendorLanguages == freezed
          ? _value.vendorLanguages
          : vendorLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorAccreditations: vendorAccreditations == freezed
          ? _value.vendorAccreditations
          : vendorAccreditations // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      vendorAge: vendorAge == freezed
          ? _value.vendorAge
          : vendorAge // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorGender: vendorGender == freezed
          ? _value.vendorGender
          : vendorGender // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorSkills: vendorSkills == freezed
          ? _value.vendorSkills
          : vendorSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorEducationHistory: vendorEducationHistory == freezed
          ? _value.vendorEducationHistory
          : vendorEducationHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
      vendorOccupationHistory: vendorOccupationHistory == freezed
          ? _value.vendorOccupationHistory
          : vendorOccupationHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
    ));
  }

  @override
  $AddressCopyWith<$Res>? get vendorAddress {
    if (_value.vendorAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.vendorAddress!, (value) {
      return _then(_value.copyWith(vendorAddress: value));
    });
  }
}

/// @nodoc
abstract class _$VendorCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$VendorCopyWith(_Vendor value, $Res Function(_Vendor) then) =
      __$VendorCopyWithImpl<$Res>;
  @override
  $Res call(
      {String vendorRegistrationDate,
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
      Map<String, Map<String, String>>? vendorOccupationHistory});

  @override
  $AddressCopyWith<$Res>? get vendorAddress;
}

/// @nodoc
class __$VendorCopyWithImpl<$Res> extends _$VendorCopyWithImpl<$Res>
    implements _$VendorCopyWith<$Res> {
  __$VendorCopyWithImpl(_Vendor _value, $Res Function(_Vendor) _then)
      : super(_value, (v) => _then(v as _Vendor));

  @override
  _Vendor get _value => super._value as _Vendor;

  @override
  $Res call({
    Object? vendorRegistrationDate = freezed,
    Object? vendorId = freezed,
    Object? vendorName = freezed,
    Object? vendorEmail = freezed,
    Object? vendorPhone = freezed,
    Object? vendorAddress = freezed,
    Object? vendorPhotos = freezed,
    Object? vendorAvatar = freezed,
    Object? vendorSocialMedias = freezed,
    Object? vendorLanguages = freezed,
    Object? vendorAccreditations = freezed,
    Object? vendorAge = freezed,
    Object? vendorGender = freezed,
    Object? vendorSkills = freezed,
    Object? vendorEducationHistory = freezed,
    Object? vendorOccupationHistory = freezed,
  }) {
    return _then(_Vendor(
      vendorRegistrationDate: vendorRegistrationDate == freezed
          ? _value.vendorRegistrationDate
          : vendorRegistrationDate // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorName: vendorName == freezed
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorEmail: vendorEmail == freezed
          ? _value.vendorEmail
          : vendorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorPhone: vendorPhone == freezed
          ? _value.vendorPhone
          : vendorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorAddress: vendorAddress == freezed
          ? _value.vendorAddress
          : vendorAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      vendorPhotos: vendorPhotos == freezed
          ? _value.vendorPhotos
          : vendorPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorAvatar: vendorAvatar == freezed
          ? _value.vendorAvatar
          : vendorAvatar // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorSocialMedias: vendorSocialMedias == freezed
          ? _value.vendorSocialMedias
          : vendorSocialMedias // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      vendorLanguages: vendorLanguages == freezed
          ? _value.vendorLanguages
          : vendorLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorAccreditations: vendorAccreditations == freezed
          ? _value.vendorAccreditations
          : vendorAccreditations // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>?,
      vendorAge: vendorAge == freezed
          ? _value.vendorAge
          : vendorAge // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorGender: vendorGender == freezed
          ? _value.vendorGender
          : vendorGender // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorSkills: vendorSkills == freezed
          ? _value.vendorSkills
          : vendorSkills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      vendorEducationHistory: vendorEducationHistory == freezed
          ? _value.vendorEducationHistory
          : vendorEducationHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
      vendorOccupationHistory: vendorOccupationHistory == freezed
          ? _value.vendorOccupationHistory
          : vendorOccupationHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, String>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Vendor implements _Vendor {
  _$_Vendor(
      {required this.vendorRegistrationDate,
      this.vendorId,
      this.vendorName,
      this.vendorEmail,
      this.vendorPhone,
      this.vendorAddress,
      this.vendorPhotos,
      this.vendorAvatar,
      this.vendorSocialMedias,
      this.vendorLanguages,
      this.vendorAccreditations,
      this.vendorAge,
      this.vendorGender,
      this.vendorSkills,
      this.vendorEducationHistory,
      this.vendorOccupationHistory});

  factory _$_Vendor.fromJson(Map<String, dynamic> json) =>
      _$_$_VendorFromJson(json);

  @override
  final String vendorRegistrationDate;
  @override
  final String? vendorId;
  @override
  final String? vendorName;
  @override
  final String? vendorEmail;
  @override
  final String? vendorPhone;
  @override
  final Address? vendorAddress;
  @override
  final List<String>? vendorPhotos;
  @override
  final String? vendorAvatar;
  @override
  final Map<String, String>? vendorSocialMedias;
  @override
  final List<String>? vendorLanguages;
  @override
  final Map<String, List<String>>? vendorAccreditations;
  @override
  final String? vendorAge;
  @override
  final String? vendorGender;
  @override
  final List<String>? vendorSkills;
  @override
  final Map<String, Map<String, String>>? vendorEducationHistory;
  @override
  final Map<String, Map<String, String>>? vendorOccupationHistory;

  @override
  String toString() {
    return 'Vendor(vendorRegistrationDate: $vendorRegistrationDate, vendorId: $vendorId, vendorName: $vendorName, vendorEmail: $vendorEmail, vendorPhone: $vendorPhone, vendorAddress: $vendorAddress, vendorPhotos: $vendorPhotos, vendorAvatar: $vendorAvatar, vendorSocialMedias: $vendorSocialMedias, vendorLanguages: $vendorLanguages, vendorAccreditations: $vendorAccreditations, vendorAge: $vendorAge, vendorGender: $vendorGender, vendorSkills: $vendorSkills, vendorEducationHistory: $vendorEducationHistory, vendorOccupationHistory: $vendorOccupationHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Vendor &&
            (identical(other.vendorRegistrationDate, vendorRegistrationDate) ||
                const DeepCollectionEquality().equals(
                    other.vendorRegistrationDate, vendorRegistrationDate)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.vendorName, vendorName) ||
                const DeepCollectionEquality()
                    .equals(other.vendorName, vendorName)) &&
            (identical(other.vendorEmail, vendorEmail) ||
                const DeepCollectionEquality()
                    .equals(other.vendorEmail, vendorEmail)) &&
            (identical(other.vendorPhone, vendorPhone) ||
                const DeepCollectionEquality()
                    .equals(other.vendorPhone, vendorPhone)) &&
            (identical(other.vendorAddress, vendorAddress) ||
                const DeepCollectionEquality()
                    .equals(other.vendorAddress, vendorAddress)) &&
            (identical(other.vendorPhotos, vendorPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.vendorPhotos, vendorPhotos)) &&
            (identical(other.vendorAvatar, vendorAvatar) ||
                const DeepCollectionEquality()
                    .equals(other.vendorAvatar, vendorAvatar)) &&
            (identical(other.vendorSocialMedias, vendorSocialMedias) ||
                const DeepCollectionEquality()
                    .equals(other.vendorSocialMedias, vendorSocialMedias)) &&
            (identical(other.vendorLanguages, vendorLanguages) ||
                const DeepCollectionEquality()
                    .equals(other.vendorLanguages, vendorLanguages)) &&
            (identical(other.vendorAccreditations, vendorAccreditations) ||
                const DeepCollectionEquality().equals(
                    other.vendorAccreditations, vendorAccreditations)) &&
            (identical(other.vendorAge, vendorAge) ||
                const DeepCollectionEquality()
                    .equals(other.vendorAge, vendorAge)) &&
            (identical(other.vendorGender, vendorGender) ||
                const DeepCollectionEquality()
                    .equals(other.vendorGender, vendorGender)) &&
            (identical(other.vendorSkills, vendorSkills) ||
                const DeepCollectionEquality()
                    .equals(other.vendorSkills, vendorSkills)) &&
            (identical(other.vendorEducationHistory, vendorEducationHistory) ||
                const DeepCollectionEquality().equals(
                    other.vendorEducationHistory, vendorEducationHistory)) &&
            (identical(
                    other.vendorOccupationHistory, vendorOccupationHistory) ||
                const DeepCollectionEquality().equals(
                    other.vendorOccupationHistory, vendorOccupationHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(vendorRegistrationDate) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(vendorName) ^
      const DeepCollectionEquality().hash(vendorEmail) ^
      const DeepCollectionEquality().hash(vendorPhone) ^
      const DeepCollectionEquality().hash(vendorAddress) ^
      const DeepCollectionEquality().hash(vendorPhotos) ^
      const DeepCollectionEquality().hash(vendorAvatar) ^
      const DeepCollectionEquality().hash(vendorSocialMedias) ^
      const DeepCollectionEquality().hash(vendorLanguages) ^
      const DeepCollectionEquality().hash(vendorAccreditations) ^
      const DeepCollectionEquality().hash(vendorAge) ^
      const DeepCollectionEquality().hash(vendorGender) ^
      const DeepCollectionEquality().hash(vendorSkills) ^
      const DeepCollectionEquality().hash(vendorEducationHistory) ^
      const DeepCollectionEquality().hash(vendorOccupationHistory);

  @JsonKey(ignore: true)
  @override
  _$VendorCopyWith<_Vendor> get copyWith =>
      __$VendorCopyWithImpl<_Vendor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VendorToJson(this);
  }
}

abstract class _Vendor implements Vendor {
  factory _Vendor(
      {required String vendorRegistrationDate,
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
      Map<String, Map<String, String>>? vendorOccupationHistory}) = _$_Vendor;

  factory _Vendor.fromJson(Map<String, dynamic> json) = _$_Vendor.fromJson;

  @override
  String get vendorRegistrationDate => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get vendorName => throw _privateConstructorUsedError;
  @override
  String? get vendorEmail => throw _privateConstructorUsedError;
  @override
  String? get vendorPhone => throw _privateConstructorUsedError;
  @override
  Address? get vendorAddress => throw _privateConstructorUsedError;
  @override
  List<String>? get vendorPhotos => throw _privateConstructorUsedError;
  @override
  String? get vendorAvatar => throw _privateConstructorUsedError;
  @override
  Map<String, String>? get vendorSocialMedias =>
      throw _privateConstructorUsedError;
  @override
  List<String>? get vendorLanguages => throw _privateConstructorUsedError;
  @override
  Map<String, List<String>>? get vendorAccreditations =>
      throw _privateConstructorUsedError;
  @override
  String? get vendorAge => throw _privateConstructorUsedError;
  @override
  String? get vendorGender => throw _privateConstructorUsedError;
  @override
  List<String>? get vendorSkills => throw _privateConstructorUsedError;
  @override
  Map<String, Map<String, String>>? get vendorEducationHistory =>
      throw _privateConstructorUsedError;
  @override
  Map<String, Map<String, String>>? get vendorOccupationHistory =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VendorCopyWith<_Vendor> get copyWith => throw _privateConstructorUsedError;
}

Gig _$GigFromJson(Map<String, dynamic> json) {
  return _Gigs.fromJson(json);
}

/// @nodoc
class _$GigTearOff {
  const _$GigTearOff();

  _Gigs call(
      {String? gigId,
      String? gigVendorId,
      String? gigTitle,
      String? gitSubtitle,
      String? gigDescription,
      List<String>? gigPhotos,
      List<String>? gigFeatures,
      Map<String, String>? gigFaqs,
      Map<String, double>? gigReviews,
      String? gigCategory,
      String? gigSubCategory,
      Map<String, dynamic>? gigFilters,
      Map<String, dynamic>? gigPrice,
      Address? gigLocation}) {
    return _Gigs(
      gigId: gigId,
      gigVendorId: gigVendorId,
      gigTitle: gigTitle,
      gitSubtitle: gitSubtitle,
      gigDescription: gigDescription,
      gigPhotos: gigPhotos,
      gigFeatures: gigFeatures,
      gigFaqs: gigFaqs,
      gigReviews: gigReviews,
      gigCategory: gigCategory,
      gigSubCategory: gigSubCategory,
      gigFilters: gigFilters,
      gigPrice: gigPrice,
      gigLocation: gigLocation,
    );
  }

  Gig fromJson(Map<String, Object> json) {
    return Gig.fromJson(json);
  }
}

/// @nodoc
const $Gig = _$GigTearOff();

/// @nodoc
mixin _$Gig {
  String? get gigId => throw _privateConstructorUsedError;
  String? get gigVendorId => throw _privateConstructorUsedError;
  String? get gigTitle => throw _privateConstructorUsedError;
  String? get gitSubtitle => throw _privateConstructorUsedError;
  String? get gigDescription => throw _privateConstructorUsedError;
  List<String>? get gigPhotos => throw _privateConstructorUsedError;
  List<String>? get gigFeatures => throw _privateConstructorUsedError;
  Map<String, String>? get gigFaqs => throw _privateConstructorUsedError;
  Map<String, double>? get gigReviews => throw _privateConstructorUsedError;
  String? get gigCategory => throw _privateConstructorUsedError;
  String? get gigSubCategory => throw _privateConstructorUsedError;
  Map<String, dynamic>? get gigFilters => throw _privateConstructorUsedError;
  Map<String, dynamic>? get gigPrice => throw _privateConstructorUsedError;
  Address? get gigLocation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GigCopyWith<Gig> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GigCopyWith<$Res> {
  factory $GigCopyWith(Gig value, $Res Function(Gig) then) =
      _$GigCopyWithImpl<$Res>;
  $Res call(
      {String? gigId,
      String? gigVendorId,
      String? gigTitle,
      String? gitSubtitle,
      String? gigDescription,
      List<String>? gigPhotos,
      List<String>? gigFeatures,
      Map<String, String>? gigFaqs,
      Map<String, double>? gigReviews,
      String? gigCategory,
      String? gigSubCategory,
      Map<String, dynamic>? gigFilters,
      Map<String, dynamic>? gigPrice,
      Address? gigLocation});

  $AddressCopyWith<$Res>? get gigLocation;
}

/// @nodoc
class _$GigCopyWithImpl<$Res> implements $GigCopyWith<$Res> {
  _$GigCopyWithImpl(this._value, this._then);

  final Gig _value;
  // ignore: unused_field
  final $Res Function(Gig) _then;

  @override
  $Res call({
    Object? gigId = freezed,
    Object? gigVendorId = freezed,
    Object? gigTitle = freezed,
    Object? gitSubtitle = freezed,
    Object? gigDescription = freezed,
    Object? gigPhotos = freezed,
    Object? gigFeatures = freezed,
    Object? gigFaqs = freezed,
    Object? gigReviews = freezed,
    Object? gigCategory = freezed,
    Object? gigSubCategory = freezed,
    Object? gigFilters = freezed,
    Object? gigPrice = freezed,
    Object? gigLocation = freezed,
  }) {
    return _then(_value.copyWith(
      gigId: gigId == freezed
          ? _value.gigId
          : gigId // ignore: cast_nullable_to_non_nullable
              as String?,
      gigVendorId: gigVendorId == freezed
          ? _value.gigVendorId
          : gigVendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      gigTitle: gigTitle == freezed
          ? _value.gigTitle
          : gigTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      gitSubtitle: gitSubtitle == freezed
          ? _value.gitSubtitle
          : gitSubtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      gigDescription: gigDescription == freezed
          ? _value.gigDescription
          : gigDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPhotos: gigPhotos == freezed
          ? _value.gigPhotos
          : gigPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFeatures: gigFeatures == freezed
          ? _value.gigFeatures
          : gigFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFaqs: gigFaqs == freezed
          ? _value.gigFaqs
          : gigFaqs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigReviews: gigReviews == freezed
          ? _value.gigReviews
          : gigReviews // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      gigCategory: gigCategory == freezed
          ? _value.gigCategory
          : gigCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigSubCategory: gigSubCategory == freezed
          ? _value.gigSubCategory
          : gigSubCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigFilters: gigFilters == freezed
          ? _value.gigFilters
          : gigFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      gigPrice: gigPrice == freezed
          ? _value.gigPrice
          : gigPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      gigLocation: gigLocation == freezed
          ? _value.gigLocation
          : gigLocation // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }

  @override
  $AddressCopyWith<$Res>? get gigLocation {
    if (_value.gigLocation == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.gigLocation!, (value) {
      return _then(_value.copyWith(gigLocation: value));
    });
  }
}

/// @nodoc
abstract class _$GigsCopyWith<$Res> implements $GigCopyWith<$Res> {
  factory _$GigsCopyWith(_Gigs value, $Res Function(_Gigs) then) =
      __$GigsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? gigId,
      String? gigVendorId,
      String? gigTitle,
      String? gitSubtitle,
      String? gigDescription,
      List<String>? gigPhotos,
      List<String>? gigFeatures,
      Map<String, String>? gigFaqs,
      Map<String, double>? gigReviews,
      String? gigCategory,
      String? gigSubCategory,
      Map<String, dynamic>? gigFilters,
      Map<String, dynamic>? gigPrice,
      Address? gigLocation});

  @override
  $AddressCopyWith<$Res>? get gigLocation;
}

/// @nodoc
class __$GigsCopyWithImpl<$Res> extends _$GigCopyWithImpl<$Res>
    implements _$GigsCopyWith<$Res> {
  __$GigsCopyWithImpl(_Gigs _value, $Res Function(_Gigs) _then)
      : super(_value, (v) => _then(v as _Gigs));

  @override
  _Gigs get _value => super._value as _Gigs;

  @override
  $Res call({
    Object? gigId = freezed,
    Object? gigVendorId = freezed,
    Object? gigTitle = freezed,
    Object? gitSubtitle = freezed,
    Object? gigDescription = freezed,
    Object? gigPhotos = freezed,
    Object? gigFeatures = freezed,
    Object? gigFaqs = freezed,
    Object? gigReviews = freezed,
    Object? gigCategory = freezed,
    Object? gigSubCategory = freezed,
    Object? gigFilters = freezed,
    Object? gigPrice = freezed,
    Object? gigLocation = freezed,
  }) {
    return _then(_Gigs(
      gigId: gigId == freezed
          ? _value.gigId
          : gigId // ignore: cast_nullable_to_non_nullable
              as String?,
      gigVendorId: gigVendorId == freezed
          ? _value.gigVendorId
          : gigVendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      gigTitle: gigTitle == freezed
          ? _value.gigTitle
          : gigTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      gitSubtitle: gitSubtitle == freezed
          ? _value.gitSubtitle
          : gitSubtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      gigDescription: gigDescription == freezed
          ? _value.gigDescription
          : gigDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPhotos: gigPhotos == freezed
          ? _value.gigPhotos
          : gigPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFeatures: gigFeatures == freezed
          ? _value.gigFeatures
          : gigFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFaqs: gigFaqs == freezed
          ? _value.gigFaqs
          : gigFaqs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigReviews: gigReviews == freezed
          ? _value.gigReviews
          : gigReviews // ignore: cast_nullable_to_non_nullable
              as Map<String, double>?,
      gigCategory: gigCategory == freezed
          ? _value.gigCategory
          : gigCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigSubCategory: gigSubCategory == freezed
          ? _value.gigSubCategory
          : gigSubCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigFilters: gigFilters == freezed
          ? _value.gigFilters
          : gigFilters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      gigPrice: gigPrice == freezed
          ? _value.gigPrice
          : gigPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      gigLocation: gigLocation == freezed
          ? _value.gigLocation
          : gigLocation // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gigs implements _Gigs {
  _$_Gigs(
      {this.gigId,
      this.gigVendorId,
      this.gigTitle,
      this.gitSubtitle,
      this.gigDescription,
      this.gigPhotos,
      this.gigFeatures,
      this.gigFaqs,
      this.gigReviews,
      this.gigCategory,
      this.gigSubCategory,
      this.gigFilters,
      this.gigPrice,
      this.gigLocation});

  factory _$_Gigs.fromJson(Map<String, dynamic> json) =>
      _$_$_GigsFromJson(json);

  @override
  final String? gigId;
  @override
  final String? gigVendorId;
  @override
  final String? gigTitle;
  @override
  final String? gitSubtitle;
  @override
  final String? gigDescription;
  @override
  final List<String>? gigPhotos;
  @override
  final List<String>? gigFeatures;
  @override
  final Map<String, String>? gigFaqs;
  @override
  final Map<String, double>? gigReviews;
  @override
  final String? gigCategory;
  @override
  final String? gigSubCategory;
  @override
  final Map<String, dynamic>? gigFilters;
  @override
  final Map<String, dynamic>? gigPrice;
  @override
  final Address? gigLocation;

  @override
  String toString() {
    return 'Gig(gigId: $gigId, gigVendorId: $gigVendorId, gigTitle: $gigTitle, gitSubtitle: $gitSubtitle, gigDescription: $gigDescription, gigPhotos: $gigPhotos, gigFeatures: $gigFeatures, gigFaqs: $gigFaqs, gigReviews: $gigReviews, gigCategory: $gigCategory, gigSubCategory: $gigSubCategory, gigFilters: $gigFilters, gigPrice: $gigPrice, gigLocation: $gigLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Gigs &&
            (identical(other.gigId, gigId) ||
                const DeepCollectionEquality().equals(other.gigId, gigId)) &&
            (identical(other.gigVendorId, gigVendorId) ||
                const DeepCollectionEquality()
                    .equals(other.gigVendorId, gigVendorId)) &&
            (identical(other.gigTitle, gigTitle) ||
                const DeepCollectionEquality()
                    .equals(other.gigTitle, gigTitle)) &&
            (identical(other.gitSubtitle, gitSubtitle) ||
                const DeepCollectionEquality()
                    .equals(other.gitSubtitle, gitSubtitle)) &&
            (identical(other.gigDescription, gigDescription) ||
                const DeepCollectionEquality()
                    .equals(other.gigDescription, gigDescription)) &&
            (identical(other.gigPhotos, gigPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.gigPhotos, gigPhotos)) &&
            (identical(other.gigFeatures, gigFeatures) ||
                const DeepCollectionEquality()
                    .equals(other.gigFeatures, gigFeatures)) &&
            (identical(other.gigFaqs, gigFaqs) ||
                const DeepCollectionEquality()
                    .equals(other.gigFaqs, gigFaqs)) &&
            (identical(other.gigReviews, gigReviews) ||
                const DeepCollectionEquality()
                    .equals(other.gigReviews, gigReviews)) &&
            (identical(other.gigCategory, gigCategory) ||
                const DeepCollectionEquality()
                    .equals(other.gigCategory, gigCategory)) &&
            (identical(other.gigSubCategory, gigSubCategory) ||
                const DeepCollectionEquality()
                    .equals(other.gigSubCategory, gigSubCategory)) &&
            (identical(other.gigFilters, gigFilters) ||
                const DeepCollectionEquality()
                    .equals(other.gigFilters, gigFilters)) &&
            (identical(other.gigPrice, gigPrice) ||
                const DeepCollectionEquality()
                    .equals(other.gigPrice, gigPrice)) &&
            (identical(other.gigLocation, gigLocation) ||
                const DeepCollectionEquality()
                    .equals(other.gigLocation, gigLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gigId) ^
      const DeepCollectionEquality().hash(gigVendorId) ^
      const DeepCollectionEquality().hash(gigTitle) ^
      const DeepCollectionEquality().hash(gitSubtitle) ^
      const DeepCollectionEquality().hash(gigDescription) ^
      const DeepCollectionEquality().hash(gigPhotos) ^
      const DeepCollectionEquality().hash(gigFeatures) ^
      const DeepCollectionEquality().hash(gigFaqs) ^
      const DeepCollectionEquality().hash(gigReviews) ^
      const DeepCollectionEquality().hash(gigCategory) ^
      const DeepCollectionEquality().hash(gigSubCategory) ^
      const DeepCollectionEquality().hash(gigFilters) ^
      const DeepCollectionEquality().hash(gigPrice) ^
      const DeepCollectionEquality().hash(gigLocation);

  @JsonKey(ignore: true)
  @override
  _$GigsCopyWith<_Gigs> get copyWith =>
      __$GigsCopyWithImpl<_Gigs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GigsToJson(this);
  }
}

abstract class _Gigs implements Gig {
  factory _Gigs(
      {String? gigId,
      String? gigVendorId,
      String? gigTitle,
      String? gitSubtitle,
      String? gigDescription,
      List<String>? gigPhotos,
      List<String>? gigFeatures,
      Map<String, String>? gigFaqs,
      Map<String, double>? gigReviews,
      String? gigCategory,
      String? gigSubCategory,
      Map<String, dynamic>? gigFilters,
      Map<String, dynamic>? gigPrice,
      Address? gigLocation}) = _$_Gigs;

  factory _Gigs.fromJson(Map<String, dynamic> json) = _$_Gigs.fromJson;

  @override
  String? get gigId => throw _privateConstructorUsedError;
  @override
  String? get gigVendorId => throw _privateConstructorUsedError;
  @override
  String? get gigTitle => throw _privateConstructorUsedError;
  @override
  String? get gitSubtitle => throw _privateConstructorUsedError;
  @override
  String? get gigDescription => throw _privateConstructorUsedError;
  @override
  List<String>? get gigPhotos => throw _privateConstructorUsedError;
  @override
  List<String>? get gigFeatures => throw _privateConstructorUsedError;
  @override
  Map<String, String>? get gigFaqs => throw _privateConstructorUsedError;
  @override
  Map<String, double>? get gigReviews => throw _privateConstructorUsedError;
  @override
  String? get gigCategory => throw _privateConstructorUsedError;
  @override
  String? get gigSubCategory => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get gigFilters => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get gigPrice => throw _privateConstructorUsedError;
  @override
  Address? get gigLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GigsCopyWith<_Gigs> get copyWith => throw _privateConstructorUsedError;
}
