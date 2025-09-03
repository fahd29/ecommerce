import 'package:dartz/dartz.dart';

import '../../../domain/entity/AuthResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,AuthResponseEntity>>register(String name,String email,String password,String rePassword,String phone);
  Future<Either<Failures,AuthResponseEntity>>login(String email,String password);

}