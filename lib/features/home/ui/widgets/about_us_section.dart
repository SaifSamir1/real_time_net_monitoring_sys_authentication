import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 700),
            child: Text(
              'ABOUT US',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          FadeIn(
            duration: const Duration(milliseconds: 900),
            child: SizedBox(
              width: 700.w,
              child: Text(
                "This is a space to share more about the business: who's behind it, what it does and what this site has to offer. It’s an opportunity to tell the story behind the business or describe a special service or product it offers.",
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
