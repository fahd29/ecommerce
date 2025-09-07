import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';

class GetLoggedUserWashListEntity {
  GetLoggedUserWashListEntity({
      this.status, 
      this.count, 
      this.data,});


  String? status;
  num? count;
  List<ProductEntity>? data;



}

