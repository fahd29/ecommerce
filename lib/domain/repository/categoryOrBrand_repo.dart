import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

abstract class CategoryOrBrandRepo{
  Future<Either<Failures,CategoriesOrBrandResponseEntity>>getCategory();
  Future<Either<Failures,CategoriesOrBrandResponseEntity>>getBrand();
}