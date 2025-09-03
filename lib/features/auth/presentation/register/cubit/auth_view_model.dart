import 'package:ecommerce_app/domain/use_case/login_usecase.dart';
import 'package:ecommerce_app/domain/use_case/register_usecase.dart';
import 'package:ecommerce_app/features/auth/presentation/register/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var rePasswordController = TextEditingController();

  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;

  AuthViewModel({
    required this.registerUseCase,
    required this.loginUseCase,
  }) : super(AuthInitialState());

  Future<void> register() async {
    emit(AuthLoadingState(AuthProcessType.register));
    var either = await registerUseCase.invoke(
      nameController.text,
      emailController.text,
      passwordController.text,
      rePasswordController.text,
      phoneController.text,
    );
    return either.fold(
          (error) => emit(AuthErrorState(type: AuthProcessType.register, failures: error)),
          (response) => emit(AuthSuccessState(type: AuthProcessType.register, responseEntity: response)),
    );
  }

  Future<void> login() async {
    emit(AuthLoadingState(AuthProcessType.login));
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    return either.fold(
          (error) => emit(AuthErrorState(type: AuthProcessType.login, failures: error)),
          (response) => emit(AuthSuccessState(type: AuthProcessType.login, responseEntity: response)),
    );
  }
}
