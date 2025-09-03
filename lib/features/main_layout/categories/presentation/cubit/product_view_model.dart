import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/use_case/add_to_cart_usecase.dart';
import 'package:ecommerce_app/domain/use_case/product_usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductViewModel extends Cubit<ProductStates> {
  final ProductUseCase productUseCase;
  final AddToCartUseCase addToCartUseCase;
  List<ProductEntity> products = [];
  int numberOfCartItems=0;

  ProductViewModel({required this.productUseCase,
    required this.addToCartUseCase

  }) : super(ProductInit());

  void getProducts() async {
    emit(ProductLoadingState());
    var either = await productUseCase.invoke();
    either.fold((error) {
      emit(ProductError(failures: error));
    }, (response) {
      products = response.data ?? [];
      emit(ProductSuccess(products: products));
    });
  }
  void addToCart(productId) async {
   // emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
     // emit(AddToCartError(failures: error));
    }, (response) {
      numberOfCartItems=response.numOfCartItems!.toInt();
      print("num of cart item:$numberOfCartItems");
      emit(AddToCartSuccess(addToCartEntity: response));
    });
  }
}
