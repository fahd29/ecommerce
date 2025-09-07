import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/add_product_to_wish_list_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/AddProductToWishListDto.dart';
import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AddProductToWishListDs)
class AddProductToWishListDsImpl implements AddProductToWishListDs{
  ApiManager apiManager;
  AddProductToWishListDsImpl({required this.apiManager});
  @override
  Future<Either<Failures, AddProductToWishListDto>> addProductToWishList(String productId)async {
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.postData(EndPoints.wishList,
          body: {
        "productId":productId
          },
          headers: {"token":token.toString()}

      );
      var addProductToWishListResponse=AddProductToWishListDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  addProductToWishListResponse);
      }else{
        return Left(ServerError(errorMessage:  addProductToWishListResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failures, AddProductToWishListDto>> removeProductFromWishList(String productId) async{
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.deleteData("${EndPoints.wishList}/$productId",
          headers: {"token":token.toString()}

      );
      var deleteItemInWishListResponse=AddProductToWishListDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  deleteItemInWishListResponse);
      }else{
        return Left(ServerError(errorMessage:  deleteItemInWishListResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }
}