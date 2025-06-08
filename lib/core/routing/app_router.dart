import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_time_net_monitoring_sys/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:real_time_net_monitoring_sys/features/auth/ui/screens/login_screen.dart';
import 'package:real_time_net_monitoring_sys/features/auth/ui/screens/signup_screen.dart';
import 'package:real_time_net_monitoring_sys/features/intro_screen/ui/intro_screen.dart';
import '../../features/auth/cubit/login/login_cubit.dart';
import '../../features/auth/cubit/signup/signup_cubit.dart';
import 'animation_route.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.signUp,
        pageBuilder: (context, state) {
          return fadeTransitionPage(
            BlocProvider(
              create:
                  (context) =>
                      SignUpCubit(authRepository: AuthRepositoryImpl()),
              child: const SignUpScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.signIn,
        pageBuilder: (context, state) {
          return fadeTransitionPage(
            BlocProvider(
              create:
                  (context) => LogInCubit(authRepository: AuthRepositoryImpl()),
              child: const LogInScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.webIntroScreen,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const IntroScreen());
        },
      ),
    ],
  );
}
