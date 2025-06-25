import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 24.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'SMART BANKING FOR THE FUTURE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
                fontSize: 44.sp,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 18.h),
          FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: Text(
              "This is a space to welcome visitors to the site.\nGrab their attention with copy that clearly states what the site is about.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBlue,
                padding: EdgeInsets.symmetric(horizontal: 44.w, vertical: 18.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 6,
              ),
              onPressed: () {},
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
