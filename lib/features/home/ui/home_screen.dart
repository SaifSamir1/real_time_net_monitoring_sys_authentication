import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/layout_builder.dart';
import 'widgets/home_navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/features_section.dart';
import 'widgets/about_us_section.dart';
import 'widgets/why_luminu_section.dart';
import 'widgets/testimonials_section.dart';
import 'widgets/financial_tools_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _whyKey = GlobalKey();
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  controller: _scrollController,
                  child: Column(
                    children: [
                      BackGroundImage(
                        child: Column(
                          children: [
                            HomeNavBar(
                              onNavTap: (section) {
                                switch (section) {
                                  case 'Home':
                                    scrollToSection(_homeKey);
                                    break;
                                  case 'About':
                                    scrollToSection(_aboutKey);
                                    break;
                                  case 'Why Luminu':
                                    scrollToSection(_whyKey);
                                    break;
                                  case 'Features':
                                    scrollToSection(_featuresKey);
                                    break;
                                  case 'Testimonials':
                                    scrollToSection(_testimonialsKey);
                                    break;
                                }
                              },
                            ),
                            Container(key: _homeKey, child: const HeroSection(
                              isMobile: true,
                            )),
                          ],
                        ),
                      ),
                      const FinancialToolsSection(
                        isMobile: true,
                      ),
                      Container(key: _aboutKey, child: const AboutUsSection()),
                      Container(key: _whyKey, child: const WhyLuminuSection()),
                      Container(
                        key: _featuresKey,
                        child: const FeaturesSection(),
                      ),
                      Container(
                        key: _testimonialsKey,
                        child: const TestimonialsSection(),
                      ),
                    ],
                  ),
                ),
            tabletLayout:
                (context) => SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      BackGroundImage(
                        child: Column(
                          children: [
                            HomeNavBar(
                              onNavTap: (section) {
                                switch (section) {
                                  case 'Home':
                                    scrollToSection(_homeKey);
                                    break;
                                  case 'About':
                                    scrollToSection(_aboutKey);
                                    break;
                                  case 'Why Luminu':
                                    scrollToSection(_whyKey);
                                    break;
                                  case 'Features':
                                    scrollToSection(_featuresKey);
                                    break;
                                  case 'Testimonials':
                                    scrollToSection(_testimonialsKey);
                                    break;
                                }
                              },
                            ),
                            Container(key: _homeKey, child: const HeroSection(
                              isTablet: true,
                            )),
                          ],
                        ),
                      ),
                      const FinancialToolsSection(),
                      Container(key: _aboutKey, child: const AboutUsSection()),
                      Container(key: _whyKey, child: const WhyLuminuSection()),
                      Container(
                        key: _featuresKey,
                        child: const FeaturesSection(),
                      ),
                      Container(
                        key: _testimonialsKey,
                        child: const TestimonialsSection(),
                      ),
                    ],
                  ),
                ),
            desktopLayout:
                (context) => SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      BackGroundImage(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeNavBar(
                              onNavTap: (section) {
                                switch (section) {
                                  case 'Home':
                                    scrollToSection(_homeKey);
                                    break;
                                  case 'About':
                                    scrollToSection(_aboutKey);
                                    break;
                                  case 'Why Luminu':
                                    scrollToSection(_whyKey);
                                    break;
                                  case 'Features':
                                    scrollToSection(_featuresKey);
                                    break;
                                  case 'Testimonials':
                                    scrollToSection(_testimonialsKey);
                                    break;
                                }
                              },
                            ),
                            Container(key: _homeKey, child: const HeroSection()),
                          ],
                        ),
                      ),
                      const FinancialToolsSection(),
                      Container(key: _aboutKey, child: const AboutUsSection()),
                      Container(key: _whyKey, child: const WhyLuminuSection()),
                      Container(
                        key: _featuresKey,
                        child: const FeaturesSection(),
                      ),
                      Container(
                        key: _testimonialsKey,
                        child: const TestimonialsSection(),
                      ),
                    ],
                  ),
                ),
          ),
        ),
      ),
    );
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key, required this.child, this.isMobile = false});
  final Widget child;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isMobile ? 1050.h : 1000.h, // Large height for a prominent hero section
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/intro_image1.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.45), // dark overlay for text readability
            BlendMode.darken,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.18),
            blurRadius: 32,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: child,
    );
  }
}
