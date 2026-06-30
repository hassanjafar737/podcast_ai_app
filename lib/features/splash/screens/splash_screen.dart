import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:podcast_ai_app/core/services/auth_services.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
import 'package:podcast_ai_app/features/onboarding/screens/onboarding_screen.dart';
import 'package:podcast_ai_app/features/splash/widgets/splash_logo.dart';
import '../../../core/services/navigator/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gonextscreen();
  }

  void gonextscreen() async {
    await Future.delayed(const Duration(seconds: 4));

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
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.08),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withOpacity(0.10),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: const SplashLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
