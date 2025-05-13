import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark) {
              AdaptiveTheme.of(context).setLight();
            } else {
              AdaptiveTheme.of(context).setDark();
            }
          },
          icon: Icon(Icons.dark_mode),
        ),
      ),
      body: Center(child: Text("Setting screen")),
    );
  }
}