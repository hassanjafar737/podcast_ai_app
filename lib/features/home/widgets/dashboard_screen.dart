import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../discover/widgets/header_icon.dart';
import '../../settings/screen/app_setting_screen.dart';

class DashboardHeader extends StatelessWidget{
  const DashboardHeader({ super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            children: [
              Container(
                width: 32.w.clamp(28.0, 40.0),
                height: 32.w.clamp(28.0, 40.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blueAccent,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/profile.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "VOX AI",
                style: TextStyle(
                  color: const Color(0xff5B8CFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp.clamp(16.0, 24.0),
                ),
              ),
              const Spacer(),
              HeaderIcon(icon:Icons.notifications_none , onTap: () {  },),
              SizedBox(width: 8.w),
              HeaderIcon(icon: Icons.settings_outlined,onTap: (){AppRoutes.push(context,const AppSettingScreen());},),
            ],
          ),
        Divider(color: Colors.white10, height: 20.h),
      ],

    );

  }}