import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingPodcastTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onTap;

  const TrendingPodcastTile({
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
        borderRadius: BorderRadius.circular(24.r),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 12.h,
          ),
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.asset(
                  imagePath,
                  width: 60.w.clamp(50.0, 80.0),
                  height: 60.w.clamp(50.0, 80.0),
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 14.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12.sp.clamp(10.0, 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w,),
              Material(
                color:Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  splashColor: Colors.white10,
                  highlightColor: Colors.white10,
                  onTap: onTap,
                  child: Container(
                    width: 40.w.clamp(35.0, 50.0),
                    height: 40.w.clamp(35.0, 50.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff2563EB),
                          Color(0xffC084FC),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.trending_up,
                      color: Colors.white,
                      size: 20.sp.clamp(18.0, 24.0),
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