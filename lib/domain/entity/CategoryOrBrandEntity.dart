import 'package:ecommerce_app/data/model/Categories_response/CategoriesOrBrandResponse.dart';
import 'package:ecommerce_app/data/model/Metadata.dart';

/// _id : "6439d61c0049ad0b52b90051"
/// name : "Music"
/// slug : "music"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511964020.jpeg"
class CategoriesOrBrandResponseEntity{
  CategoriesOrBrandResponseEntity ({
    this.results,
    this.metadata,
    this.data,this.message});


  int? results;
  Metadata? metadata;
  String?message;
  List<CategoryOrBrandModel>? data;


}
class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,});
  String? id;
  String? name;
  String? slug;
  String? image;



}