import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool completed;
  final VoidCallback? onTap;

  const StatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.completed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22.r),
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: 150.w.clamp(130.0, 180.0),
          height: 85.h.clamp(75.0, 110.0),
          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(36.r),
            border: Border.all(
              color: completed ? Colors.white12 : Colors.white10,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: completed ? const Color(0xffC084FC) : Colors.white38,
                size: 24.sp.clamp(20.0, 30.0),
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: completed ? Colors.white : Colors.white38,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp.clamp(10.0, 14.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
