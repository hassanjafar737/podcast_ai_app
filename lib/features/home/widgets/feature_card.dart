// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FeatureCard extends StatelessWidget {
//   final VoidCallback onTap;
//   final IconData icon;
//   final String title;
//   final Color iconColor;
//
//   const FeatureCard({
//     super.key,
//     required this.onTap,
//     required this.icon,
//     required this.title,
//     required this.iconColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(30.r),
//       child: Container(
//         padding: EdgeInsets.all(16.w),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.r),
//           color: const Color(0xff111827),
//           border: Border.all(
//             color: Colors.white.withOpacity(.05),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.20),
//               blurRadius: 20,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: iconColor, size: 30.sp),
//             SizedBox(height: 10.h),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w700,
//                 fontSize: 14.sp,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(24.r),
        onTap: onTap,
        child: Container(
          height: 130.h,
          width: 185,

          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xff111827),
                const Color(0xff0B0F1A),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(.06),
            ),
          ),
          child: Column(
            children: [
               Container(
                width: 60.w,
                height: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: iconColor.withOpacity(.12),
                  border: Border.all(
                    color: iconColor.withOpacity(.25),
                  ),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 40.sp,
                ),
              ),
             //
             //  SizedBox(width: 16.w),
             //
             // Expanded(
             //    child: Column(
             //      mainAxisAlignment: MainAxisAlignment.center,
             //      crossAxisAlignment: CrossAxisAlignment.start,
             //      children: [
              SizedBox(height: 6.h),

              Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10.sp,
                      ),
                    ),
                 // ],
                //),
             // ),

              // Icon(
              //   Icons.chevron_right,
              //   color: Colors.white38,
              //   size: 16.sp,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}