import 'package:ecommerce_app/domain/entity/AuthResponseEntity.dart';

class AuthResponseDto extends AuthResponseEntity{
  AuthResponseDto({
      super.message,
      super.user,
      super.token,
      super.statusMsg
  });

  AuthResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }




}

class UserDto extends UserEntity{
  UserDto({
      super.name,
      super.email,
      this.role,});

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;



}