import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/product_remote_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/ProductResponseDto.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRemoteDs)
class ProductRemoteDSImpl implements ProductRemoteDs{
  ApiManager apiManager;
  ProductRemoteDSImpl({required this.apiManager});
  @override
  Future<Either<Failures, ProductResponseDto>> getProducts() async{
    try{
      var response=await apiManager.getData(EndPoints.getProducts);
      var productResponse=ProductResponseDto.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right( productResponse);
      }else{
        return Left(ServerError(errorMessage: productResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }

  }
}