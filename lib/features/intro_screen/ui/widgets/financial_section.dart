



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_style.dart';
import '../../data/models/card_item.dart';
import 'carousle_servise.dart';

class FinancialSection extends StatelessWidget {
  const FinancialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "FINANCIAL TOOLS",
                    style: AppStyles.styleBold(
                      getFontSize(baseSize: 30),
                      context,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Streamline Your Banking",
                    style: AppStyles.styleBold(
                      getFontSize(baseSize: 60),
                      context,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    "This is the space to introduce the Services section. Briefly describe the types of services offered and highlight any special benefits or features.",
                    style: AppStyles.styleRegular(
                      getFontSize(baseSize: 30),
                      context,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(child: ServicesCarousel(items: cardItems)),
          ],
        ),
      ),
    );
  }
}
