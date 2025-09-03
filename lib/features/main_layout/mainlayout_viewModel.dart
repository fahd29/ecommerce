import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_tab.dart';
import 'package:ecommerce_app/features/main_layout/mainLayout_States.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart' show ProfileTab;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MainLayoutViewModel extends Cubit<MainLayoutStates>{
  MainLayoutViewModel():super(MainLayoutInit());
  int currentIndex = 0;
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
}

