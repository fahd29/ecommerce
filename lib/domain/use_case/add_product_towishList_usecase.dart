import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_product_towishlist_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class AddProductToWishListUseCase{
  AddProductToWishListRepo addProductToWishListRepo;
  AddProductToWishListUseCase({required this.addProductToWishListRepo});
  Future<Either<Failures,AddProductToWishListEntity>>invoke(String productId)
  {
    return addProductToWishListRepo.addProductToWishList(productId);
  }}