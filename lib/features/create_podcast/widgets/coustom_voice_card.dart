import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomVoiceCard extends StatefulWidget {
  final String voiceName;
  final String voiceType;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  final Color accentColor;

  const CustomVoiceCard({
    required this.voiceName,
    required this.voiceType,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
    required this.accentColor,
    super.key,
  });

  @override
  State<CustomVoiceCard> createState() => _CustomVoiceCardState();
}

class _CustomVoiceCardState extends State<CustomVoiceCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: widget.isSelected ? widget.accentColor : Colors.white.withOpacity(.05),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.20),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
              if (widget.isSelected)
                BoxShadow(
                  color: widget.accentColor.withOpacity(0.15),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: widget.accentColor.withOpacity(.12),
                  border: Border.all(color: widget.accentColor.withOpacity(.25)),
                  image: DecorationImage(
                    image: AssetImage(widget.imagePath.replaceAll('"', '')),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.voiceName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.voiceType,
                      style: TextStyle(
                        color: const Color(0xFF9CA3AF),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      widget.isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: widget.isSelected ? widget.accentColor : Colors.white24,
                      size: 22.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.chevron_right,
                    color: const Color(0xFF8B5CF6).withOpacity(.60),
                    size: 22.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
