import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: Text(
              'About Luminu',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          FadeIn(
            duration: const Duration(milliseconds: 900),
            child: SizedBox(
              width: 700.w,
              child: Text(
                'Luminu is a next-generation digital bank designed to make your financial life easier, smarter, and more secure. Our mission is to empower you with innovative tools and seamless experiences.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.darkBlue, fontSize: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
