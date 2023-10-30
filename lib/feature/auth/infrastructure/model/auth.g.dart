// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginImpl _$$LoginImplFromJson(Map<String, dynamic> json) => _$LoginImpl(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$$LoginImplToJson(_$LoginImpl instance) =>
    <String, dynamic>{
      'users': instance.users,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      maidenName: json['maidenName'] as String?,
      age: json['age'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      image: json['image'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      height: json['height'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      eyeColor: $enumDecodeNullable(_$EyeColorEnumMap, json['eyeColor']),
      hair: json['hair'] == null
          ? null
          : Hair.fromJson(json['hair'] as Map<String, dynamic>),
      domain: json['domain'] as String?,
      ip: json['ip'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String?,
      university: json['university'] as String?,
      bank: json['bank'] == null
          ? null
          : Bank.fromJson(json['bank'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : Company.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String?,
      ssn: json['ssn'] as String?,
      userAgent: json['userAgent'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthDate': instance.birthDate?.toIso8601String(),
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': _$EyeColorEnumMap[instance.eyeColor],
      'hair': instance.hair,
      'domain': instance.domain,
      'ip': instance.ip,
      'address': instance.address,
      'macAddress': instance.macAddress,
      'university': instance.university,
      'bank': instance.bank,
      'company': instance.company,
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
      'token': instance.token,
    };

const _$GenderEnumMap = {
  Gender.female: 'female',
  Gender.male: 'male',
};

const _$EyeColorEnumMap = {
  EyeColor.Amber: 'Amber',
  EyeColor.Blue: 'Blue',
  EyeColor.Brown: 'Brown',
  EyeColor.Gray: 'Gray',
  EyeColor.Green: 'Green',
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      address: json['address'] as String?,
      city: json['city'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      postalCode: json['postalCode'] as String?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'coordinates': instance.coordinates,
      'postalCode': instance.postalCode,
      'state': instance.state,
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$BankImpl _$$BankImplFromJson(Map<String, dynamic> json) => _$BankImpl(
      cardExpire: json['cardExpire'] as String?,
      cardNumber: json['cardNumber'] as String?,
      cardType: json['cardType'] as String?,
      currency: json['currency'] as String?,
      iban: json['iban'] as String?,
    );

Map<String, dynamic> _$$BankImplToJson(_$BankImpl instance) =>
    <String, dynamic>{
      'cardExpire': instance.cardExpire,
      'cardNumber': instance.cardNumber,
      'cardType': instance.cardType,
      'currency': instance.currency,
      'iban': instance.iban,
    };

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      department: json['department'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'department': instance.department,
      'name': instance.name,
      'title': instance.title,
    };

_$HairImpl _$$HairImplFromJson(Map<String, dynamic> json) => _$HairImpl(
      color: $enumDecodeNullable(_$ColorEnumMap, json['color']),
      type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$HairImplToJson(_$HairImpl instance) =>
    <String, dynamic>{
      'color': _$ColorEnumMap[instance.color],
      'type': _$TypeEnumMap[instance.type],
    };

const _$ColorEnumMap = {
  Color.Auburn: 'Auburn',
  Color.Black: 'Black',
  Color.Blond: 'Blond',
  Color.Brown: 'Brown',
  Color.Chestnut: 'Chestnut',
};

const _$TypeEnumMap = {
  Type.Curly: 'Curly',
  Type.Straight: 'Straight',
  Type.Strands: 'Strands',
  Type.Very_curly: 'Very_curly',
  Type.Wavy: 'Wavy',
};
