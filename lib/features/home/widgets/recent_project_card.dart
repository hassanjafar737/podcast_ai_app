import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentProjectCard extends StatelessWidget {

  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const RecentProjectCard({

    super.key,

    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30.r),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: 220.w.clamp(180.0, 300.0),
          margin: EdgeInsets.only(
            right: 14.w,
          ),
          padding: EdgeInsets.all(12.w),

          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24.r),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 120.h.clamp(100.0, 160.0),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 12.h,),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp.clamp(12.0, 18.0),
                ),
              ),
              SizedBox(height: 4.h,),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12.sp.clamp(10.0, 14.0),

                ),

              ),

              SizedBox(height: 15.h,),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Container(
                  width: double.infinity,
                  height: 4.h,
                  color: Colors.white10,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 100.w,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff2563EB),
                            Color(0xffC084FC),
                          ],
                        ),
                      ),

                    ),

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );
  }
}