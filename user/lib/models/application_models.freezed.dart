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
class _$_Client extends _Client with DiagnosticableTreeMixin {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Client(clientId: $clientId, clientType: $clientType, clientRegistrationDate: $clientRegistrationDate, clientEmail: $clientEmail, clientName: $clientName, clientAddress: $clientAddress, clientPhone: $clientPhone, clientAvatar: $clientAvatar, clientPaymentInfo: $clientPaymentInfo, clientBusinessId: $clientBusinessId, clientVendorId: $clientVendorId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Client'))
      ..add(DiagnosticsProperty('clientId', clientId))
      ..add(DiagnosticsProperty('clientType', clientType))
      ..add(
          DiagnosticsProperty('clientRegistrationDate', clientRegistrationDate))
      ..add(DiagnosticsProperty('clientEmail', clientEmail))
      ..add(DiagnosticsProperty('clientName', clientName))
      ..add(DiagnosticsProperty('clientAddress', clientAddress))
      ..add(DiagnosticsProperty('clientPhone', clientPhone))
      ..add(DiagnosticsProperty('clientAvatar', clientAvatar))
      ..add(DiagnosticsProperty('clientPaymentInfo', clientPaymentInfo))
      ..add(DiagnosticsProperty('clientBusinessId', clientBusinessId))
      ..add(DiagnosticsProperty('clientVendorId', clientVendorId));
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
class _$_Address with DiagnosticableTreeMixin implements _Address {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Address(id: $id, placeId: $placeId, latitude: $latitude, longitude: $longitude, street: $street, streetNumber: $streetNumber, city: $city, state: $state, postalCode: $postalCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Address'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('placeId', placeId))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude))
      ..add(DiagnosticsProperty('street', street))
      ..add(DiagnosticsProperty('streetNumber', streetNumber))
      ..add(DiagnosticsProperty('city', city))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('postalCode', postalCode));
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
class _$_Business with DiagnosticableTreeMixin implements _Business {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Business(businessRegistrationDate: $businessRegistrationDate, businessId: $businessId, businessName: $businessName, businessEmail: $businessEmail, businessPhone: $businessPhone, businessAddress: $businessAddress, businessDescription: $businessDescription, businessWebsite: $businessWebsite, businessPhotos: $businessPhotos, businessAvatar: $businessAvatar, businessSocialMedias: $businessSocialMedias, businessCategories: $businessCategories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Business'))
      ..add(DiagnosticsProperty(
          'businessRegistrationDate', businessRegistrationDate))
      ..add(DiagnosticsProperty('businessId', businessId))
      ..add(DiagnosticsProperty('businessName', businessName))
      ..add(DiagnosticsProperty('businessEmail', businessEmail))
      ..add(DiagnosticsProperty('businessPhone', businessPhone))
      ..add(DiagnosticsProperty('businessAddress', businessAddress))
      ..add(DiagnosticsProperty('businessDescription', businessDescription))
      ..add(DiagnosticsProperty('businessWebsite', businessWebsite))
      ..add(DiagnosticsProperty('businessPhotos', businessPhotos))
      ..add(DiagnosticsProperty('businessAvatar', businessAvatar))
      ..add(DiagnosticsProperty('businessSocialMedias', businessSocialMedias))
      ..add(DiagnosticsProperty('businessCategories', businessCategories));
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
class _$_Vendor with DiagnosticableTreeMixin implements _Vendor {
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vendor(vendorRegistrationDate: $vendorRegistrationDate, vendorId: $vendorId, vendorName: $vendorName, vendorEmail: $vendorEmail, vendorPhone: $vendorPhone, vendorAddress: $vendorAddress, vendorPhotos: $vendorPhotos, vendorAvatar: $vendorAvatar, vendorSocialMedias: $vendorSocialMedias, vendorLanguages: $vendorLanguages, vendorAccreditations: $vendorAccreditations, vendorAge: $vendorAge, vendorGender: $vendorGender, vendorSkills: $vendorSkills, vendorEducationHistory: $vendorEducationHistory, vendorOccupationHistory: $vendorOccupationHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vendor'))
      ..add(
          DiagnosticsProperty('vendorRegistrationDate', vendorRegistrationDate))
      ..add(DiagnosticsProperty('vendorId', vendorId))
      ..add(DiagnosticsProperty('vendorName', vendorName))
      ..add(DiagnosticsProperty('vendorEmail', vendorEmail))
      ..add(DiagnosticsProperty('vendorPhone', vendorPhone))
      ..add(DiagnosticsProperty('vendorAddress', vendorAddress))
      ..add(DiagnosticsProperty('vendorPhotos', vendorPhotos))
      ..add(DiagnosticsProperty('vendorAvatar', vendorAvatar))
      ..add(DiagnosticsProperty('vendorSocialMedias', vendorSocialMedias))
      ..add(DiagnosticsProperty('vendorLanguages', vendorLanguages))
      ..add(DiagnosticsProperty('vendorAccreditations', vendorAccreditations))
      ..add(DiagnosticsProperty('vendorAge', vendorAge))
      ..add(DiagnosticsProperty('vendorGender', vendorGender))
      ..add(DiagnosticsProperty('vendorSkills', vendorSkills))
      ..add(
          DiagnosticsProperty('vendorEducationHistory', vendorEducationHistory))
      ..add(DiagnosticsProperty(
          'vendorOccupationHistory', vendorOccupationHistory));
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
      DateTime? gigDateTimeAdded}) {
    return _Gigs(
      gigId: gigId,
      gigVendorId: gigVendorId,
      gigTitle: gigTitle,
      gigDescription: gigDescription,
      gigPhotos: gigPhotos,
      gigFaqs: gigFaqs,
      gigReviews: gigReviews,
      gigCategory: gigCategory,
      gigServiceType: gigServiceType,
      gigPrice: gigPrice,
      gigQuote: gigQuote,
      gigLocation: gigLocation,
      gigRating: gigRating,
      gigRatingNumber: gigRatingNumber,
      gigDateTimeAdded: gigDateTimeAdded,
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
  String? get gigDescription => throw _privateConstructorUsedError;
  List<String>? get gigPhotos => throw _privateConstructorUsedError;
  Map<String, String>? get gigFaqs => throw _privateConstructorUsedError;
  Map<String, String>? get gigReviews => throw _privateConstructorUsedError;
  String? get gigCategory => throw _privateConstructorUsedError;
  String? get gigServiceType => throw _privateConstructorUsedError;
  Map<String, Map<String, dynamic>>? get gigPrice =>
      throw _privateConstructorUsedError;
  bool? get gigQuote => throw _privateConstructorUsedError;
  String? get gigLocation => throw _privateConstructorUsedError;
  double? get gigRating => throw _privateConstructorUsedError;
  int? get gigRatingNumber => throw _privateConstructorUsedError;
  DateTime? get gigDateTimeAdded => throw _privateConstructorUsedError;

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
      DateTime? gigDateTimeAdded});
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
    Object? gigDescription = freezed,
    Object? gigPhotos = freezed,
    Object? gigFaqs = freezed,
    Object? gigReviews = freezed,
    Object? gigCategory = freezed,
    Object? gigServiceType = freezed,
    Object? gigPrice = freezed,
    Object? gigQuote = freezed,
    Object? gigLocation = freezed,
    Object? gigRating = freezed,
    Object? gigRatingNumber = freezed,
    Object? gigDateTimeAdded = freezed,
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
      gigDescription: gigDescription == freezed
          ? _value.gigDescription
          : gigDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPhotos: gigPhotos == freezed
          ? _value.gigPhotos
          : gigPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFaqs: gigFaqs == freezed
          ? _value.gigFaqs
          : gigFaqs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigReviews: gigReviews == freezed
          ? _value.gigReviews
          : gigReviews // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigCategory: gigCategory == freezed
          ? _value.gigCategory
          : gigCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigServiceType: gigServiceType == freezed
          ? _value.gigServiceType
          : gigServiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPrice: gigPrice == freezed
          ? _value.gigPrice
          : gigPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>?,
      gigQuote: gigQuote == freezed
          ? _value.gigQuote
          : gigQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      gigLocation: gigLocation == freezed
          ? _value.gigLocation
          : gigLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      gigRating: gigRating == freezed
          ? _value.gigRating
          : gigRating // ignore: cast_nullable_to_non_nullable
              as double?,
      gigRatingNumber: gigRatingNumber == freezed
          ? _value.gigRatingNumber
          : gigRatingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      gigDateTimeAdded: gigDateTimeAdded == freezed
          ? _value.gigDateTimeAdded
          : gigDateTimeAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
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
      DateTime? gigDateTimeAdded});
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
    Object? gigDescription = freezed,
    Object? gigPhotos = freezed,
    Object? gigFaqs = freezed,
    Object? gigReviews = freezed,
    Object? gigCategory = freezed,
    Object? gigServiceType = freezed,
    Object? gigPrice = freezed,
    Object? gigQuote = freezed,
    Object? gigLocation = freezed,
    Object? gigRating = freezed,
    Object? gigRatingNumber = freezed,
    Object? gigDateTimeAdded = freezed,
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
      gigDescription: gigDescription == freezed
          ? _value.gigDescription
          : gigDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPhotos: gigPhotos == freezed
          ? _value.gigPhotos
          : gigPhotos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      gigFaqs: gigFaqs == freezed
          ? _value.gigFaqs
          : gigFaqs // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigReviews: gigReviews == freezed
          ? _value.gigReviews
          : gigReviews // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      gigCategory: gigCategory == freezed
          ? _value.gigCategory
          : gigCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      gigServiceType: gigServiceType == freezed
          ? _value.gigServiceType
          : gigServiceType // ignore: cast_nullable_to_non_nullable
              as String?,
      gigPrice: gigPrice == freezed
          ? _value.gigPrice
          : gigPrice // ignore: cast_nullable_to_non_nullable
              as Map<String, Map<String, dynamic>>?,
      gigQuote: gigQuote == freezed
          ? _value.gigQuote
          : gigQuote // ignore: cast_nullable_to_non_nullable
              as bool?,
      gigLocation: gigLocation == freezed
          ? _value.gigLocation
          : gigLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      gigRating: gigRating == freezed
          ? _value.gigRating
          : gigRating // ignore: cast_nullable_to_non_nullable
              as double?,
      gigRatingNumber: gigRatingNumber == freezed
          ? _value.gigRatingNumber
          : gigRatingNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      gigDateTimeAdded: gigDateTimeAdded == freezed
          ? _value.gigDateTimeAdded
          : gigDateTimeAdded // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gigs with DiagnosticableTreeMixin implements _Gigs {
  _$_Gigs(
      {this.gigId,
      this.gigVendorId,
      this.gigTitle,
      this.gigDescription,
      this.gigPhotos,
      this.gigFaqs,
      this.gigReviews,
      this.gigCategory,
      this.gigServiceType,
      this.gigPrice,
      this.gigQuote,
      this.gigLocation,
      this.gigRating,
      this.gigRatingNumber,
      this.gigDateTimeAdded});

  factory _$_Gigs.fromJson(Map<String, dynamic> json) =>
      _$_$_GigsFromJson(json);

  @override
  final String? gigId;
  @override
  final String? gigVendorId;
  @override
  final String? gigTitle;
  @override
  final String? gigDescription;
  @override
  final List<String>? gigPhotos;
  @override
  final Map<String, String>? gigFaqs;
  @override
  final Map<String, String>? gigReviews;
  @override
  final String? gigCategory;
  @override
  final String? gigServiceType;
  @override
  final Map<String, Map<String, dynamic>>? gigPrice;
  @override
  final bool? gigQuote;
  @override
  final String? gigLocation;
  @override
  final double? gigRating;
  @override
  final int? gigRatingNumber;
  @override
  final DateTime? gigDateTimeAdded;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Gig(gigId: $gigId, gigVendorId: $gigVendorId, gigTitle: $gigTitle, gigDescription: $gigDescription, gigPhotos: $gigPhotos, gigFaqs: $gigFaqs, gigReviews: $gigReviews, gigCategory: $gigCategory, gigServiceType: $gigServiceType, gigPrice: $gigPrice, gigQuote: $gigQuote, gigLocation: $gigLocation, gigRating: $gigRating, gigRatingNumber: $gigRatingNumber, gigDateTimeAdded: $gigDateTimeAdded)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Gig'))
      ..add(DiagnosticsProperty('gigId', gigId))
      ..add(DiagnosticsProperty('gigVendorId', gigVendorId))
      ..add(DiagnosticsProperty('gigTitle', gigTitle))
      ..add(DiagnosticsProperty('gigDescription', gigDescription))
      ..add(DiagnosticsProperty('gigPhotos', gigPhotos))
      ..add(DiagnosticsProperty('gigFaqs', gigFaqs))
      ..add(DiagnosticsProperty('gigReviews', gigReviews))
      ..add(DiagnosticsProperty('gigCategory', gigCategory))
      ..add(DiagnosticsProperty('gigServiceType', gigServiceType))
      ..add(DiagnosticsProperty('gigPrice', gigPrice))
      ..add(DiagnosticsProperty('gigQuote', gigQuote))
      ..add(DiagnosticsProperty('gigLocation', gigLocation))
      ..add(DiagnosticsProperty('gigRating', gigRating))
      ..add(DiagnosticsProperty('gigRatingNumber', gigRatingNumber))
      ..add(DiagnosticsProperty('gigDateTimeAdded', gigDateTimeAdded));
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
            (identical(other.gigDescription, gigDescription) ||
                const DeepCollectionEquality()
                    .equals(other.gigDescription, gigDescription)) &&
            (identical(other.gigPhotos, gigPhotos) ||
                const DeepCollectionEquality()
                    .equals(other.gigPhotos, gigPhotos)) &&
            (identical(other.gigFaqs, gigFaqs) ||
                const DeepCollectionEquality()
                    .equals(other.gigFaqs, gigFaqs)) &&
            (identical(other.gigReviews, gigReviews) ||
                const DeepCollectionEquality()
                    .equals(other.gigReviews, gigReviews)) &&
            (identical(other.gigCategory, gigCategory) ||
                const DeepCollectionEquality()
                    .equals(other.gigCategory, gigCategory)) &&
            (identical(other.gigServiceType, gigServiceType) ||
                const DeepCollectionEquality()
                    .equals(other.gigServiceType, gigServiceType)) &&
            (identical(other.gigPrice, gigPrice) ||
                const DeepCollectionEquality()
                    .equals(other.gigPrice, gigPrice)) &&
            (identical(other.gigQuote, gigQuote) ||
                const DeepCollectionEquality()
                    .equals(other.gigQuote, gigQuote)) &&
            (identical(other.gigLocation, gigLocation) ||
                const DeepCollectionEquality()
                    .equals(other.gigLocation, gigLocation)) &&
            (identical(other.gigRating, gigRating) ||
                const DeepCollectionEquality()
                    .equals(other.gigRating, gigRating)) &&
            (identical(other.gigRatingNumber, gigRatingNumber) ||
                const DeepCollectionEquality()
                    .equals(other.gigRatingNumber, gigRatingNumber)) &&
            (identical(other.gigDateTimeAdded, gigDateTimeAdded) ||
                const DeepCollectionEquality()
                    .equals(other.gigDateTimeAdded, gigDateTimeAdded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gigId) ^
      const DeepCollectionEquality().hash(gigVendorId) ^
      const DeepCollectionEquality().hash(gigTitle) ^
      const DeepCollectionEquality().hash(gigDescription) ^
      const DeepCollectionEquality().hash(gigPhotos) ^
      const DeepCollectionEquality().hash(gigFaqs) ^
      const DeepCollectionEquality().hash(gigReviews) ^
      const DeepCollectionEquality().hash(gigCategory) ^
      const DeepCollectionEquality().hash(gigServiceType) ^
      const DeepCollectionEquality().hash(gigPrice) ^
      const DeepCollectionEquality().hash(gigQuote) ^
      const DeepCollectionEquality().hash(gigLocation) ^
      const DeepCollectionEquality().hash(gigRating) ^
      const DeepCollectionEquality().hash(gigRatingNumber) ^
      const DeepCollectionEquality().hash(gigDateTimeAdded);

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
      DateTime? gigDateTimeAdded}) = _$_Gigs;

  factory _Gigs.fromJson(Map<String, dynamic> json) = _$_Gigs.fromJson;

  @override
  String? get gigId => throw _privateConstructorUsedError;
  @override
  String? get gigVendorId => throw _privateConstructorUsedError;
  @override
  String? get gigTitle => throw _privateConstructorUsedError;
  @override
  String? get gigDescription => throw _privateConstructorUsedError;
  @override
  List<String>? get gigPhotos => throw _privateConstructorUsedError;
  @override
  Map<String, String>? get gigFaqs => throw _privateConstructorUsedError;
  @override
  Map<String, String>? get gigReviews => throw _privateConstructorUsedError;
  @override
  String? get gigCategory => throw _privateConstructorUsedError;
  @override
  String? get gigServiceType => throw _privateConstructorUsedError;
  @override
  Map<String, Map<String, dynamic>>? get gigPrice =>
      throw _privateConstructorUsedError;
  @override
  bool? get gigQuote => throw _privateConstructorUsedError;
  @override
  String? get gigLocation => throw _privateConstructorUsedError;
  @override
  double? get gigRating => throw _privateConstructorUsedError;
  @override
  int? get gigRatingNumber => throw _privateConstructorUsedError;
  @override
  DateTime? get gigDateTimeAdded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GigsCopyWith<_Gigs> get copyWith => throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
class _$ServiceTearOff {
  const _$ServiceTearOff();

  _Service call(
      {String? serviceId,
      String? serviceName,
      String? serviceCategory,
      String? serviceSubcategory,
      List<String>? servicePriceTypes}) {
    return _Service(
      serviceId: serviceId,
      serviceName: serviceName,
      serviceCategory: serviceCategory,
      serviceSubcategory: serviceSubcategory,
      servicePriceTypes: servicePriceTypes,
    );
  }

  Service fromJson(Map<String, Object> json) {
    return Service.fromJson(json);
  }
}

/// @nodoc
const $Service = _$ServiceTearOff();

/// @nodoc
mixin _$Service {
  String? get serviceId => throw _privateConstructorUsedError;
  String? get serviceName => throw _privateConstructorUsedError;
  String? get serviceCategory => throw _privateConstructorUsedError;
  String? get serviceSubcategory => throw _privateConstructorUsedError;
  List<String>? get servicePriceTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res>;
  $Res call(
      {String? serviceId,
      String? serviceName,
      String? serviceCategory,
      String? serviceSubcategory,
      List<String>? servicePriceTypes});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res> implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  final Service _value;
  // ignore: unused_field
  final $Res Function(Service) _then;

  @override
  $Res call({
    Object? serviceId = freezed,
    Object? serviceName = freezed,
    Object? serviceCategory = freezed,
    Object? serviceSubcategory = freezed,
    Object? servicePriceTypes = freezed,
  }) {
    return _then(_value.copyWith(
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCategory: serviceCategory == freezed
          ? _value.serviceCategory
          : serviceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubcategory: serviceSubcategory == freezed
          ? _value.serviceSubcategory
          : serviceSubcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePriceTypes: servicePriceTypes == freezed
          ? _value.servicePriceTypes
          : servicePriceTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$ServiceCopyWith(_Service value, $Res Function(_Service) then) =
      __$ServiceCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? serviceId,
      String? serviceName,
      String? serviceCategory,
      String? serviceSubcategory,
      List<String>? servicePriceTypes});
}

/// @nodoc
class __$ServiceCopyWithImpl<$Res> extends _$ServiceCopyWithImpl<$Res>
    implements _$ServiceCopyWith<$Res> {
  __$ServiceCopyWithImpl(_Service _value, $Res Function(_Service) _then)
      : super(_value, (v) => _then(v as _Service));

  @override
  _Service get _value => super._value as _Service;

  @override
  $Res call({
    Object? serviceId = freezed,
    Object? serviceName = freezed,
    Object? serviceCategory = freezed,
    Object? serviceSubcategory = freezed,
    Object? servicePriceTypes = freezed,
  }) {
    return _then(_Service(
      serviceId: serviceId == freezed
          ? _value.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceName: serviceName == freezed
          ? _value.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceCategory: serviceCategory == freezed
          ? _value.serviceCategory
          : serviceCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubcategory: serviceSubcategory == freezed
          ? _value.serviceSubcategory
          : serviceSubcategory // ignore: cast_nullable_to_non_nullable
              as String?,
      servicePriceTypes: servicePriceTypes == freezed
          ? _value.servicePriceTypes
          : servicePriceTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Service with DiagnosticableTreeMixin implements _Service {
  _$_Service(
      {this.serviceId,
      this.serviceName,
      this.serviceCategory,
      this.serviceSubcategory,
      this.servicePriceTypes});

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceFromJson(json);

  @override
  final String? serviceId;
  @override
  final String? serviceName;
  @override
  final String? serviceCategory;
  @override
  final String? serviceSubcategory;
  @override
  final List<String>? servicePriceTypes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Service(serviceId: $serviceId, serviceName: $serviceName, serviceCategory: $serviceCategory, serviceSubcategory: $serviceSubcategory, servicePriceTypes: $servicePriceTypes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Service'))
      ..add(DiagnosticsProperty('serviceId', serviceId))
      ..add(DiagnosticsProperty('serviceName', serviceName))
      ..add(DiagnosticsProperty('serviceCategory', serviceCategory))
      ..add(DiagnosticsProperty('serviceSubcategory', serviceSubcategory))
      ..add(DiagnosticsProperty('servicePriceTypes', servicePriceTypes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Service &&
            (identical(other.serviceId, serviceId) ||
                const DeepCollectionEquality()
                    .equals(other.serviceId, serviceId)) &&
            (identical(other.serviceName, serviceName) ||
                const DeepCollectionEquality()
                    .equals(other.serviceName, serviceName)) &&
            (identical(other.serviceCategory, serviceCategory) ||
                const DeepCollectionEquality()
                    .equals(other.serviceCategory, serviceCategory)) &&
            (identical(other.serviceSubcategory, serviceSubcategory) ||
                const DeepCollectionEquality()
                    .equals(other.serviceSubcategory, serviceSubcategory)) &&
            (identical(other.servicePriceTypes, servicePriceTypes) ||
                const DeepCollectionEquality()
                    .equals(other.servicePriceTypes, servicePriceTypes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceId) ^
      const DeepCollectionEquality().hash(serviceName) ^
      const DeepCollectionEquality().hash(serviceCategory) ^
      const DeepCollectionEquality().hash(serviceSubcategory) ^
      const DeepCollectionEquality().hash(servicePriceTypes);

  @JsonKey(ignore: true)
  @override
  _$ServiceCopyWith<_Service> get copyWith =>
      __$ServiceCopyWithImpl<_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceToJson(this);
  }
}

abstract class _Service implements Service {
  factory _Service(
      {String? serviceId,
      String? serviceName,
      String? serviceCategory,
      String? serviceSubcategory,
      List<String>? servicePriceTypes}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String? get serviceId => throw _privateConstructorUsedError;
  @override
  String? get serviceName => throw _privateConstructorUsedError;
  @override
  String? get serviceCategory => throw _privateConstructorUsedError;
  @override
  String? get serviceSubcategory => throw _privateConstructorUsedError;
  @override
  List<String>? get servicePriceTypes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceCopyWith<_Service> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceSubCategory _$ServiceSubCategoryFromJson(Map<String, dynamic> json) {
  return _ServiceSubCategory.fromJson(json);
}

/// @nodoc
class _$ServiceSubCategoryTearOff {
  const _$ServiceSubCategoryTearOff();

  _ServiceSubCategory call(
      {String? serviceSubCategoryId,
      String? serviceSubCategoryName,
      String? serviceSubCategoryPhoto,
      List<String>? serviceSuggestedFeatures,
      List<String>? serviceSuggestedFeaturesTypes,
      List<String>? serviceSugggestedQuoteDetails}) {
    return _ServiceSubCategory(
      serviceSubCategoryId: serviceSubCategoryId,
      serviceSubCategoryName: serviceSubCategoryName,
      serviceSubCategoryPhoto: serviceSubCategoryPhoto,
      serviceSuggestedFeatures: serviceSuggestedFeatures,
      serviceSuggestedFeaturesTypes: serviceSuggestedFeaturesTypes,
      serviceSugggestedQuoteDetails: serviceSugggestedQuoteDetails,
    );
  }

  ServiceSubCategory fromJson(Map<String, Object> json) {
    return ServiceSubCategory.fromJson(json);
  }
}

/// @nodoc
const $ServiceSubCategory = _$ServiceSubCategoryTearOff();

/// @nodoc
mixin _$ServiceSubCategory {
  String? get serviceSubCategoryId => throw _privateConstructorUsedError;
  String? get serviceSubCategoryName => throw _privateConstructorUsedError;
  String? get serviceSubCategoryPhoto => throw _privateConstructorUsedError;
  List<String>? get serviceSuggestedFeatures =>
      throw _privateConstructorUsedError;
  List<String>? get serviceSuggestedFeaturesTypes =>
      throw _privateConstructorUsedError;
  List<String>? get serviceSugggestedQuoteDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceSubCategoryCopyWith<ServiceSubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceSubCategoryCopyWith<$Res> {
  factory $ServiceSubCategoryCopyWith(
          ServiceSubCategory value, $Res Function(ServiceSubCategory) then) =
      _$ServiceSubCategoryCopyWithImpl<$Res>;
  $Res call(
      {String? serviceSubCategoryId,
      String? serviceSubCategoryName,
      String? serviceSubCategoryPhoto,
      List<String>? serviceSuggestedFeatures,
      List<String>? serviceSuggestedFeaturesTypes,
      List<String>? serviceSugggestedQuoteDetails});
}

/// @nodoc
class _$ServiceSubCategoryCopyWithImpl<$Res>
    implements $ServiceSubCategoryCopyWith<$Res> {
  _$ServiceSubCategoryCopyWithImpl(this._value, this._then);

  final ServiceSubCategory _value;
  // ignore: unused_field
  final $Res Function(ServiceSubCategory) _then;

  @override
  $Res call({
    Object? serviceSubCategoryId = freezed,
    Object? serviceSubCategoryName = freezed,
    Object? serviceSubCategoryPhoto = freezed,
    Object? serviceSuggestedFeatures = freezed,
    Object? serviceSuggestedFeaturesTypes = freezed,
    Object? serviceSugggestedQuoteDetails = freezed,
  }) {
    return _then(_value.copyWith(
      serviceSubCategoryId: serviceSubCategoryId == freezed
          ? _value.serviceSubCategoryId
          : serviceSubCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubCategoryName: serviceSubCategoryName == freezed
          ? _value.serviceSubCategoryName
          : serviceSubCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubCategoryPhoto: serviceSubCategoryPhoto == freezed
          ? _value.serviceSubCategoryPhoto
          : serviceSubCategoryPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSuggestedFeatures: serviceSuggestedFeatures == freezed
          ? _value.serviceSuggestedFeatures
          : serviceSuggestedFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceSuggestedFeaturesTypes: serviceSuggestedFeaturesTypes == freezed
          ? _value.serviceSuggestedFeaturesTypes
          : serviceSuggestedFeaturesTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceSugggestedQuoteDetails: serviceSugggestedQuoteDetails == freezed
          ? _value.serviceSugggestedQuoteDetails
          : serviceSugggestedQuoteDetails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceSubCategoryCopyWith<$Res>
    implements $ServiceSubCategoryCopyWith<$Res> {
  factory _$ServiceSubCategoryCopyWith(
          _ServiceSubCategory value, $Res Function(_ServiceSubCategory) then) =
      __$ServiceSubCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? serviceSubCategoryId,
      String? serviceSubCategoryName,
      String? serviceSubCategoryPhoto,
      List<String>? serviceSuggestedFeatures,
      List<String>? serviceSuggestedFeaturesTypes,
      List<String>? serviceSugggestedQuoteDetails});
}

/// @nodoc
class __$ServiceSubCategoryCopyWithImpl<$Res>
    extends _$ServiceSubCategoryCopyWithImpl<$Res>
    implements _$ServiceSubCategoryCopyWith<$Res> {
  __$ServiceSubCategoryCopyWithImpl(
      _ServiceSubCategory _value, $Res Function(_ServiceSubCategory) _then)
      : super(_value, (v) => _then(v as _ServiceSubCategory));

  @override
  _ServiceSubCategory get _value => super._value as _ServiceSubCategory;

  @override
  $Res call({
    Object? serviceSubCategoryId = freezed,
    Object? serviceSubCategoryName = freezed,
    Object? serviceSubCategoryPhoto = freezed,
    Object? serviceSuggestedFeatures = freezed,
    Object? serviceSuggestedFeaturesTypes = freezed,
    Object? serviceSugggestedQuoteDetails = freezed,
  }) {
    return _then(_ServiceSubCategory(
      serviceSubCategoryId: serviceSubCategoryId == freezed
          ? _value.serviceSubCategoryId
          : serviceSubCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubCategoryName: serviceSubCategoryName == freezed
          ? _value.serviceSubCategoryName
          : serviceSubCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSubCategoryPhoto: serviceSubCategoryPhoto == freezed
          ? _value.serviceSubCategoryPhoto
          : serviceSubCategoryPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceSuggestedFeatures: serviceSuggestedFeatures == freezed
          ? _value.serviceSuggestedFeatures
          : serviceSuggestedFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceSuggestedFeaturesTypes: serviceSuggestedFeaturesTypes == freezed
          ? _value.serviceSuggestedFeaturesTypes
          : serviceSuggestedFeaturesTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      serviceSugggestedQuoteDetails: serviceSugggestedQuoteDetails == freezed
          ? _value.serviceSugggestedQuoteDetails
          : serviceSugggestedQuoteDetails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceSubCategory
    with DiagnosticableTreeMixin
    implements _ServiceSubCategory {
  _$_ServiceSubCategory(
      {this.serviceSubCategoryId,
      this.serviceSubCategoryName,
      this.serviceSubCategoryPhoto,
      this.serviceSuggestedFeatures,
      this.serviceSuggestedFeaturesTypes,
      this.serviceSugggestedQuoteDetails});

  factory _$_ServiceSubCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceSubCategoryFromJson(json);

  @override
  final String? serviceSubCategoryId;
  @override
  final String? serviceSubCategoryName;
  @override
  final String? serviceSubCategoryPhoto;
  @override
  final List<String>? serviceSuggestedFeatures;
  @override
  final List<String>? serviceSuggestedFeaturesTypes;
  @override
  final List<String>? serviceSugggestedQuoteDetails;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceSubCategory(serviceSubCategoryId: $serviceSubCategoryId, serviceSubCategoryName: $serviceSubCategoryName, serviceSubCategoryPhoto: $serviceSubCategoryPhoto, serviceSuggestedFeatures: $serviceSuggestedFeatures, serviceSuggestedFeaturesTypes: $serviceSuggestedFeaturesTypes, serviceSugggestedQuoteDetails: $serviceSugggestedQuoteDetails)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceSubCategory'))
      ..add(DiagnosticsProperty('serviceSubCategoryId', serviceSubCategoryId))
      ..add(
          DiagnosticsProperty('serviceSubCategoryName', serviceSubCategoryName))
      ..add(DiagnosticsProperty(
          'serviceSubCategoryPhoto', serviceSubCategoryPhoto))
      ..add(DiagnosticsProperty(
          'serviceSuggestedFeatures', serviceSuggestedFeatures))
      ..add(DiagnosticsProperty(
          'serviceSuggestedFeaturesTypes', serviceSuggestedFeaturesTypes))
      ..add(DiagnosticsProperty(
          'serviceSugggestedQuoteDetails', serviceSugggestedQuoteDetails));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceSubCategory &&
            (identical(other.serviceSubCategoryId, serviceSubCategoryId) ||
                const DeepCollectionEquality().equals(
                    other.serviceSubCategoryId, serviceSubCategoryId)) &&
            (identical(other.serviceSubCategoryName, serviceSubCategoryName) ||
                const DeepCollectionEquality().equals(
                    other.serviceSubCategoryName, serviceSubCategoryName)) &&
            (identical(
                    other.serviceSubCategoryPhoto, serviceSubCategoryPhoto) ||
                const DeepCollectionEquality().equals(
                    other.serviceSubCategoryPhoto, serviceSubCategoryPhoto)) &&
            (identical(
                    other.serviceSuggestedFeatures, serviceSuggestedFeatures) ||
                const DeepCollectionEquality().equals(
                    other.serviceSuggestedFeatures,
                    serviceSuggestedFeatures)) &&
            (identical(other.serviceSuggestedFeaturesTypes,
                    serviceSuggestedFeaturesTypes) ||
                const DeepCollectionEquality().equals(
                    other.serviceSuggestedFeaturesTypes,
                    serviceSuggestedFeaturesTypes)) &&
            (identical(other.serviceSugggestedQuoteDetails,
                    serviceSugggestedQuoteDetails) ||
                const DeepCollectionEquality().equals(
                    other.serviceSugggestedQuoteDetails,
                    serviceSugggestedQuoteDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceSubCategoryId) ^
      const DeepCollectionEquality().hash(serviceSubCategoryName) ^
      const DeepCollectionEquality().hash(serviceSubCategoryPhoto) ^
      const DeepCollectionEquality().hash(serviceSuggestedFeatures) ^
      const DeepCollectionEquality().hash(serviceSuggestedFeaturesTypes) ^
      const DeepCollectionEquality().hash(serviceSugggestedQuoteDetails);

  @JsonKey(ignore: true)
  @override
  _$ServiceSubCategoryCopyWith<_ServiceSubCategory> get copyWith =>
      __$ServiceSubCategoryCopyWithImpl<_ServiceSubCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceSubCategoryToJson(this);
  }
}

abstract class _ServiceSubCategory implements ServiceSubCategory {
  factory _ServiceSubCategory(
      {String? serviceSubCategoryId,
      String? serviceSubCategoryName,
      String? serviceSubCategoryPhoto,
      List<String>? serviceSuggestedFeatures,
      List<String>? serviceSuggestedFeaturesTypes,
      List<String>? serviceSugggestedQuoteDetails}) = _$_ServiceSubCategory;

  factory _ServiceSubCategory.fromJson(Map<String, dynamic> json) =
      _$_ServiceSubCategory.fromJson;

  @override
  String? get serviceSubCategoryId => throw _privateConstructorUsedError;
  @override
  String? get serviceSubCategoryName => throw _privateConstructorUsedError;
  @override
  String? get serviceSubCategoryPhoto => throw _privateConstructorUsedError;
  @override
  List<String>? get serviceSuggestedFeatures =>
      throw _privateConstructorUsedError;
  @override
  List<String>? get serviceSuggestedFeaturesTypes =>
      throw _privateConstructorUsedError;
  @override
  List<String>? get serviceSugggestedQuoteDetails =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceSubCategoryCopyWith<_ServiceSubCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceFeatures _$ServiceFeaturesFromJson(Map<String, dynamic> json) {
  return _ServiceFeatures.fromJson(json);
}

/// @nodoc
class _$ServiceFeaturesTearOff {
  const _$ServiceFeaturesTearOff();

  _ServiceFeatures call(
      {String? serviceFeatureName,
      String? serviceFeatureType,
      String? serviceFeatureValue}) {
    return _ServiceFeatures(
      serviceFeatureName: serviceFeatureName,
      serviceFeatureType: serviceFeatureType,
      serviceFeatureValue: serviceFeatureValue,
    );
  }

  ServiceFeatures fromJson(Map<String, Object> json) {
    return ServiceFeatures.fromJson(json);
  }
}

/// @nodoc
const $ServiceFeatures = _$ServiceFeaturesTearOff();

/// @nodoc
mixin _$ServiceFeatures {
  String? get serviceFeatureName => throw _privateConstructorUsedError;
  String? get serviceFeatureType => throw _privateConstructorUsedError;
  String? get serviceFeatureValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceFeaturesCopyWith<ServiceFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceFeaturesCopyWith<$Res> {
  factory $ServiceFeaturesCopyWith(
          ServiceFeatures value, $Res Function(ServiceFeatures) then) =
      _$ServiceFeaturesCopyWithImpl<$Res>;
  $Res call(
      {String? serviceFeatureName,
      String? serviceFeatureType,
      String? serviceFeatureValue});
}

/// @nodoc
class _$ServiceFeaturesCopyWithImpl<$Res>
    implements $ServiceFeaturesCopyWith<$Res> {
  _$ServiceFeaturesCopyWithImpl(this._value, this._then);

  final ServiceFeatures _value;
  // ignore: unused_field
  final $Res Function(ServiceFeatures) _then;

  @override
  $Res call({
    Object? serviceFeatureName = freezed,
    Object? serviceFeatureType = freezed,
    Object? serviceFeatureValue = freezed,
  }) {
    return _then(_value.copyWith(
      serviceFeatureName: serviceFeatureName == freezed
          ? _value.serviceFeatureName
          : serviceFeatureName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceFeatureType: serviceFeatureType == freezed
          ? _value.serviceFeatureType
          : serviceFeatureType // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceFeatureValue: serviceFeatureValue == freezed
          ? _value.serviceFeatureValue
          : serviceFeatureValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ServiceFeaturesCopyWith<$Res>
    implements $ServiceFeaturesCopyWith<$Res> {
  factory _$ServiceFeaturesCopyWith(
          _ServiceFeatures value, $Res Function(_ServiceFeatures) then) =
      __$ServiceFeaturesCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? serviceFeatureName,
      String? serviceFeatureType,
      String? serviceFeatureValue});
}

/// @nodoc
class __$ServiceFeaturesCopyWithImpl<$Res>
    extends _$ServiceFeaturesCopyWithImpl<$Res>
    implements _$ServiceFeaturesCopyWith<$Res> {
  __$ServiceFeaturesCopyWithImpl(
      _ServiceFeatures _value, $Res Function(_ServiceFeatures) _then)
      : super(_value, (v) => _then(v as _ServiceFeatures));

  @override
  _ServiceFeatures get _value => super._value as _ServiceFeatures;

  @override
  $Res call({
    Object? serviceFeatureName = freezed,
    Object? serviceFeatureType = freezed,
    Object? serviceFeatureValue = freezed,
  }) {
    return _then(_ServiceFeatures(
      serviceFeatureName: serviceFeatureName == freezed
          ? _value.serviceFeatureName
          : serviceFeatureName // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceFeatureType: serviceFeatureType == freezed
          ? _value.serviceFeatureType
          : serviceFeatureType // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceFeatureValue: serviceFeatureValue == freezed
          ? _value.serviceFeatureValue
          : serviceFeatureValue // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceFeatures
    with DiagnosticableTreeMixin
    implements _ServiceFeatures {
  _$_ServiceFeatures(
      {this.serviceFeatureName,
      this.serviceFeatureType,
      this.serviceFeatureValue});

  factory _$_ServiceFeatures.fromJson(Map<String, dynamic> json) =>
      _$_$_ServiceFeaturesFromJson(json);

  @override
  final String? serviceFeatureName;
  @override
  final String? serviceFeatureType;
  @override
  final String? serviceFeatureValue;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServiceFeatures(serviceFeatureName: $serviceFeatureName, serviceFeatureType: $serviceFeatureType, serviceFeatureValue: $serviceFeatureValue)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServiceFeatures'))
      ..add(DiagnosticsProperty('serviceFeatureName', serviceFeatureName))
      ..add(DiagnosticsProperty('serviceFeatureType', serviceFeatureType))
      ..add(DiagnosticsProperty('serviceFeatureValue', serviceFeatureValue));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ServiceFeatures &&
            (identical(other.serviceFeatureName, serviceFeatureName) ||
                const DeepCollectionEquality()
                    .equals(other.serviceFeatureName, serviceFeatureName)) &&
            (identical(other.serviceFeatureType, serviceFeatureType) ||
                const DeepCollectionEquality()
                    .equals(other.serviceFeatureType, serviceFeatureType)) &&
            (identical(other.serviceFeatureValue, serviceFeatureValue) ||
                const DeepCollectionEquality()
                    .equals(other.serviceFeatureValue, serviceFeatureValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(serviceFeatureName) ^
      const DeepCollectionEquality().hash(serviceFeatureType) ^
      const DeepCollectionEquality().hash(serviceFeatureValue);

  @JsonKey(ignore: true)
  @override
  _$ServiceFeaturesCopyWith<_ServiceFeatures> get copyWith =>
      __$ServiceFeaturesCopyWithImpl<_ServiceFeatures>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ServiceFeaturesToJson(this);
  }
}

abstract class _ServiceFeatures implements ServiceFeatures {
  factory _ServiceFeatures(
      {String? serviceFeatureName,
      String? serviceFeatureType,
      String? serviceFeatureValue}) = _$_ServiceFeatures;

  factory _ServiceFeatures.fromJson(Map<String, dynamic> json) =
      _$_ServiceFeatures.fromJson;

  @override
  String? get serviceFeatureName => throw _privateConstructorUsedError;
  @override
  String? get serviceFeatureType => throw _privateConstructorUsedError;
  @override
  String? get serviceFeatureValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ServiceFeaturesCopyWith<_ServiceFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

GigPagination _$GigPaginationFromJson(Map<String, dynamic> json) {
  return _GigPagination.fromJson(json);
}

/// @nodoc
class _$GigPaginationTearOff {
  const _$GigPaginationTearOff();

  _GigPagination call({List<Gig>? gigs, int? page, String? errorMessage}) {
    return _GigPagination(
      gigs: gigs,
      page: page,
      errorMessage: errorMessage,
    );
  }

  GigPagination fromJson(Map<String, Object> json) {
    return GigPagination.fromJson(json);
  }
}

/// @nodoc
const $GigPagination = _$GigPaginationTearOff();

/// @nodoc
mixin _$GigPagination {
  List<Gig>? get gigs => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GigPaginationCopyWith<GigPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GigPaginationCopyWith<$Res> {
  factory $GigPaginationCopyWith(
          GigPagination value, $Res Function(GigPagination) then) =
      _$GigPaginationCopyWithImpl<$Res>;
  $Res call({List<Gig>? gigs, int? page, String? errorMessage});
}

/// @nodoc
class _$GigPaginationCopyWithImpl<$Res>
    implements $GigPaginationCopyWith<$Res> {
  _$GigPaginationCopyWithImpl(this._value, this._then);

  final GigPagination _value;
  // ignore: unused_field
  final $Res Function(GigPagination) _then;

  @override
  $Res call({
    Object? gigs = freezed,
    Object? page = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      gigs: gigs == freezed
          ? _value.gigs
          : gigs // ignore: cast_nullable_to_non_nullable
              as List<Gig>?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$GigPaginationCopyWith<$Res>
    implements $GigPaginationCopyWith<$Res> {
  factory _$GigPaginationCopyWith(
          _GigPagination value, $Res Function(_GigPagination) then) =
      __$GigPaginationCopyWithImpl<$Res>;
  @override
  $Res call({List<Gig>? gigs, int? page, String? errorMessage});
}

/// @nodoc
class __$GigPaginationCopyWithImpl<$Res>
    extends _$GigPaginationCopyWithImpl<$Res>
    implements _$GigPaginationCopyWith<$Res> {
  __$GigPaginationCopyWithImpl(
      _GigPagination _value, $Res Function(_GigPagination) _then)
      : super(_value, (v) => _then(v as _GigPagination));

  @override
  _GigPagination get _value => super._value as _GigPagination;

  @override
  $Res call({
    Object? gigs = freezed,
    Object? page = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_GigPagination(
      gigs: gigs == freezed
          ? _value.gigs
          : gigs // ignore: cast_nullable_to_non_nullable
              as List<Gig>?,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GigPagination extends _GigPagination with DiagnosticableTreeMixin {
  _$_GigPagination({this.gigs, this.page, this.errorMessage}) : super._();

  factory _$_GigPagination.fromJson(Map<String, dynamic> json) =>
      _$_$_GigPaginationFromJson(json);

  @override
  final List<Gig>? gigs;
  @override
  final int? page;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GigPagination(gigs: $gigs, page: $page, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GigPagination'))
      ..add(DiagnosticsProperty('gigs', gigs))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GigPagination &&
            (identical(other.gigs, gigs) ||
                const DeepCollectionEquality().equals(other.gigs, gigs)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(gigs) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  _$GigPaginationCopyWith<_GigPagination> get copyWith =>
      __$GigPaginationCopyWithImpl<_GigPagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GigPaginationToJson(this);
  }
}

abstract class _GigPagination extends GigPagination {
  factory _GigPagination({List<Gig>? gigs, int? page, String? errorMessage}) =
      _$_GigPagination;
  _GigPagination._() : super._();

  factory _GigPagination.fromJson(Map<String, dynamic> json) =
      _$_GigPagination.fromJson;

  @override
  List<Gig>? get gigs => throw _privateConstructorUsedError;
  @override
  int? get page => throw _privateConstructorUsedError;
  @override
  String? get errorMessage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GigPaginationCopyWith<_GigPagination> get copyWith =>
      throw _privateConstructorUsedError;
}
