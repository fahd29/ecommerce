import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/product_states.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/cubit/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocListener<ProductViewModel, ProductStates>(
            listener: (context, state) {
              //   if ( state is AddToCartLoadingState) {
              //     showDialog(context: context, builder: (context) {
              //       return Center(child: CircularProgressIndicator(color: ColorManager.darkPrimary,));
              //     },);
              //   }
              //   if (state is ProductSuccess) {
              //     Navigator.pop(context);
              //   }
              if (state is AddToCartSuccess) {
                // Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Product added Successfully 🎉"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
              //   if (state is ProductError || state is AddToCartError) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(state.failures?.errorMessage ?? "Unknown error"),
              //         backgroundColor: Colors.red,
              //         duration: const Duration(seconds: 3),
              //       ),
              //     );
              //   }
            }, child: BlocBuilder<ProductViewModel, ProductStates>(
          builder: (context, state) {
            var cubit = BlocProvider.of<ProductViewModel>(context);
            if (state is ProductLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                itemCount: cubit.products.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final product = cubit.products[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetails(product: product),
                        ),
                      );
                    },
                    child: BlocProvider.value(
                      value: cubit,
                      child: CustomProductWidget(
                        productViewModel: cubit,
                        productId: product.id ?? "",
                        image:
                        product.imageCover ?? ImageAssets.categoryHomeImage,
                        title: product.title ?? "No title",
                        price: product.price?.toDouble() ?? 0,
                        rating: product.ratingsAverage?.toDouble() ?? 0,
                        height: height,
                        width: width,
                        description: product.description ?? "",
                      ),
                    ),
                  );
                },
              );
            }
          },
        )),
      ),
    );
  }
}
