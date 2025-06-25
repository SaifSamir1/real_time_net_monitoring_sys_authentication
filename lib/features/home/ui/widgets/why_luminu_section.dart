import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class WhyLuminuSection extends StatelessWidget {
  const WhyLuminuSection({super.key});

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
              'WHY LUMINU?',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          FadeIn(
            duration: const Duration(milliseconds: 900),
            child: Text(
              'Your Privacy is our priority',
              style: TextStyle(
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 32.w,
            runSpacing: 32.h,
            children: const [
              _WhyCard(
                number: '01',
                title: 'Customer-Centric Focus',
                description:
                    'This is the space to introduce the Services section. Briefly describe the types of services offered and highlight any special benefits or features.',
              ),
              _WhyCard(
                number: '02',
                title: 'Commitment to Security',
                description:
                    'This is the space to introduce the Services section. Briefly describe the types of services offered and highlight any special benefits or features.',
              ),
              _WhyCard(
                number: '03',
                title: 'Transparent and Fair Practices',
                description:
                    'This is the space to introduce the Services section. Briefly describe the types of services offered and highlight any special benefits or features.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  const _WhyCard({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 900),
      child: Container(
        width: 300.w,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number,
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.darkBlue, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
