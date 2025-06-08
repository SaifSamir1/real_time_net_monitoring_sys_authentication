import 'package:flutter/material.dart';
import 'package:real_time_net_monitoring_sys/features/intro_screen/ui/widgets/financial_section.dart';
import 'package:real_time_net_monitoring_sys/features/intro_screen/ui/widgets/image_and_title_section.dart';
import '../../../core/styles/layout_builder.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenUtilInit(
      child: Scaffold(
        body: SafeArea(
          child: AdaptiveLayout(
            mobileLayout: (context) => WebIntroScreenDesktop(),
            tabletLayout: (context) => WebIntroScreenDesktop(),
            desktopLayout: (context) => WebIntroScreenDesktop(),
          ),
        ),
      ),
    );
  }
}

class WebIntroScreenDesktop extends StatelessWidget {
  const WebIntroScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageAndTitleSection(),
          FinancialSection(),
        ],
      ),
    );
  }
}


