import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favourite_states.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favourite_view_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
        child: BlocProvider(
          create: (context) => getIt<FavouriteViewModel>()..getLogged(),
          child: BlocBuilder<FavouriteViewModel, FavouriteStates>(
            builder: (context, state) {
              var cubit = context.read<FavouriteViewModel>();
              return ListView.builder(
                itemCount: cubit.favouriteList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child:
                    FavoriteItem(product: cubit.favouriteList[index]),
                  );
                },
              );
            },
          ),
        ));
  }
}
