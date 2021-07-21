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
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo}) {
    return _Client(
      clientId: clientId,
      clientType: clientType,
      clientEmail: clientEmail,
      clientName: clientName,
      clientAddress: clientAddress,
      clientPhone: clientPhone,
      clientAvatar: clientAvatar,
      clientPaymentInfo: clientPaymentInfo,
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
  String? get clientEmail => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientAddress => throw _privateConstructorUsedError;
  String? get clientPhone => throw _privateConstructorUsedError;
  String? get clientAvatar => throw _privateConstructorUsedError;
  String? get clientPaymentInfo => throw _privateConstructorUsedError;

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
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo});
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
    Object? clientEmail = freezed,
    Object? clientName = freezed,
    Object? clientAddress = freezed,
    Object? clientPhone = freezed,
    Object? clientAvatar = freezed,
    Object? clientPaymentInfo = freezed,
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
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo});
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
    Object? clientEmail = freezed,
    Object? clientName = freezed,
    Object? clientAddress = freezed,
    Object? clientPhone = freezed,
    Object? clientAvatar = freezed,
    Object? clientPaymentInfo = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Client extends _Client {
  _$_Client(
      {required this.clientId,
      required this.clientType,
      this.clientEmail,
      this.clientName,
      this.clientAddress,
      this.clientPhone,
      this.clientAvatar,
      this.clientPaymentInfo})
      : super._();

  factory _$_Client.fromJson(Map<String, dynamic> json) =>
      _$_$_ClientFromJson(json);

  @override
  final String clientId;
  @override
  final String clientType;
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
  String toString() {
    return 'Client(clientId: $clientId, clientType: $clientType, clientEmail: $clientEmail, clientName: $clientName, clientAddress: $clientAddress, clientPhone: $clientPhone, clientAvatar: $clientAvatar, clientPaymentInfo: $clientPaymentInfo)';
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
                    .equals(other.clientPaymentInfo, clientPaymentInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clientId) ^
      const DeepCollectionEquality().hash(clientType) ^
      const DeepCollectionEquality().hash(clientEmail) ^
      const DeepCollectionEquality().hash(clientName) ^
      const DeepCollectionEquality().hash(clientAddress) ^
      const DeepCollectionEquality().hash(clientPhone) ^
      const DeepCollectionEquality().hash(clientAvatar) ^
      const DeepCollectionEquality().hash(clientPaymentInfo);

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
      String? clientEmail,
      String? clientName,
      String? clientAddress,
      String? clientPhone,
      String? clientAvatar,
      String? clientPaymentInfo}) = _$_Client;
  _Client._() : super._();

  factory _Client.fromJson(Map<String, dynamic> json) = _$_Client.fromJson;

  @override
  String get clientId => throw _privateConstructorUsedError;
  @override
  String get clientType => throw _privateConstructorUsedError;
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
