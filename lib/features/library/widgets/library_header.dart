// import 'package:flutter/material.dart';
//
// class HeaderIcon extends StatelessWidget{
//   final IconData icon;
//   final VoidCallback onTap;
//   const HeaderIcon({
//     super.key,
//     required this.icon,
//     required this.onTap,
//   });
//   @override
//   Widget build(BuildContext context){
//     return Material(
//       color:Colors.transparent,
//       child:InkWell(
//         borderRadius:BorderRadius.circular(20),
//         splashColor:Colors.white24,
//         onTap:onTap,
//         child:Padding(
//           padding:const EdgeInsets.all(6),
//           child:Icon(
//             icon,
//             color:Colors.white70,
//             size:20,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class DashboardHeaderse extends StatelessWidget {
  final VoidCallback onProfileTap;
  final VoidCallback onNotificationTap;
  final VoidCallback onSettingsTap;

  const DashboardHeaderse({
    super.key,
    required this.onProfileTap,
    required this.onNotificationTap,
    required this.onSettingsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:10.w,
        vertical: 8.h
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white10,
                  width: 1.5,
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/myimg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "VOX AI",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                  fontSize: 18.sp,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                "The Future of Sound",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          _HeaderActionButton(
            icon: Icons.notifications_none_rounded,
            onTap: onNotificationTap,
          ),
          SizedBox(width: 8.w),
          _HeaderActionButton(
            icon: Icons.settings_outlined,
            onTap: onSettingsTap,
          ),
        ],
      ),
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderActionButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            color: Colors.white.withOpacity(0.03),
          ),
          child: Icon(
            icon,
            color: Colors.white70,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
