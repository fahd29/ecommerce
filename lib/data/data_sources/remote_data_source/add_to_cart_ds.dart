import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AddToCartDs{
  Future<Either<Failures,AddToCartEntity>>addToCart(String productId);
}