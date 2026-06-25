import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/auth/screens/login_screens.dart';
import '../../../core/services/navigator/navigator.dart';
import '../onboarding_theme.dart';
import '../widgets/onboarding_hero_graphic.dart';
import '../widgets/onboarding_cta_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _content = [
    {
      "title": "Create Studio-Quality\nPodcasts with AI",
      "subtitle": "Transform ideas into professional audio with advanced scripting and neural voice synthesis.",
      "image": "assets/images/onboarding1.png"
    },
    {
      "title": "Natural AI Voices\nThat Sound Human",
      "subtitle": "Choose from a curated library of high-fidelity voices or clone your own voice in seconds.",
      "image": "assets/images/onboarding2.png"
    },
    {
      "title": "Publish & Scale\nAcross Platforms",
      "subtitle": "Seamlessly distribute your content to Spotify, Apple Podcasts, and beyond with one click.",
      "image": "assets/images/onboardi12.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: VoxAiTheme.darkTheme,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -150.h,
              right: -100.w,
              child: _buildBackgroundGlow(VoxAiTheme.glowPurple.withOpacity(0.08)),
            ),
            Positioned(
              bottom: -150.h,
              left: -100.w,
              child: _buildBackgroundGlow(VoxAiTheme.glowBlue.withOpacity(0.06)),
            ),
            
            SafeArea(
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) => setState(() => _currentIndex = i),
                      itemCount: _content.length,
                      itemBuilder: (context, index) => _buildPage(_content[index]),
                    ),
                  ),
                  _buildFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "VOX AI",
            style: TextStyle(
              color: VoxAiTheme.glowBlue,
              fontWeight: FontWeight.w900,
              fontSize: 18.sp,
              letterSpacing: 1.5,
            ),
          ),
          TextButton(
            onPressed: () => AppRoutes.pushReplacement(context, const LoginScreens()),
            child: const Text(
              "SKIP",
              style: TextStyle(color: VoxAiTheme.textSecondary, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Map<String, String> data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingHeroGraphic(imagePath: data["image"]!),
          SizedBox(height: 40.h),
          Text(
            data["title"]!,
            textAlign: TextAlign.center,
            style: VoxAiTheme.darkTheme.textTheme.displayLarge,
          ),
          SizedBox(height: 16.h),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280.w),
            child: Text(
              data["subtitle"]!,
              textAlign: TextAlign.center,
              style: VoxAiTheme.darkTheme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAnimatedIndicators(),
          SizedBox(height: 40.h),
          OnboardingCtaButton(
            text: _currentIndex == _content.length - 1 ? "GET STARTED" : "CONTINUE",
            onTap: () {
              if (_currentIndex < _content.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.fastOutSlowIn,
                );
              } else {
                AppRoutes.pushReplacement(context, const LoginScreens());
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _content.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: _currentIndex == index ? 28.w : 8.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color: _currentIndex == index ? VoxAiTheme.accent : VoxAiTheme.border,
            boxShadow: _currentIndex == index ? [
              BoxShadow(color: VoxAiTheme.accent.withOpacity(0.5), blurRadius: 12)
            ] : null,
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundGlow(Color color) {
    return Container(
      width: 400.w,
      height: 400.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
        ),
      ),
    );
  }
}
