import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';

class AddToCartResponseDto extends AddToCartEntity{
  AddToCartResponseDto({
     super.status,
     super.message,
     super.numOfCartItems,
     super.cartId,
     super.data,this.statusMsg});


  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataCartDto.fromJson(json['data']) : null;
  }
  String? statusMsg;




}

class AddDataCartDto extends AddDataCartEntity{
  AddDataCartDto({
      super.id,
      super.cartOwner,
      super.products,
      this.createdAt,
      this.updatedAt,
      super.v,
      super.totalCartPrice,});

  AddDataCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  String? createdAt;
  String? updatedAt;




}

class AddProductDto extends AddProductEntity{
  AddProductDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }




}