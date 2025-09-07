import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/add_product_to_wish_list_ds.dart';
import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_product_towishlist_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AddProductToWishListRepo)
class AddProductToWishListRepoImpl implements AddProductToWishListRepo{
  AddProductToWishListDs addProductToWishListDs;
  AddProductToWishListRepoImpl({required this.addProductToWishListDs});
  @override
  Future<Either<Failures, AddProductToWishListEntity>> addProductToWishList(String productId) async{
    var either=await addProductToWishListDs.addProductToWishList(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, AddProductToWishListEntity>> removeProductFromWishList(String productId) async{
    var either=await removeProductFromWishList(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

}