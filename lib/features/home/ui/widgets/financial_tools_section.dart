import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';
import 'carousal_widget.dart';

class FinancialToolsSection extends StatelessWidget {
  const FinancialToolsSection({super.key, this.isMobile = false});
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35.r),
          bottomRight: Radius.circular(35.r),
        ),
      ),
       // Changed background to pure white
      padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 0),
      child: Center(
        child: isMobile ?
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 18.w,
                top: 18.h,
                bottom: 18.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'FINANCIAL TOOLS',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    'Streamline Your Banking',
                    style: TextStyle(
                      color: AppColors.secondaryBlue,
                      fontWeight: FontWeight.w600,
                      fontSize: 40.sp,
                    ),
                  ),

                  SizedBox(height: 150.h),
                  Text(
                    'This is the space to introduce the Services section.\nBriefly describe the types of services offered and\nhighlight any special benefits or features.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColors.primaryBlue.withOpacity(0.8),
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w400,

                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            CarousalWidget(),
          ],
        )
        :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left side: Texts
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 18.w,
                  top: 18.h,
                  bottom: 18.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FINANCIAL TOOLS',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'Streamline Your Banking',
                      style: TextStyle(
                        color: AppColors.secondaryBlue,
                        fontWeight: FontWeight.w600,
                        fontSize: 40.sp,
                      ),
                    ),

                    SizedBox(height: 150.h),
                    Text(
                      'This is the space to introduce the Services section.\nBriefly describe the types of services offered and\nhighlight any special benefits or features.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: AppColors.primaryBlue.withOpacity(0.8),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w400,

                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right side: Carousel
            Expanded(
              flex: 4,
              child: CarousalWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

