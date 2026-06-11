import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/settings/widgets/setting_section_tile.dart';
import 'package:podcast_ai_app/features/settings/widgets/setting_tile.dart';

import '../../profile/widgets/profile_header.dart';

class  AppSettingScreen extends StatefulWidget{
  const AppSettingScreen({super.key});
  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}
class _AppSettingScreenState extends State<AppSettingScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Padding(
          padding: EdgeInsets.only(
            left: 14.w,
            right: 14.w,
            bottom: 14.h,
          ),
          child:BottomNavbar(selectedIndex: 4)),
        body: SafeArea(child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric( horizontal: 16.w, vertical: 10.h,),
          child: Row(
            children: [
              Container(
                width: 32.w.clamp(28.0, 40.0),
                height: 32.w.clamp(28.0, 40.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white12,
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/myimg.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),SizedBox(width: 8.w,),

              Text(
                "VOX AI",
                style: TextStyle(
                  color:  const Color(0xff4F7CFF),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp.clamp(16.0, 24.0),

                ),
              ),
              const Spacer(),
              ProfileHeader(icon:  Icons.notifications_none, onTap: () {  },),
              SizedBox(width: 8.w,),


        ]),
        ),Divider(color: Colors.white10, height: 1.h),
              Expanded(child: SingleChildScrollView(
                child:Padding(padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h,),
                  Text("Settings",style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp.clamp(24.0, 40.0),
                  ),),
                    SizedBox(height: 4.h,),
                    Text("Manage your audio workspace and account\npreferences.",
                    style:TextStyle(
                      color:Colors.white70,
                      height:1.5,
                      fontSize: 14.sp.clamp(12.0, 16.0),
                    )
                    ),
                    SizedBox(height: 30.h,),
                    const SettingsSectionTitle(title: 'APPEARANCE',),
                     SettingsTile(icon: Icons.dark_mode_outlined, title: "Theme", subtitle: "Dark Mode", onTap: (){}),
                    SizedBox(height: 15.h,),
                    const SettingsSectionTitle(title: "AUDIO ENGINE"),
                    SettingsTile(icon: Icons.hd_outlined, title: "Audio Expert Quality", subtitle: "WAV (Lossless, 48kHz)",badge: "PRO"
                        "", onTap: (){}),
                    SizedBox(height: 15.h,),
                    SettingsTile(icon: Icons.record_voice_over_outlined, title:  "AI Voice Models", subtitle: "Hyper-Realistic v2.4", onTap: (){}),
                    SizedBox(height: 15.h,),
                    const SettingsSectionTitle(title: "SYSTEM"),
                    SettingsTile(icon: Icons.notifications_none_outlined, title: "Notification Preferences", subtitle: "Push & Email", onTap: (){}),
                    SizedBox(height: 15.h,),
                    SettingsTile(
                      icon: Icons.hub_outlined,
                      title: "API Connections",
                      subtitle: "Spotify, Anchor, YouTube",
                      onTap:(){},
                    ),
                    SizedBox(height: 40.h,),
                  Material( color:const Color(0xff0B0F1A),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.r),
                      overlayColor:
                      WidgetStateProperty.all(
                        Colors.red.withOpacity(0.08),
                      ),
                      highlightColor: Colors.red.withOpacity(0.05),
                      splashColor: Colors.red.withOpacity(0.08),
                    onTap: (){},
                    child: Container(
                      width:double.infinity,
                      height: 55.h.clamp(45.0, 65.0),
                      decoration:BoxDecoration(
                        color: const Color(0xff0B0F1A),
                        borderRadius: BorderRadius.circular(30.r),
                        border:Border.all(
                          color: Colors.white12
                        ),

                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Icon(
                            Icons.logout,
                            color: Colors.red[200],
                            size: 20.sp.clamp(18.0, 24.0),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Logout of VOX AI",
                            style:TextStyle(
                              color: Colors.red[200],
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp.clamp(12.0, 16.0),
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                  ), SizedBox(height: 20.h,),
                    Center(
                      child:Text(
                        "VERSION 4.2.0-STABLE | © 2024 VOX ENGINE",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          color:Colors.white24,
                          letterSpacing:1,
                          fontSize: 10.sp.clamp(8.0, 12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),

                  ],),))
              )])
        )
    );}}