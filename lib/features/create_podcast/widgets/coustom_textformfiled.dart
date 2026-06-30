import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustomTextformfiled extends StatefulWidget {
  final String label;
  final String hintText;
  final int maxLines;
  final bool isOutlineField;
  final TextEditingController controller;

  const CoustomTextformfiled({
    required this.controller,
    required this.hintText,
    required this.isOutlineField,
    required this.label,
    required this.maxLines,
    super.key,
  });

  @override
  State<CoustomTextformfiled> createState() => _CoustomTextformfiledState();
}

class _CoustomTextformfiledState extends State<CoustomTextformfiled> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: const Color(0xffC084FC),
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: 8.h),
        Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: widget.isOutlineField ? 180.h : 56.h,
            decoration: BoxDecoration(
              color: widget.isOutlineField ? const Color(0xFF0B1220) : Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(
                color: _isFocused
                    ? (widget.isOutlineField ? const Color(0xFF3B82F6) : const Color(0xFF8B5CF6))
                    : Colors.white.withOpacity(.08),
                width: 1.5,
              ),
              boxShadow: _isFocused
                  ? [
                      BoxShadow(
                        color: (widget.isOutlineField ? const Color(0xFF3B82F6) : const Color(0xFF8B5CF6)).withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                      )
                    ]
                  : [],
            ),
            child: TextFormField(
              maxLines: widget.maxLines,
              controller: widget.controller,
              cursorColor: const Color(0xFF8B5CF6),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              ),
              textAlignVertical: widget.isOutlineField ? TextAlignVertical.top : TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: const Color(0xFF6B7280),
                  fontSize: 14.sp,
                ),
                contentPadding: EdgeInsets.all(18.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
