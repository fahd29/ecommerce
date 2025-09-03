import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/features/auth/presentation/login/shared_prefs_utils.dart';
import 'package:ecommerce_app/features/auth/presentation/register/cubit/auth_states.dart';
import 'package:ecommerce_app/features/auth/presentation/register/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthViewModel>(),
      child: BlocConsumer<AuthViewModel, AuthStates>(
        listener: (context, state) {
          if (state is AuthErrorState && state.type == AuthProcessType.login) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failures.errorMessage ?? "Login Failed"),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is AuthSuccessState &&
              state.type == AuthProcessType.login) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Login Successful 🎉"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 3),
              ),
            );
            SharedPrefsUtils.saveData(key: "token", value: state.responseEntity.token);
            Navigator.pushReplacementNamed(context, Routes.mainRoute);
          }
        },
        builder: (context, state) {
          var viewModel = context.read<AuthViewModel>();

          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s40.h),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(height: AppSize.s40.h),
                        Text(
                          'Welcome Back To Route',
                          style: getBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(height: AppSize.s50.h),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          hint: 'enter your email',
                          label: 'User email',
                          controller: viewModel.emailController,
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),
                        SizedBox(height: AppSize.s28.h),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          controller: viewModel.passwordController,
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: AppSize.s8.h),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s18.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s60.h),
                        Center(
                          child: SizedBox(
                            child: (state is AuthLoadingState &&
                                state.type == AuthProcessType.login)
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : CustomElevatedButton(
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18,
                              ),
                              onTap: () {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  context.read<AuthViewModel>().login();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(width: AppSize.s8.w),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.signUpRoute),
                              child: Text(
                                'Create Account',
                                style: getSemiBoldStyle(color: ColorManager.white)
                                    .copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
