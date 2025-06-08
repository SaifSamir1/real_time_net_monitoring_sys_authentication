import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';
import '../screens/signup_screen.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          elevation: 0,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryBlue, AppColors.bookedBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            alignment: Alignment.center,
            child: isLoading
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            )
                : Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
