import 'package:ecommerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/domain/use_case/add_to_cart_usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/product_states.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:ecommerce_app/features/main_layout/mainLayout_States.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart' show ProfileTab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class MainLayoutViewModel extends Cubit<MainLayoutStates>{
  MainLayoutViewModel({required this.countAboveUseCase}):super(MainLayoutInit());
  int currentIndex = 0;
  final AddToCartUseCase countAboveUseCase;
  int numberOfCartItems=0;
  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    FavouriteScreen(),
    ProfileTab(),
  ];
  changeSelectedIndex(int selectedIndex) {
    emit(MainLayoutInit());
    currentIndex=selectedIndex ;
    emit(ChangeSelectedIndex());
  }
  void showCount(productId) async {
    // emit(AddToCartLoadingState());
    var either = await countAboveUseCase.invoke(productId);
    either.fold((error) {
      // emit(AddToCartError(failures: error));
    }, (response) {

      numberOfCartItems = response.numOfCartItems?.toInt() ?? 0;
      print("num of cart item:$numberOfCartItems");
      emit(ChangeCount(addToCartEntity: response));
    });
  }
}

