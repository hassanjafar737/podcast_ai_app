import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../onboarding_theme.dart';

class OnboardingCtaButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OnboardingCtaButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 58.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        gradient: const LinearGradient(
          colors: [VoxAiTheme.primary, VoxAiTheme.accent],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: VoxAiTheme.primary.withOpacity(0.35),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30.r),
          splashColor: Colors.white.withOpacity(0.1),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: VoxAiTheme.textPrimary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
