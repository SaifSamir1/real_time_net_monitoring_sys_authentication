

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final logoSize = screenWidth < 600 ? 120.w : 200.w;

    return ZoomIn(
      duration: const Duration(milliseconds: 800),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.bookedBlue, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 15.r,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: AppColors.lightBlue.withOpacity(0.3),
              blurRadius: 20.r,
              spreadRadius: 5.r,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/app_logo.png',
            height: logoSize,
            width: logoSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
