import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_time_net_monitoring_sys/features/intro_screen/ui/intro_screen.dart';
import 'animation_route.dart';
import 'routes.dart';


abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.webIntroScreen,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const IntroScreen());
        },
      ),
    ],
  );
}