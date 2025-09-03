import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/features/auth/presentation/register/cubit/auth_states.dart';
import 'package:ecommerce_app/features/auth/presentation/register/cubit/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../../../../domain/di/di.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthViewModel>(),
      child: BlocConsumer<AuthViewModel, AuthStates>(
        listener: (context, state) {
          if (state is AuthErrorState &&
              state.type == AuthProcessType.register) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                Text(state.failures.errorMessage ?? "Registration Failed"),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is AuthSuccessState &&
              state.type == AuthProcessType.register) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Registration Successful 🎉"),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 3),
              ),
            );
            //Navigator.pop(context);
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
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          hint: 'enter your full name',
                          label: 'Full Name',
                          textInputType: TextInputType.name,
                          validation: AppValidators.validateFullName,
                          controller: viewModel.nameController,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your mobile no.',
                          backgroundColor: ColorManager.white,
                          label: 'Mobile Number',
                          validation: AppValidators.validatePhoneNumber,
                          textInputType: TextInputType.phone,
                          controller: viewModel.phoneController,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your email address',
                          backgroundColor: ColorManager.white,
                          label: 'E-mail address',
                          validation: AppValidators.validateEmail,
                          textInputType: TextInputType.emailAddress,
                          controller: viewModel.emailController,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                          controller: viewModel.passwordController,
                        ),
                        BuildTextField(
                          hint: 'confirm your password',
                          backgroundColor: ColorManager.white,
                          label: 'Confirm Password',
                          validation: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (value !=
                                context
                                    .read<AuthViewModel>()
                                    .passwordController
                                    .text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          isObscured: true,
                          textInputType: TextInputType.text,
                          controller: viewModel.rePasswordController,
                        ),
                        SizedBox(height: AppSize.s20.h),
                        Center(
                          child: SizedBox(
                            height: AppSize.s60.h,
                            width: MediaQuery.of(context).size.width * .9,
                            child: (state is AuthLoadingState &&
                                state.type == AuthProcessType.register)
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : CustomElevatedButton(
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s20,
                              ),
                              onTap: () {
                                if (viewModel.formKey.currentState!
                                    .validate()) {
                                  context.read<AuthViewModel>().register();
                                }
                              },
                            ),
                          ),
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
