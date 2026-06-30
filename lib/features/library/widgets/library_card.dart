import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryCard extends StatelessWidget {
  final String image;
  final String status;
  final String date;
  final String title;
  final String duration;
  final String voice;
  final bool favorite;

  const LibraryCard({
    super.key,
    required this.image,
    required this.status,
    required this.date,
    required this.title,
    required this.duration,
    required this.voice,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.asset(
                  image,
                  width: 70.w,
                  height: 70.w,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff8B5CF6).withOpacity(0.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff8B5CF6).withOpacity(0.3),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff1F2937),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: const Color(0xffA855F7),
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      date,
                      style: TextStyle(
                        color: const Color(0xff9CA3AF),
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(
                      Icons.graphic_eq,
                      color: const Color(0xff9CA3AF),
                      size: 14.sp,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        "$duration • $voice",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xff9CA3AF),
                          fontSize: 11.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: favorite ? const Color(0xff8B5CF6) : const Color(0xff9CA3AF),
                size: 20.sp,
              ),
              SizedBox(height: 12.h),
              Icon(
                Icons.more_vert_rounded,
                color: const Color(0xff9CA3AF),
                size: 20.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
