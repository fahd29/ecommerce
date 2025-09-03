import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/data_sources/remote_data_source/product_remote_ds.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';
import 'package:ecommerce_app/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductRepoImpl implements ProductRepository{
  ProductRemoteDs productRemoteDs;
  ProductRepoImpl({required this.productRemoteDs});
  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async{
  var either=await productRemoteDs.getProducts();
  return either.fold((error)=>Left(error), (response)=>Right(response));
  }
}