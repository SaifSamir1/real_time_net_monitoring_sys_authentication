



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_colors.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cards = [
      {
        'id': '1',
        'title': 'Smart Savings',
        'desc':
        'Easily plan and track your monthly expenses with our intuitive budget planner.',
      },
      {
        'id': '2',
        'title': 'Smart Analytics',
        'desc':
        'Get insights into your spending habits and discover ways to save more.',
      },
      {
        'id': '3',
        'title': 'Secure Transfers',
        'desc':
        'Transfer money securely and instantly to anyone, anywhere, anytime.',
      },
      {
        'id': '4',
        'title': 'Goal Tracker',
        'desc':
        'Set financial goals and monitor your progress with real-time updates.',
      },
    ];
    return Padding(
      padding: EdgeInsets.only(
        right: 24.w,
        left: 18.w,
        top: 8.h,
        bottom: 8.h,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 500.h, // Increased card height
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          viewportFraction: 1,
        ),
        items:
        cards.map((card) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 28.w,
                  vertical: 32.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryBlue.withOpacity(
                        0.07,
                      ),
                      blurRadius: 18,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      card['id']!,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.sp,
                      ),
                    ),
                    SizedBox(height: 75.h),
                    Text(
                      card['title']!,
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 33.sp,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Flexible(
                      child: Text(
                        card['desc']!,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
