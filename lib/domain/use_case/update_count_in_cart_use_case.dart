import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class UpdateCountInCartUseCase{
  CartRepository cartRepository;
  UpdateCountInCartUseCase({required this.cartRepository});
  Future<Either<Failures,GetCartResponseEntity>>invoke(String productId,int count){
    return cartRepository.updateCountInCart(productId, count);
  }
}