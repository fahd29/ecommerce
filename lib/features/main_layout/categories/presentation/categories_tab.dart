import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/product_view_model.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductViewModel>()..getProducts(),
      child: const ProductsScreen(),
    );
  }
}
