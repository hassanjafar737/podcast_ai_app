import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/providers/podcast_provider.dart';
import 'package:podcast_ai_app/core/services/appwrite_service.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/auth/screens/login_screens.dart';
import 'package:podcast_ai_app/features/library/widgets/library_header.dart';
import 'package:podcast_ai_app/features/profile/widgets/card.dart';
import 'package:podcast_ai_app/features/profile/widgets/setting_card.dart';
import 'package:podcast_ai_app/features/subsciptions/screens/subscription_screen.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../../../core/services/navigator/navigator.dart';
import '../../player/screens/mini_player.dart';
import '../../settings/screen/app_setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050816),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: const BottomNavbar(selectedIndex: 4),
      ),
      body: Stack(
        children: [

          Positioned(
            top: -100.h,
            left: -50.w,
            child: Container(
              width: 300.w,
              height: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff3B82F6).withOpacity(0.08),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Positioned(
            bottom: 100.h,
            right: -100.w,
            child: Container(
              width: 400.w,
              height: 400.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff8B5CF6).withOpacity(0.10),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: DashboardHeaderse(onProfileTap: (){}, onNotificationTap: (){}, onSettingsTap: (){AppRoutes.push(context, AppSettingScreen());}),

                ),
                Divider(color: Colors.white.withOpacity(0.05), height: 1.h),
                
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const PremiumMemberCard(image: "assets/images/myimg.jpg"),
                            

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  Expanded(child: _buildStatCard("12", "PODCASTS CREATED", Icons.mic_none_rounded, const Color(0xff3B82F6))),
                                  SizedBox(width: 16.w),
                                  Expanded(child: _buildStatCard("45K", "TOTAL LISTENS", Icons.auto_graph_rounded, const Color(0xff8B5CF6))),
                                ],
                              ),
                            ),
                            
                            SizedBox(height: 32.h),
                            
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text(
                                "Account Settings",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            
                            SettingCard(
                              icon: Icons.person_outline,
                              title: "Edit Profile",
                              subtitle: "Update bio, avatar and social links",
                              accentColor: const Color(0xff3B82F6),
                              onTap: () {},
                            ),
                            SettingCard(
                              icon: Icons.workspace_premium_outlined,
                              title: "Billing & Plan",
                              subtitle: "Manage your Premium subscription",
                              accentColor: const Color(0xff8B5CF6),
                              onTap: () {
                                AppRoutes.push(context, const SubscriptionScreen());
                              },
                            ),
                            SettingCard(
                              icon: Icons.graphic_eq,
                              title: "Audio Quality",
                              subtitle: "Configure AI voice bitrate and output format",
                              accentColor: const Color(0xff22D3EE),
                              onTap: () {},
                            ),
                            

                            Padding(
                              padding: EdgeInsets.only(top: 24.h, left: 16.w, right: 16.w),
                              child: _buildLogoutButton(context),
                            ),
                            
                            SizedBox(height: 110.h),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MiniPlayer(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildStatCard(String value, String label, IconData icon, Color accent) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: accent, size: 20.sp),
              ),

              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: accent.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            value,
            style: TextStyle(

              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: const Color(0xff9CA3AF),
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          await AppWriteServices.account.deleteSession(sessionId: "current");
          Provider.of<PodcastProvider>(context, listen: false).stopAndClear();
          AppRoutes.pushReplacement(context, LoginScreens());
        } catch (e) {
          debugPrint("Logout Error: $e");
        }
      },
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: const Color(0xffEF4444).withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_rounded, color: Color(0xffEF4444)),
            SizedBox(width: 8.w),
            Text(
              "Sign Out",
              style: TextStyle(
                color: const Color(0xffEF4444),
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
