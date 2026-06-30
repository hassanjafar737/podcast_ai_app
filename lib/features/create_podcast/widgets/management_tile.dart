import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManagementTile extends StatelessWidget {
  final IconData leftIcon;
  final String title;
  final String subtitle;
  final IconData rightIcon;
  final VoidCallback onTap;

  const ManagementTile({
    super.key,
    required this.leftIcon,
    required this.title,
    required this.subtitle,
    required this.rightIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: Colors.white.withOpacity(.05),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 18,
                offset: const Offset(0, 8),
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
                  color: const Color(0xffC084FC).withOpacity(0.12),
                ),
                child: Icon(
                  leftIcon,
                  color: const Color(0xffC084FC),
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFF9CA3AF),
                        height: 1.5,
                        fontSize: 12.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Icon(
                rightIcon,
                color: Colors.white.withOpacity(.45),
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
