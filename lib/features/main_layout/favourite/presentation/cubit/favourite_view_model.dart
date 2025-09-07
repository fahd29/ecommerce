import 'package:ecommerce_app/domain/entity/AddProductToWishListEntity.dart';
import 'package:ecommerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:ecommerce_app/domain/entity/GetLoggedUserWashListEntity.dart';
import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/use_case/get_user_wash_list_usecase.dart';
import 'package:ecommerce_app/domain/use_case/remove_product_fromwishList_usecase.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_screen_states.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favourite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class FavouriteViewModel extends Cubit<FavouriteStates>{
  GetLoggedUserWashListUseCase getLoggedUserWashListUseCase;
  FavouriteViewModel({required this.getLoggedUserWashListUseCase
  ,required this.removeProductFromWishListUseCase
  }):super(FavouriteInitState());
  List<ProductEntity>favouriteList=[];
  //List<AddProductToWishListEntity> myWishList = [];
  RemoveProductFromWishListUseCase removeProductFromWishListUseCase;
  void getLogged()async{
    emit(FavouriteLoadingState());
    var either=await getLoggedUserWashListUseCase.invoke();
    return either.fold((error)=>emit(FavouriteErrorState(failures: error)), (response){
      favouriteList=response.data??[];
      emit(FavouriteSuccessState(getLoggedEntity: response));
    });

  }
  void deleteItemInWishList(String productId)async{
    //emit(DeleteItemInCartScreenLoadingState());
    var either =await removeProductFromWishListUseCase.invoke(productId);
    either.fold((error)=>emit(FavouriteDeleteErrorState(failures: error)),
            (response){

              favouriteList.removeWhere((product) => product.id == productId);
          emit(FavouriteDeleteSuccessState(addToWishListEntity: response ));
        });

  }
}

// void deleteItemInCart(String productId)async{
//   //emit(DeleteItemInCartScreenLoadingState());
//   var either =await deleteItemInCartUseCase.invoke(productId);
//   either.fold((error)=>emit(DeleteItemInCartScreenErrorState(failures: error)), (response){
//     productsList=response.data?.products??[];
//     emit(GetCartScreenSuccessState(responseEntity: response));
//   });