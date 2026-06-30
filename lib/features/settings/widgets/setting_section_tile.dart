import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsSectionTitle extends StatelessWidget {
  final String title;
  const SettingsSectionTitle({
    super.key,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: TextStyle(
          color: const Color(0xFF9CA3AF),
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
