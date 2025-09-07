import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/cart_remote_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/GetCartResponseDto.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRemoteDs)
class CartRemoteDsImpl implements CartRemoteDs{
  ApiManager apiManager;
  CartRemoteDsImpl({required this.apiManager});
  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async{
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.getData(EndPoints.addToCart,
        headers: {"token":token.toString()}

      );
      var getCartResponse=GetCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  getCartResponse);
      }else{
        return Left(ServerError(errorMessage:  getCartResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(String productId) async{
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.deleteData("${EndPoints.addToCart}/$productId",
          headers: {"token":token.toString()}

      );
      var deleteItemInCartResponse=GetCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  deleteItemInCartResponse);
      }else{
        return Left(ServerError(errorMessage:  deleteItemInCartResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(String productId, int count) async{
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.updateData("${EndPoints.addToCart}/$productId",
          body: {
        "count":"$count"
          },
          headers: {"token":token.toString()}

      );
      var updateCountInCartResponse=GetCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  updateCountInCartResponse);
      }else{
        return Left(ServerError(errorMessage:  updateCountInCartResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }

}