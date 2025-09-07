// import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
// import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
// import 'package:ecommerce_app/domain/failures.dart';
//
// abstract class ProductStates {}
//
// class ProductInit extends ProductStates {}
//
// class ProductLoadingState extends ProductStates {}
//
// class ProductError extends ProductStates {
//   final Failures failures;
//   ProductError({required this.failures});
// }
//
// class ProductSuccess extends ProductStates {
//   final List<ProductEntity> products;
//   ProductSuccess({required this.products});
// }
//
//
//
//
// class AddToCartLoadingState extends ProductStates {}
//
// class AddToCartError extends ProductStates {
//   // final Failures failures;
//   // AddToCartError({required this.failures});
// }
//
// class AddToCartSuccess extends ProductStates {
//   final AddToCartEntity addToCartEntity;
//   AddToCartSuccess({required this.addToCartEntity});
// }
import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/entity/AddToCartEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart' show ProductEntity;
import 'package:ecommerce_app/domain/failures.dart';

abstract class ProductStates {
  final Failures? failures;
  final List<ProductEntity>? products;
  final AddToCartEntity? addToCartEntity;
  final AddProductToWishListEntity? addProductToWishListEntity;

   const ProductStates({this.failures, this.products, this.addToCartEntity,
  this.addProductToWishListEntity
  });
}

class ProductInit extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductError extends ProductStates {
  const ProductError({required Failures failures})
      : super(failures: failures);
}

class ProductSuccess extends ProductStates {
  const ProductSuccess({required List<ProductEntity> products})
      : super(products: products);
}

class AddToCartLoadingState extends ProductStates {}

class AddToCartError extends ProductStates {
  const AddToCartError({required Failures failures})
      : super(failures: failures);
}

class AddToCartSuccess extends ProductStates {
  const AddToCartSuccess({required AddToCartEntity addToCartEntity})
      : super(addToCartEntity: addToCartEntity);
}

class AddToWishListLoadingState extends ProductStates {}

class AddToWishListError extends ProductStates {
  const AddToWishListError({required Failures failures})
      : super(failures: failures);
}

class AddToWishListSuccess extends ProductStates {
  const AddToWishListSuccess({required AddProductToWishListEntity addToWishListEntity})
      : super(addProductToWishListEntity: addToWishListEntity);
}
