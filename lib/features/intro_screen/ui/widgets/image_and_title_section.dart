



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/app_style.dart';

class ImageAndTitleSection extends StatelessWidget {
  const ImageAndTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/intro_image1.jpg",
          height: 700,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 70.h),
                    Text(
                      "FUTURE-READY,\n SMART BANKING",
                      style: AppStyles.styleBold(
                        getFontSize(baseSize: 60),
                        context,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 150,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "Get Started",
                              style: AppStyles.styleSemiBold(
                                getFontSize(baseSize: 12),
                                context,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "This is a space to welcome visitors to the site.\n"
                          "Grab their attention with copy that\n"
                          "clearly states what the site is about.",
                      style: AppStyles.styleRegular(
                        getFontSize(baseSize: 30),
                        context,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ],
    );
  }
}

