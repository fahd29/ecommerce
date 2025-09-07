import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/cart_remote_ds.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartRepository )
class CartRepositoryImpl implements CartRepository{
  CartRemoteDs cartRemoteDs;
  CartRepositoryImpl({required this.cartRemoteDs});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart()async {
    var either =await cartRemoteDs.getCart();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(String productId)async {
    var either =await cartRemoteDs.deleteItemInCart(productId);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(String productId, int count) async{
    var either =await cartRemoteDs.updateCountInCart(productId, count);
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}