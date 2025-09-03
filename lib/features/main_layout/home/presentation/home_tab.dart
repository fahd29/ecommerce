import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/domain/entity/CategoryOrBrandEntity.dart';
import 'package:ecommerce_app/features/main_layout/cubit/home_states.dart';
import 'package:ecommerce_app/features/main_layout/cubit/home_view_model.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeViewModel(
        categoryUseCase: getIt(),
        brandUseCase: getIt(),
        adsImages: [
          ImageAssets.carouselSlider1,
          ImageAssets.carouselSlider2,
          ImageAssets.carouselSlider3,
        ],
      )
        ..getCategories()
        ..getBrands(),
      child: BlocConsumer<HomeViewModel, HomeStates>(
        listener: (context, state) {
          if (state.status == HomeStatus.errorCategories ||
              state.status == HomeStatus.errorBrands) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failures?.errorMessage ?? "Error occurred"),
              ),
            );
          }
        },
        builder: (context, state) {
          final vm = context.read<HomeViewModel>();
          final currentIndex = state.currentAdIndex ?? 0;

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAdsWidget(
                  adsImages: vm.adsImages,
                  currentIndex: currentIndex,
                ),

                /// ================= Categories =================
                CustomSectionBar(
                  sectionNname: 'Categories',
                  function: () {},
                ),
                SizedBox(
                  height: 270.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoryList?.length ?? 0,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final CategoryOrBrandEntity category =
                      state.categoryList![index];
                      return CustomCategoryWidget(category: category);
                    },
                  ),
                ),
                SizedBox(height: 12.h),

                /// ================= Brands =================
                CustomSectionBar(
                  sectionNname: 'Brands',
                  function: () {},
                ),
                SizedBox(
                  height: 270.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.brandList?.length ?? 0,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final CategoryOrBrandEntity brand =
                      state.brandList![index];
                      return CustomBrandWidget(brand: brand);
                    },
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
