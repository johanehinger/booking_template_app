import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_influencer_template_app/design/theme_colors.dart';
import 'package:social_influencer_template_app/screens/auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: ThemeColors.primary,
      ),
      home: AuthScreen(),
    );
  }
}
