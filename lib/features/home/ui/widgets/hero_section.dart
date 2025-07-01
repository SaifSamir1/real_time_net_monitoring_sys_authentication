import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../core/styles/app_colors.dart';


class HeroSection extends StatefulWidget {
  const HeroSection({super.key,  this.isMobile = false, this.isTablet = false});
  final bool isMobile;
  final bool isTablet;
  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  "FUTURE-READY,\nSMART BANKING",
                  textAlign: TextAlign.left,
                  textStyle: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: widget.isMobile ? 40.sp : 60.sp,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.13),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  speed: const Duration(milliseconds: 200),
                ),
              ],
              totalRepeatCount: 10,
              pause: Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,// Repeat only once
            ),
          ),
          SizedBox(height: 70.h),
          // Improved button between the two texts
          Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: FadeInUp(
              duration: const Duration(milliseconds: 900),
              child:InkWell(
                onTap: () {},
                child: Container(
                  width: widget.isMobile ? 160.w : 220.w, // عرض الزر (يمكن تعديله حسب الحاجة)
                  height: widget.isMobile ? 50.h : 70.h, // ارتفاع الزر
                  decoration: BoxDecoration(
                    color: Colors.white, // خلفية الزر بيضا
                    borderRadius: BorderRadius.circular(30), // زوايا دائرية
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: SizedBox(width: 20.w)), // مسافة بادئة
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(
                      ), // مسافة بين النص والسهم
                      CircleAvatar(
                        radius: widget.isMobile ? 17.r : 25.r,
                        backgroundColor: Colors.black, // خلفية السهم سودة
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
          SizedBox(height: widget.isMobile ? 150.h : widget.isTablet ? 170.h  : 250.h),
          FadeIn(
            duration: const Duration(milliseconds: 1000),
            child: AutoSizeText(
              "This is a space to welcome visitors to the site.\nGrab their attention with copy that clearly states what the site is about.",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.white70,
                fontSize: 22.0.sp, // حجم الخط
                fontWeight: FontWeight.w400,
                height: 1.5,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 4,
                  ),
                ],
              ),
              maxLines: 2, // تحديد عدد الأسطر القصوى
              minFontSize: 14.0, // الحد الأدنى للحجم
              overflow: TextOverflow.ellipsis, // إذا زاد عن 2 سطر
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}