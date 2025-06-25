import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

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
              'TESTIMONIALS',
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 32.sp,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 32.w,
            runSpacing: 32.h,
            children: const [
              _TestimonialCard(
                name: 'Sarah M.',
                text:
                    'Luminu made banking so easy and secure! Highly recommended.',
              ),
              _TestimonialCard(
                name: 'Ahmed K.',
                text:
                    'The customer support is amazing and the app is super fast.',
              ),
              _TestimonialCard(
                name: 'Lina S.',
                text:
                    'I love the smart features and the privacy focus. Great job!',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String name;
  final String text;
  const _TestimonialCard({required this.name, required this.text});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 900),
      child: Container(
        width: 320.w,
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
            Icon(Icons.format_quote, color: AppColors.primaryBlue, size: 32.w),
            SizedBox(height: 12.h),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 16.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              name,
              style: TextStyle(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
