import 'package:ecommerce_app/domain/entity/AuthResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

enum AuthProcessType { login, register }

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {
  final AuthProcessType type;
  AuthLoadingState(this.type);
}

class AuthSuccessState extends AuthStates {
  final AuthProcessType type;
  final AuthResponseEntity responseEntity;
  AuthSuccessState({required this.type, required this.responseEntity});
}

class AuthErrorState extends AuthStates {
  final AuthProcessType type;
  final Failures failures;
  AuthErrorState({required this.type, required this.failures});
}
