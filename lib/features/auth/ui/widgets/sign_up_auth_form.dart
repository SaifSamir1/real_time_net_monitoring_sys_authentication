


import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../cubit/signup/signup_cubit.dart';
import '../../cubit/signup/signup_state.dart';
import 'auth_button.dart';
import 'auth_footer.dart';
import 'auth_text_field.dart';

class SignUpAuthForm extends StatelessWidget {
  final double maxWidth;

  const SignUpAuthForm({super.key, required this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpCubit>();
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          GoRouter.of(context).pushReplacement(Routes.webIntroScreen);
        } else if (state is SignUpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: AppColors.errorRed,
            ),
          );
        }
      },
      child: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          return Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 25.r,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Form(
              key: cubit.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        shadows: [
                          Shadow(
                            color: AppColors.shadow,
                            blurRadius: 10.r,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 100),
                    child: AuthTextField(
                      controller: cubit.nameController,
                      label: 'Full Name',
                      hintText: 'John Doe',
                      showValidation: state.showValidation,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: AuthTextField(
                      controller: cubit.emailController,
                      label: 'Email',
                      hintText: 'example@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                      showValidation: state.showValidation,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value!)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  FadeInRight(

                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 300),
                    child: AuthTextField(
                      controller: cubit.nationalIdController,
                      label: 'National ID',
                      hintText: '12345678901234',
                      keyboardType: TextInputType.number,
                      showValidation: state.showValidation,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your national ID';
                        }
                        return null;
                      },
                    ),
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 400),
                    child: AuthTextField(
                      controller: cubit.passwordController,
                      label: 'Password',
                      hintText: '********',
                      isPassword: true,
                      obscureText: state.obscurePassword,
                      showValidation: state.showValidation,
                      onToggleVisibility: cubit.togglePasswordVisibility,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your password';
                        }
                        if (value!.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 500),
                    child: AuthTextField(
                      controller: cubit.confirmPasswordController,
                      label: 'Confirm Password',
                      hintText: '********',
                      isPassword: true,
                      obscureText: state.obscureConfirmPassword,
                      showValidation: state.showValidation,
                      onToggleVisibility: cubit.toggleConfirmPasswordVisibility,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please confirm your password';
                        }
                        if (value != cubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 32.h),
                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return FadeInUp(
                        duration: const Duration(milliseconds: 600),
                        delay: const Duration(milliseconds: 600),
                        child: AuthButton(
                          text: 'Sign Up',
                          isLoading: state is SignUpLoading,
                          onPressed: () async {
                            await cubit.signUp();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                  AuthFooter(isSignUp: true),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


