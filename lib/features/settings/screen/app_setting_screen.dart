import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/settings/widgets/setting_section_tile.dart';
import 'package:podcast_ai_app/features/settings/widgets/setting_tile.dart';
import 'dart:ui';
import '../../../core/services/navigator/navigator.dart';
import '../../library/widgets/library_header.dart';
import '../../profile/widgets/profile_header.dart';

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});
  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050816),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 14.h,
        ),
        child: const BottomNavbar(selectedIndex: 4),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3B82F6).withOpacity(0.08),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withOpacity(0.10),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 120, sigmaY: 120),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child:  DashboardHeaderse( onProfileTap: () {  }, onNotificationTap: () {  }, onSettingsTap: () { AppRoutes.push(context, AppSettingScreen()); },),
                  // child: Row(
                  //   children: [
                  //     Container(
                  //       width: 32.w,
                  //       height: 32.w,
                  //       decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: Colors.white12),
                  //         image: const DecorationImage(
                  //           image: AssetImage("assets/images/myimg.jpg"),
                  //           fit: BoxFit.cover,
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(width: 8.w),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           "VOX AI",
                  //           style: TextStyle(
                  //             color: const Color(0xff4F7CFF),
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18.sp,
                  //           ),
                  //         ),
                  //         Text(
                  //           "The Future of Sound",
                  //           style: TextStyle(
                  //             color: const Color(0xFF9CA3AF),
                  //             fontSize: 10.sp,
                  //             letterSpacing: 0.4,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     const Spacer(),
                  //     ProfileHeader(icon: Icons.notifications_none, onTap: () {}),
                  //     SizedBox(width: 8.w),
                  //   ],
                  // ),
                ),
                Divider(color: Colors.white10, height: 1.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 34.sp,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "Manage your audio workspace and account preferences.",
                            style: TextStyle(
                              color: const Color(0xFF9CA3AF),
                              height: 1.5,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          const SettingsSectionTitle(title: 'APPEARANCE'),
                          SettingsTile(
                            icon: Icons.dark_mode_outlined,
                            title: "Theme",
                            subtitle: "Dark Mode",
                            onTap: () {},
                          ),
                          SizedBox(height: 24.h),
                          const SettingsSectionTitle(title: "AUDIO ENGINE"),
                          SettingsTile(
                            icon: Icons.hd_outlined,
                            title: "Audio Expert Quality",
                            subtitle: "WAV (Lossless, 48kHz)",
                            badge: "PRO",
                            onTap: () {},
                          ),
                          SizedBox(height: 8.h),
                          SettingsTile(
                            icon: Icons.record_voice_over_outlined,
                            title: "AI Voice Models",
                            subtitle: "Hyper-Realistic v2.4",
                            onTap: () {},
                          ),
                          SizedBox(height: 24.h),
                          const SettingsSectionTitle(title: "SYSTEM"),
                          SettingsTile(
                            icon: Icons.notifications_none_outlined,
                            title: "Notification Preferences",
                            subtitle: "Push & Email",
                            onTap: () {},
                          ),
                          SizedBox(height: 8.h),
                          SettingsTile(
                            icon: Icons.hub_outlined,
                            title: "API Connections",
                            subtitle: "Spotify, Anchor, YouTube",
                            onTap: () {},
                          ),
                          SizedBox(height: 32.h),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(30.r),
                              child: Container(
                                width: double.infinity,
                                height: 56.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  border: Border.all(color: Colors.red.withOpacity(0.3)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.red[200],
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      "Logout of VOX AI",
                                      style: TextStyle(
                                        color: Colors.red[200],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Center(
                            child: Text(
                              "VERSION 4.2.0-STABLE | © 2024 VOX ENGINE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white24,
                                letterSpacing: 1,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 120.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
