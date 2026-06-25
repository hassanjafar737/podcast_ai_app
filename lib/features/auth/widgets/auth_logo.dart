import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/images/ai_podcast_logo.png",
          width: 80.w,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 12.h),
        Text(
          "VOX AI",
          style: TextStyle(
            color: const Color(0xff5B8CFF),
            fontSize: 24.sp,
            fontWeight: FontWeight.w900,
            letterSpacing: 4,
          ),
        ),
      ],
    );
  }
}
