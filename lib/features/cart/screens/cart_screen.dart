import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_screen_states.dart';
import 'package:ecommerce_app/features/cart/cubit/cart_screen_view_model.dart';
import 'package:ecommerce_app/features/cart/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<CartScreenViewModel>()
        ..getCart(),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(
                  IconsAssets.icSearch,
                ),
                color: ColorManager.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icCart),
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
        body:  Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: BlocBuilder<CartScreenViewModel, CartScreenStates>(
        builder: (context, state) {
          var cubit = context.read<CartScreenViewModel>();

          if (state is GetCartScreenSuccessState) {
            final response = state.responseEntity;

            return Column(
              children: [
                Expanded(
                  // the list of cart items ===============
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartItemWidget(cartEntity: cubit.productsList[index]);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: cubit.productsList.length,
                  ),
                ),

                // ✅ total price from state
                TotalPriceAndCheckoutBotton(
                  totalPrice: (response.data?.totalCartPrice ?? 0).toInt(),
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            );
          }

          if (state is GetCartScreenErrorState) {
            return Center(
              child: Text(
                "Error: ${state.failures.errorMessage}",
                style: getMediumStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }

          // لو لسه بيلود
          return const Center(child: CircularProgressIndicator());
        },
      ),
    ),

      ),
    );
  }
}
