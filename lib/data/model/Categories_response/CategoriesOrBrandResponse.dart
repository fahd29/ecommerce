
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';

import '../Metadata.dart';


class CategoriesOrBrandResponse extends CategoriesOrBrandResponseEntity{
  CategoriesOrBrandResponse ({
      super.results,
      super.metadata,
      super.data,super.message});

  CategoriesOrBrandResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandModel.fromJson(v));
      });
    }
  }




}

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
/// createdAt : "2023-04-14T22:39:24.365Z"
/// updatedAt : "2023-04-14T22:39:24.365Z"

class CategoryOrBrandModel extends CategoryOrBrandEntity{
  CategoryOrBrandModel({
    super.id,
    super.name,
    super.slug,
    super.image,
    this.createdAt,
    this.updatedAt,});

  CategoryOrBrandModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}