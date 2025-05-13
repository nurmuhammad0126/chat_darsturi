import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/login_screen.dart';
import '../../features/authentication/presentation/pages/register_screen.dart';
import '../../features/authentication/presentation/pages/splash_screen.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import 'app_route_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: AppRouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
