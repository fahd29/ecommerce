import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class CartRepository{
 Future<Either<Failures,GetCartResponseEntity>>getCart();
 Future<Either<Failures,GetCartResponseEntity>>updateCountInCart(String productId,int count);
 Future<Either<Failures,GetCartResponseEntity>>deleteItemInCart(String productId);
}