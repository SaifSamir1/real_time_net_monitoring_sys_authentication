

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/styles/app_colors.dart';

class AuthFooter extends StatelessWidget {
  final bool isSignUp;

  const AuthFooter({super.key, required this.isSignUp});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: const Duration(milliseconds: 700),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isSignUp ? 'Already have an account?' : 'Don\'t have an account?',
            style: TextStyle(fontSize: 14.sp, color: AppColors.white),
          ),
          SizedBox(width: 8.w),
          TextButton(
            onPressed: () => GoRouter.of(context).push(isSignUp ? Routes.signIn : Routes.signUp),
            child: Text(
              isSignUp ? 'Login' : 'Sign Up',
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
