import 'package:courses_app/pages/login.dart';
import 'package:courses_app/pages/onbording.dart';
import 'package:courses_app/services/prefe_service.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/eduVista.jpg'),
      ),
    );
  }

  void _startApp() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      if (PreferencesService.isOnBoardingSeen) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const LoginPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (ctx) => const OnboardingPage()));
      }
    }
  }
}
