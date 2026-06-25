import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
import 'package:podcast_ai_app/features/library/screens/library_services.dart'; // Assuming this is where library screen or services are

import '../../../core/services/navigator/navigator.dart';
import '../../../core/widgets/bottom_nav_bar.dart';

class ExportSuccessScreen extends StatelessWidget {
  final String title;
  final String audioPath;

  const ExportSuccessScreen({
    super.key,
    required this.title,
    required this.audioPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 14.w,
          right: 14.w,
          bottom: 30.h,
        ),
        child: const BottomNavbar(selectedIndex: 2),
      ),
      backgroundColor: const Color(0xff050816),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20.r),
                    splashColor: Colors.white24,
                    onTap: () {
                      AppRoutes.pushReplacement(context, const HomeScreen());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20.sp.clamp(16.0, 24.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Export Success",
                    style: TextStyle(
                      color: const Color(0xff3B82F6),
                      fontSize: 16.sp.clamp(14.0, 20.0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                color: Colors.white10,
                thickness: 1.h,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 70.w.clamp(60.0, 100.0),
                        height: 70.w.clamp(60.0, 100.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff0B0F1A),
                          border: Border.all(color: Colors.white10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.18),
                              blurRadius: 25,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 35.w.clamp(30.0, 50.0),
                            height: 35.w.clamp(30.0, 50.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff7C5CFF),
                            ),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20.sp.clamp(16.0, 24.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Export\nSuccessful!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.sp.clamp(28.0, 48.0),
                          fontWeight: FontWeight.bold,
                          height: 0.9,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Your podcast '$title'\nhas been saved to your library and\npublished to Spotify.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 12.sp.clamp(10.0, 14.0),
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff0B0F1A),
                          borderRadius: BorderRadius.circular(24.r),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.r),
                              child: Image.asset(
                                "assets/images/trending1.png",
                                width: 120.w.clamp(100.0, 150.0),
                                height: 120.w.clamp(100.0, 150.0),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              "Project Details",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp.clamp(14.0, 20.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "FILE SIZE",
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 10.sp.clamp(8.0, 12.0),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "12.4 MB",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp.clamp(12.0, 18.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 1.w,
                                  height: 35.h,
                                  color: Colors.white10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "DURATION",
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 10.sp.clamp(8.0, 12.0),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "04:12",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp.clamp(12.0, 18.0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35.r),
                          splashColor: Colors.white24,
                          onTap: () {
                            // Navigate to Library (usually index 1 in bottom nav)
                            AppRoutes.pushReplacement(context, const HomeScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            height: 55.h.clamp(45.0, 65.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff2563EB),
                                  Color(0xffC084FC),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.library_music,
                                  color: Colors.white,
                                  size: 18.sp.clamp(16.0, 22.0),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "View in Library",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp.clamp(12.0, 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35.r),
                          splashColor: Colors.white24,
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 50.h.clamp(40.0, 60.0),
                            decoration: BoxDecoration(
                              color: const Color(0xff0B0F1A),
                              borderRadius: BorderRadius.circular(35.r),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white70,
                                  size: 16.sp.clamp(14.0, 20.0),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Share Podcast Link",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp.clamp(10.0, 14.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
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
