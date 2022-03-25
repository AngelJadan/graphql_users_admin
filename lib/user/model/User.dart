import 'dart:convert';
import 'package:get/state_manager.dart';

UserRx userFromJson(String str) => UserRx.fromJson(json.decode(str));

String userToJson(UserRx data) => json.encode(data.toJson());

class UserRx {
  
  UserRx(
      {
      this.id,
      this.username,
      this.email,
      this.phone,
      this.password,
      this.photo});

  RxInt? id;
  RxString? username;
  RxString? email;
  RxString? phone;
  RxString? password;
  RxString? photo;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'user_id': id});
    }
    if (username != null) {
      result.addAll({'user_name': username});
    }
    if (email != null) {
      result.addAll({'user_email': email});
    }
    if (phone != null) {
      result.addAll({'user_phone': phone});
    }
    if (password != null) {
      result.addAll({'user_password': password});
    }
    if (photo != null) {
      result.addAll({'user_photo': photo});
    }

    return result;
  }

  Map<String, dynamic> toJsonGraphql() => {
        "user_name": (username).toString(),
        "user_email": email.toString(),
        "user_password": password.toString(),
        "user_phone": phone.toString(),
        "user_photo": photo.toString(),
      };

  factory UserRx.fromJson(Map<String, dynamic> json) => UserRx(
      id: RxInt(json["user_id"]),
      username: RxString(json["user_name"]),
      email: RxString(json["user_email"]),
      phone: RxString(json["user_phone"]),
      photo: RxString(json["user_photo"]));

  factory UserRx.fromMap(Map<String, dynamic> map) {
    return UserRx(
      id: map['id'] as RxInt,
      username: map['username']  as RxString,
      email: map['email']  as RxString,
      phone: map['phone'] as RxString,
      password: map['password'] as RxString,
      photo: map['photo'] as RxString,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, phone: $phone, password: $password, photo: $photo)';
  }

}

class User {
  late UserRx userRx;

  User({
    int? id,
    String? username,
    String? email,
    String? phone,
    String? password,
    String? photo,
  }) {
    this.userRx = UserRx();
  }

}
