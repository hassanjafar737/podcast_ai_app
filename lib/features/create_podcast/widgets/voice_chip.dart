import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const VoiceChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            gradient: isSelected
                ? const LinearGradient(
                    colors: [
                      Color(0xff3B82F6),
                      Color(0xff8B5CF6),
                    ],
                  )
                : null,
            color: isSelected ? null : const Color(0xff111827),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.white.withOpacity(0.05),
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff8B5CF6).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xffD1D5DB),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
