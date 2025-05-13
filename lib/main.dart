import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:chat_dasturi/core/router/app_roter.dart';
import 'package:chat_dasturi/features/authentication/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebase initialization error: $e");
  }
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder:
            (theme, darkTheme) => MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              routerConfig: AppRouter.router,
            ),
      ),
    );
  }
}
