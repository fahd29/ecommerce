import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/AuthResponseEntity.dart';
import '../failures.dart';
@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failures,AuthResponseEntity>>invoke(String  email, String password){
    return authRepository.login( email, password);
  }
}