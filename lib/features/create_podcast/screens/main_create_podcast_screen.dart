import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';

import '../../../core/services/navigator/navigator.dart';
import '../../library/widgets/library_header.dart';
import '../../profile/widgets/profile_header.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/coustom_textformfiled.dart';
import '../widgets/premium_form_button.dart';
import '../widgets/preview-card.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../player/screens/mini_player.dart';

class MainCreatePodcastScreen extends StatefulWidget {
  const MainCreatePodcastScreen({super.key});
  @override
  State<MainCreatePodcastScreen> createState() => _CreatePodcastScreenState();
}

class _CreatePodcastScreenState extends State<MainCreatePodcastScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController outlineController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    outlineController.dispose();
    super.dispose();
  }

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
        child: const BottomNavbar(selectedIndex: 2),
      ),
      body: Stack(
        children: [
          // Background Mesh Orbs
          Positioned(
            top: -100.h,
            left: -50.w,
            child: Container(
              width: 300.w,
              height: 300.w,
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
            bottom: 100.h,
            right: -100.w,
            child: Container(
              width: 400.w,
              height: 400.w,
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
                  child: DashboardHeaderse(
                    onProfileTap: () {},
                    onNotificationTap: () {},
                    onSettingsTap: () {
                      AppRoutes.push(context, const AppSettingScreen());
                    },
                  ),

                ),
                Divider(color: Colors.white10, height: 1.h),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.h),
                              Text(
                                "Create New Podcast",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 34.sp,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.4,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                "Transform your ideas into studio-quality AI podcasts.",
                                style: TextStyle(
                                  color: const Color(0xFF9CA3AF),
                                  fontSize: 14.sp,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 32.h),
                              Container(
                                padding: EdgeInsets.all(24.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111827),
                                  borderRadius: BorderRadius.circular(24.r),
                                  border: Border.all(color: Colors.white.withOpacity(.05)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.25),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    CoustomTextformfiled(
                                      controller: titleController,
                                      hintText: "e.g. The Future of Quantum Computing",
                                      isOutlineField: false,
                                      label: "PODCAST TITLE",
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 24.h),
                                    CoustomTextformfiled(
                                      controller: outlineController,
                                      hintText: "Enter a detailed description or paste your rough notes here...",
                                      isOutlineField: true,
                                      label: "MAIN TOPIC OR SCRIPT OUTLINE",
                                      maxLines: 6,
                                    ),
                                  ],
                                ),
                              ),
                              PremiumFormSection(
                                titleController: titleController,
                                outlineController: outlineController,
                              ),
                              PreviewCard(
                                imagePath: "assets/images/trending1.png",
                                title: "DRAFT PREVIEW",
                                subtitle: "VOX Sound Profile: Cinematic",
                                onTap: () {},
                              ),
                              SizedBox(height: 120.h),
                            ],
                          ),
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
}
