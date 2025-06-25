import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:go_router/go_router.dart';
import 'package:real_time_net_monitoring_sys/core/routing/routes.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/layout_builder.dart';
import '../widgets/app_branding.dart';
import '../widgets/sign_up_auth_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue.withOpacity(0.8),
              AppColors.lightBlue.withOpacity(0.5),
              AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: ResponsiveScreenUtilInit(
          child: AdaptiveLayout(
            mobileLayout:
                (context) => SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: SignUpAuthForm(maxWidth: 400.w),
                  ),
                ),
            tabletLayout:
                (context) => SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 24.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: AppBranding()),
                        SizedBox(width: 24.w),
                        Expanded(
                          flex: 2,
                          child: SignUpAuthForm(maxWidth: 450.w),
                        ),
                      ],
                    ),
                  ),
                ),
            desktopLayout:
                (context) => SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 24.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: AppBranding()),
                        SizedBox(width: 32.w),
                        Expanded(
                          flex: 2,
                          child: SignUpAuthForm(maxWidth: 550.w),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
