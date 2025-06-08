

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';
import 'app_logo.dart';
class AppBranding extends StatelessWidget {
  const AppBranding({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Real Time Monitoring\nNetwork System',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
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
          SizedBox(height: 32.h),
          const AppLogo(),
        ],
      ),
    );
  }
}
