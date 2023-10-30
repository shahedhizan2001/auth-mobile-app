// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'auth.freezed.dart';
part 'auth.g.dart';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

@freezed
class Login with _$Login {
  const factory Login({
    List<User>? users,
    int? total,
    int? skip,
    int? limit,
  }) = _Login;

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    Gender? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    DateTime? birthDate,
    String? image,
    String? bloodGroup,
    int? height,
    double? weight,
    EyeColor? eyeColor,
    Hair? hair,
    String? domain,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    String ?token
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    String? address,
    String? city,
    Coordinates? coordinates,
    String? postalCode,
    String? state,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    double? lat,
    double? lng,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);
}

@freezed
class Bank with _$Bank {
  const factory Bank({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) = _Bank;

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    Address? address,
    String? department,
    String? name,
    String? title,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}

enum EyeColor {
  Amber,
  Blue,
  Brown,
  Gray,
  Green
}

final eyeColorValues = EnumValues({
  "Amber": EyeColor.Amber,
  "Blue": EyeColor.Blue,
  "Brown": EyeColor.Brown,
  "Gray": EyeColor.Gray,
  "Green": EyeColor.Green
});

enum Gender {
  female,
  male
}

final genderValues = EnumValues({
  "female": Gender.female,
  "male": Gender.male
});

@freezed
class Hair with _$Hair {
  const factory Hair({
    Color? color,
    Type? type,
  }) = _Hair;

  factory Hair.fromJson(Map<String, dynamic> json) => _$HairFromJson(json);
}

enum Color {
  Auburn,
  Black,
  Blond,
  Brown,
  Chestnut
}

final colorValues = EnumValues({
  "Auburn": Color.Auburn,
  "Black": Color.Black,
  "Blond": Color.Blond,
  "Brown": Color.Brown,
  "Chestnut": Color.Chestnut
});

enum Type {
  Curly,
  Straight,
  Strands,
  Very_curly,
  Wavy
}

final typeValues = EnumValues({
  "Curly": Type.Curly,
  "Straight": Type.Straight,
  "Strands": Type.Strands,
  "Very_curly": Type.Very_curly,
  "Wavy": Type.Wavy
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}