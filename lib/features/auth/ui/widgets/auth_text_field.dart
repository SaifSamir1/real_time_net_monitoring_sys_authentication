import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';
import '../screens/signup_screen.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool showValidation;
  final VoidCallback? onToggleVisibility;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
    this.showValidation = false,
    this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        autovalidateMode: showValidation ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        style: TextStyle(color: AppColors.white, fontSize: 14.sp),
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          labelStyle: TextStyle(color: AppColors.white.withOpacity(0.7)),
          hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5)),
          errorStyle: TextStyle(
            color: AppColors.errorRed,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: AppColors.darkBlue.withOpacity(0.4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: AppColors.lightBlue.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.greenAccent, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: const BorderSide(color: AppColors.errorRed, width: 2),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.white.withOpacity(0.7),
            ),
            onPressed: onToggleVisibility,
          )
              : null,
        ),
      ),
    );
  }
}
