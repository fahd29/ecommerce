import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/categoryOrBrand_ds.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/categoryOrBrand_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoryOrBrandRepo )
class CategoryOrBrandRepoImpl implements CategoryOrBrandRepo{
  CategoryOrBrandDs categoryOrBrandDs;
  CategoryOrBrandRepoImpl({required this.categoryOrBrandDs});
  @override
  Future<Either<Failures, CategoriesOrBrandResponseEntity>> getBrand() async{
    var either=await  categoryOrBrandDs.getBrand();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }

  @override
  Future<Either<Failures, CategoriesOrBrandResponseEntity>> getCategory() async{
    var either=await  categoryOrBrandDs.getCategory();
    return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}