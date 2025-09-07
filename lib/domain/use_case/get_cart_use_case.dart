import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCartUseCase{
  CartRepository cartRepository;
  GetCartUseCase({required this.cartRepository});
  Future<Either<Failures,GetCartResponseEntity>>invoke(){
    return cartRepository.getCart();
  }
}