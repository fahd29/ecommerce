import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/AuthResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AuthRepository{
  Future<Either<Failures,AuthResponseEntity>>register(String name,String email,String password,String rePassword,String phone);
  Future<Either<Failures,AuthResponseEntity>>login(String email,String password);
}