import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';

class AddProductToWishListDto extends AddProductToWishListEntity{
  AddProductToWishListDto({
      super.status,
      super.message,
      super.data,
      this.statusMsg
  });

  AddProductToWishListDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  String? statusMsg;



}