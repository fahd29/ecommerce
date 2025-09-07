import 'package:ecommerce_app/data/model/AddToCartResponseDto.dart';
import 'package:ecommerce_app/data/model/ProductResponseDto.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';

class GetLoggedUserWashListDto extends GetLoggedUserWashListEntity{
  GetLoggedUserWashListDto({
      super.status,
      super.count,
      super.data,
    this.statusMsg,
    this.message

  });

  GetLoggedUserWashListDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDto.fromJson(v));
      });
    }
  }
  String?message;
  String?statusMsg;



}

