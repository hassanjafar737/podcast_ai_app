import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCard extends StatefulWidget {
  final String imagePath;
  final String name;
  final String category;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const VoiceCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<VoiceCard> createState() => _VoiceCardState();
}

class _VoiceCardState extends State<VoiceCard> with SingleTickerProviderStateMixin {
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
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: const Color(0xff111827),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: widget.isSelected ? const Color(0xff8B5CF6) : Colors.white.withOpacity(0.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      widget.imagePath.replaceAll('"', ''),
                      width: 56.w,
                      height: 56.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          widget.category,
                          style: TextStyle(
                            color: const Color(0xff9CA3AF),
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildPlayButton(),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 11.sp,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerRight,
                child: _buildSelectButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return GestureDetector(
      onTap: () {
        // Handle play preview logic if needed, or keep it as a visual affordance
      },
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xff8B5CF6).withOpacity(0.12),
          border: Border.all(color: const Color(0xff8B5CF6).withOpacity(0.25)),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
    );
  }

  Widget _buildSelectButton() {
    return Container(
      height: 36.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: widget.isSelected
            ? null
            : const LinearGradient(
                colors: [Color(0xff3B82F6), Color(0xff8B5CF6)],
              ),
        color: widget.isSelected ? Colors.transparent : null,
      ),
      child: Center(
        child: IntrinsicWidth(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isSelected)
                Icon(
                  Icons.check_circle_rounded,
                  color: const Color(0xff10B981),
                  size: 16.sp,
                ),
              if (widget.isSelected) SizedBox(width: 6.w),
              Text(
                widget.isSelected ? "Selected" : "Select Voice",
                style: TextStyle(
                  color: widget.isSelected ? const Color(0xff10B981) : Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
