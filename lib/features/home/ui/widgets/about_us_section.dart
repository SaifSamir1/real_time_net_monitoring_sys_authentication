 import 'package:animated_text_kit/animated_text_kit.dart';
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
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40.sp,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          FadeIn(
            duration: const Duration(milliseconds: 900),
            child: AnimatedTextExample(),
          ),
          SizedBox(height: 40.h),
          Divider(
            color: AppColors.white.withOpacity(0.5),
            thickness: 1.5,
            height: 40.h,
          ),
        ],

      ),
    );
  }
}
 class AnimatedTextExample extends StatelessWidget {
  const AnimatedTextExample({super.key});

   @override
   Widget build(BuildContext context) {
     return Center(
       child: AnimatedTextKit(
         animatedTexts: [
           TypewriterAnimatedText(
             "This is a space to share more about the business: who's behind it, what it does and what this site has to offer. It’s an opportunity to tell the story behind the business or describe a special service or product it offers.",
             textAlign: TextAlign.center,
             textStyle: TextStyle(
               color: AppColors.darkBlue,
               fontSize: 25.0,
               fontWeight: FontWeight.w400,
               letterSpacing: 1.2,
             ),
             speed: Duration(milliseconds: 50),
           ),
         ],
         totalRepeatCount: 5,
         pause: Duration(milliseconds: 1000),
         displayFullTextOnTap: true,
         stopPauseOnTap: true,
       ),
     );
   }
 }