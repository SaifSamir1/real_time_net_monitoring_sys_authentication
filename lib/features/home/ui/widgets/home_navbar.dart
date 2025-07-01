import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/app_colors.dart';
import 'package:animate_do/animate_do.dart';

class HomeNavBar extends StatelessWidget {
  final void Function(String section)? onNavTap;
  const HomeNavBar({super.key, this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 700),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            // Logo
            Row(
              children: [
                SizedBox(width: 12.w),
                Text(
                  'Luminu',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34.sp, // Bigger size
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // Navigation Links
            if (MediaQuery.of(context).size.width > 800)
              Row(
                children: [
                  _NavLink(title: 'Home', onTap: () => onNavTap?.call('Home')),
                  _NavLink(
                    title: 'About',
                    onTap: () => onNavTap?.call('About'),
                  ),
                  _NavLink(
                    title: 'Why Luminu',
                    onTap: () => onNavTap?.call('Why Luminu'),
                  ),
                  _NavLink(
                    title: 'Features',
                    onTap: () => onNavTap?.call('Features'),
                  ),
                  SizedBox(width: 16.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () {
                      // TODO: Get Started action
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            // Hamburger menu for mobile
            if (MediaQuery.of(context).size.width <= 800)
              IconButton(
                icon: const Icon(Icons.menu),
                color: AppColors.white,
                onPressed: () {
                  // TODO: Open Drawer or show modal
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6.r),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
