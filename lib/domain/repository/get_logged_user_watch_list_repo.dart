import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class GetLoggedUserWashListRepo{
  Future<Either<Failures,GetLoggedUserWashListEntity>>getLogged();
}