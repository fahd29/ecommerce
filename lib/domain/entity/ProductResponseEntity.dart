import 'package:ecommerce_app/data/model/Categories_response/CategoriesOrBrandResponse.dart';
import 'package:ecommerce_app/data/model/ProductResponseDto.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.metadata, 
      this.data,});

  int? results;
  MetadataEntity? metadata;
  List<ProductDto>? data;

}


class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images,
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      });


  num? sold;
  List<String>? images;
   num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoriesOrBrandResponse? category;
  CategoriesOrBrandResponse? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;



}



class MetadataEntity {
  MetadataEntity({
      this.currentPage, 
      this.numberOfPages, 
      this.limit, 
      this.nextPage,});

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;


}