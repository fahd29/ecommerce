import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/categoryOrBrand_ds.dart';
import 'package:ecommerce_app/data/end_points.dart';
import 'package:ecommerce_app/data/model/Categories_response/CategoriesOrBrandResponse.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CategoryOrBrandDs )
class CategoryOrBrandDsImpl implements CategoryOrBrandDs{
  ApiManager apiManager;
  CategoryOrBrandDsImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoriesOrBrandResponseEntity>> getBrand()async {
    try{
    var response=await apiManager.getData(EndPoints.brand);
    var brandResponse=CategoriesOrBrandResponse.fromJson(response.data);
    if(response.statusCode!>=200&&response.statusCode!<300){
      return right(brandResponse);
    }else{
      return Left(ServerError(errorMessage: brandResponse.message!));
    }

  }catch(error){
  return Left(Failures(errorMessage: error.toString()));
  }
  }

  @override
  Future<Either<Failures, CategoriesOrBrandResponseEntity>> getCategory()async {
    try{
      var response=await apiManager.getData(EndPoints.category);
      var categoryResponse=CategoriesOrBrandResponse.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return right(categoryResponse);
      }else{
        return Left(ServerError(errorMessage: categoryResponse.message!));
      }

    }catch(error){
      return Left(Failures(errorMessage: error.toString()));
    }
  }
}