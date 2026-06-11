import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({
    super.key,
    double? screenWidth, // Old parameter, keeping for compatibility but not using
    double? screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.35),
                  blurRadius: 60,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/ai_podcast_logo.png",
              width: 150.w.clamp(120.0, 200.0),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10.h,),
          Text(
            "VOX AI",
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 48.sp.clamp(32.0, 60.0),
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "THE FUTURE OF AUDIO",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.sp.clamp(10.0, 14.0),
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}