import 'package:flutter/material.dart';
import 'package:podcast_ai_app/core/services/auth_services.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
import 'package:podcast_ai_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:podcast_ai_app/features/splash/widgets/splash_logo.dart';

import '../../../core/services/navigator/navigator.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    gonextscreen();
  }
  
  void gonextscreen() async {
    await Future.delayed(const Duration(seconds: 3));
    
    if (!mounted) return;
    final authService = AuthServices();
    bool loggedIn = await authService.isLoggedIn();

    if (mounted) {

      if (loggedIn) {

        AppRoutes.pushReplacement(context, const HomeScreen());
      } else {

        AppRoutes.pushReplacement(context, const OnboardingScreen());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff0B0F1A),
      body: Center(
        child: SplashLogo(),
      ),
    );
  }
}