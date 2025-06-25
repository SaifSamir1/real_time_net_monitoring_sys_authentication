import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

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
              'Our Features',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
              ),
            ),
          ),
          SizedBox(height: 32.h),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 32.w,
            runSpacing: 32.h,
            children: const [
              _FeatureCard(
                icon: Icons.security,
                title: 'Secure',
                description:
                    'Bank with confidence using our top-notch security.',
              ),
              _FeatureCard(
                icon: Icons.flash_on,
                title: 'Fast',
                description: 'Lightning-fast transactions and support.',
              ),
              _FeatureCard(
                icon: Icons.smartphone,
                title: 'Smart',
                description: 'AI-powered insights for your finances.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 900),
      child: Container(
        width: 260.w,
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
            Icon(icon, size: 48.w, color: AppColors.primaryBlue),
            SizedBox(height: 16.h),
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
