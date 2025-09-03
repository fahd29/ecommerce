import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/add_to_cart_ds.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/add_toCart_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AddToCartRepo )
class AddToCartRepoImpl implements AddToCartRepo{
  AddToCartDs addToCartDs;
  AddToCartRepoImpl({required this.addToCartDs});
  @override
  Future<Either<Failures, AddToCartEntity>> addToCart(String productId)async {
   var either=await addToCartDs.addToCart(productId);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}