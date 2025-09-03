import 'package:dartz/dartz.dart' show Either;
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/categoryOrBrand_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class BrandUseCase{
  CategoryOrBrandRepo categoryOrBrandRepo;
  BrandUseCase({required this.categoryOrBrandRepo});
  Future<Either<Failures,CategoriesOrBrandResponseEntity>>invoke(){
    return categoryOrBrandRepo.getBrand();

  }
}