import 'package:daily_sillimanian_beta/helpers/dsb_theme.dart';
import 'package:daily_sillimanian_beta/screens/sign_in/signin_view.dart';
import 'package:daily_sillimanian_beta/screens/sign_up/signup_view.dart';
import 'package:daily_sillimanian_beta/screens/start_up/startup_pagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: DailySillimanBetaApp()));
}

class DailySillimanBetaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Sillimanian Beta',
      theme: AppTheme(context),
      home: StartUpPageController(),
      // home: SignUpview(),
    );
  }
}
