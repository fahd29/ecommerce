import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/add_to_cart_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/AddToCartResponseDto.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AddToCartDs)
class AddToCartDsImpl implements AddToCartDs{
  ApiManager apiManager;
  AddToCartDsImpl({required this.apiManager});
  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId) async{
    try{
      var token=SharedPrefsUtils.getData(key: 'token');
      var response=await apiManager.postData(EndPoints.addToCart,body: {
        "productId":productId
      },
        headers: {
        //nullable obj
        'token':token.toString()
        }

      );
      var addToCartResponse=AddToCartResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(  addToCartResponse);
      }else{
        return Left(ServerError(errorMessage:  addToCartResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }
  
}