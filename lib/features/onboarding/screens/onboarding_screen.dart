import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_first.dart';
import 'onboarding_second.dart';
import 'onboarding_third.dart';
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() =>
      _OnboardingScreenState();

}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff050816),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const ClampingScrollPhysics(), // Isse piche ki taraf khali screen nahi dikhegi
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                OnboardingFirst(pageController: pageController),
                OnboardingSecond(pageController: pageController),
                OnboardingThird(pageController: pageController),
              ],
            ),
          ),
    Padding(
    padding: EdgeInsets.only(
    bottom: 18.h,
    ),
         child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentIndex == index ? 28.w : 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: currentIndex == index ? Colors.white : Colors.white24,
                ),
              ),
            ),
          ),
    ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

// swipe control krti ha
//  pages ko hold krti ha
//page navigation manage krti ha