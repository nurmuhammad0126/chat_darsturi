import 'package:chat_dasturi/features/authentication/presentation/pages/forget_pasword.dart';
import 'package:chat_dasturi/features/chat/presentation/pages/in_chat_screen.dart';
import 'package:chat_dasturi/features/main_screen.dart';
import 'package:chat_dasturi/features/photo_screen/presentation/peges/photo_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/pages/login_screen.dart';
import '../../features/authentication/presentation/pages/register_screen.dart';
import '../../features/authentication/presentation/pages/splash_screen.dart';
import '../../features/chat/presentation/pages/chat_screen.dart';
import 'app_route_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRouteNames.chat,
    routes: [
      GoRoute(
        path: AppRouteNames.splash,
        name: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouteNames.login,
        name: AppRouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRouteNames.register,
        name: AppRouteNames.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRouteNames.chat,
        name: AppRouteNames.chat,
        builder: (context, state) => const ChatScreen(),
      ),

      GoRoute(
        path: AppRouteNames.main,
        name: AppRouteNames.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: AppRouteNames.photo,
        name: AppRouteNames.photo,
        builder: (context, state) => const PhotoScreen(),
      ),
      GoRoute(
        path: AppRouteNames.forgetPaswrod,
        name: AppRouteNames.forgetPaswrod,
        builder: (context, state) => const ForgetPasword(),
      ),

      GoRoute(
        path: AppRouteNames.inChat,
        name: AppRouteNames.inChat,
        builder: (context, state) => const InChatScreen(),
      ),
    ],
  );
}
