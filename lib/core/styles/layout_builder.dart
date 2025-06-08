import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout(context);
        } else if (constraints.maxWidth < 1024) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}


/// تعريف أحجام التصميم لكل نوع جهاز
const Size mobileDesignSize = Size(375, 812);
const Size tabletDesignSize = Size(768, 1024);
const Size desktopDesignSize = Size(1440, 1024);

class ResponsiveScreenUtilInit extends StatelessWidget {
  final Widget child;
  const ResponsiveScreenUtilInit({super.key, required this.child});

  Size _getDesignSize(double width) {
    if (width < 600) {
      return mobileDesignSize;
    } else if (width < 1024) {
      return tabletDesignSize;
    } else {
      return desktopDesignSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery للحصول على حجم الشاشة
    final screenWidth = MediaQuery.of(context).size.width;
    final designSize = _getDesignSize(screenWidth);

    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return child!;
      },
      child: child,
    );
  }
}

