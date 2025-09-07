import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/use_case/delete_item_in_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_case/get_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_case/update_count_in_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartScreenViewModel extends Cubit<CartScreenStates>{
  GetCartUseCase getCartUseCase;
  UpdateCountInCartUseCase updateCountInCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  List<GetProductCartEntity>productsList=[];
  CartScreenViewModel({required this.getCartUseCase,
    required this.deleteItemInCartUseCase,
    required this.updateCountInCartUseCase

  }):super(CartScreenInitState());
  //todo:hold data - handle logic
 void getCart()async{
   emit(GetCartScreenLoadingState());
   var either =await getCartUseCase.invoke();
   either.fold((error)=>emit(GetCartScreenErrorState(failures: error)), (response){
     productsList=response.data?.products??[];
     emit(GetCartScreenSuccessState(responseEntity: response));
   });

 }
  void deleteItemInCart(String productId)async{
   //emit(DeleteItemInCartScreenLoadingState());
    var either =await deleteItemInCartUseCase.invoke(productId);
    either.fold((error)=>emit(DeleteItemInCartScreenErrorState(failures: error)), (response){
      productsList=response.data?.products??[];
      emit(GetCartScreenSuccessState(responseEntity: response));
    });

  }
  void updateCountInCart(String productId,int count)async{
    //emit(UpdateCountInCartScreenLoadingState());
    var either =await updateCountInCartUseCase.invoke(productId,  count);
    either.fold((error)=>emit(UpdateCountInCartScreenErrorState(failures: error)), (response){
      productsList=response.data?.products??[];
      emit(GetCartScreenSuccessState(responseEntity: response));
    });

  }

}