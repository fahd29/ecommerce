import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class ProductRemoteDs{
  Future<Either<Failures,ProductResponseEntity>>getProducts();
}