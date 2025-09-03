import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductUseCase{
  ProductRepository productRepository;
  ProductUseCase({required this.productRepository});
  Future<Either<Failures,ProductResponseEntity>>invoke(){
    return productRepository.getProducts();
  }
}