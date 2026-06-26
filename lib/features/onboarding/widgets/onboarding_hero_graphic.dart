import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../onboarding_theme.dart';

class OnboardingHeroGraphic extends StatefulWidget {
  final String imagePath;
  const OnboardingHeroGraphic({super.key, required this.imagePath});

  @override
  State<OnboardingHeroGraphic> createState() => _OnboardingHeroGraphicState();
}

class _OnboardingHeroGraphicState extends State<OnboardingHeroGraphic> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);
    
    _scaleAnimation = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 260.w,
                height: 260.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: VoxAiTheme.glowPurple.withOpacity(0.14),
                      blurRadius: 80,
                      spreadRadius: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: VoxAiTheme.glowBlue.withOpacity(0.12),
                      blurRadius: 100,
                      spreadRadius: 15,
                    ),
                  ],
                ),
              ),
              Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.05),
                      blurRadius: 35,
                    ),
                  ],
                ),
              ),
              Image.asset(
                widget.imagePath,
                width: 300.w,
                height: 300.w,
                fit: BoxFit.contain,
              ),
            ],
          ),
        );
      },
    );
  }
}
