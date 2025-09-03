import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_toCart_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddToCartUseCase{
  AddToCartRepo addToCartRepo;
  AddToCartUseCase({required this.addToCartRepo});
  Future<Either<Failures,AddToCartEntity>>invoke(String productId){
    return addToCartRepo.addToCart(productId);
  }
}