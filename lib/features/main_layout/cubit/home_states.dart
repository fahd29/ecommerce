import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/domain/failures.dart';

enum HomeStatus {
  init,
  loadingCategories,
  successCategories,
  errorCategories,
  loadingBrands,
  successBrands,
  errorBrands,
  adsChanged,
}

class HomeStates {
  final HomeStatus status;
  final Failures? failures;
  final CategoriesOrBrandResponseEntity? categoriesOrBrandResponseEntity;
  final List<CategoryOrBrandEntity>? categoryList;
  final List<CategoryOrBrandEntity>? brandList;
  final int? currentAdIndex;

  HomeStates({
    required this.status,
    this.failures,
    this.categoriesOrBrandResponseEntity,
    this.categoryList,
    this.brandList,
    this.currentAdIndex,
  });

  factory HomeStates.initial() {
    return HomeStates(status: HomeStatus.init, currentAdIndex: 0);
  }

  HomeStates copyWith({
    HomeStatus? status,
    Failures? failures,
    CategoriesOrBrandResponseEntity? categoriesOrBrandResponseEntity,
    List<CategoryOrBrandEntity>? categoryList,
    List<CategoryOrBrandEntity>? brandList,
    int? currentAdIndex,
  }) {
    return HomeStates(
      status: status ?? this.status,
      failures: failures ?? this.failures,
      categoriesOrBrandResponseEntity: categoriesOrBrandResponseEntity ?? this.categoriesOrBrandResponseEntity,
      categoryList: categoryList ?? this.categoryList,
      brandList: brandList ?? this.brandList,
      currentAdIndex: currentAdIndex ?? this.currentAdIndex,
    );
  }
}
