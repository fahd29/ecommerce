import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class AddProductToWishListDs{
  Future<Either<Failures,AddProductToWishListEntity>>addProductToWishList(String productId);
  Future<Either<Failures,AddProductToWishListEntity>>removeProductFromWishList(String productId);
}