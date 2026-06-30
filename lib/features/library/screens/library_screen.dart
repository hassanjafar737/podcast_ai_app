import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/library/widgets/library_card.dart';
import 'dart:ui';

import '../../../core/services/navigator/navigator.dart';
import '../../discover/widgets/header_icon.dart';
import '../../player/screens/mini_player.dart';
import '../../player/screens/podcast_player_screen.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/library_header.dart';
import 'library_services.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<dynamic> savedPodcasts = [];
  bool isLoading = true;
  final List<String> filters = [
    "Drafts",
    "Published",
    "Downloads",
    "Favorites",
  ];

  late AnimationController _pulseController;

  Future<void> loadLibraryData() async {
    try {
      final data = await LibraryServices.getPodcasts();
      setState(() {
        savedPodcasts = data.reversed.toList();
        isLoading = false;
      });
    } catch (e) {
      print("DEBUG: Error loading library: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadLibraryData();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
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
        child: const BottomNavbar(selectedIndex: 3),
      ),
      body: Stack(
        children: [

          Positioned(
            top: -100.h,
            left: -100.w,
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
            bottom: 200.h,
            right: -150.w,
            child: Container(
              width: 400.w,
              height: 400.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff8B5CF6).withOpacity(0.12),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  child: DashboardHeaderse(
                    onProfileTap: () {},
                    onNotificationTap: () {},
                    onSettingsTap: () {
                      AppRoutes.push(context, const AppSettingScreen());
                    },
                  ),
                ),
                Divider(color: Colors.white.withOpacity(0.05), height: 1.h),
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
                            "Library",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 34.sp,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "Manage your AI-generated podcasts",
                            style: TextStyle(
                              color: const Color(0xff9CA3AF),
                              fontSize: 14.sp,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 32.h),


                          SizedBox(
                            height: 42.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: filters.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final bool isActive = selectedIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() => selectedIndex = index);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    margin: EdgeInsets.only(right: 12.w),
                                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      gradient: isActive
                                          ? const LinearGradient(
                                              colors: [Color(0xff8B5CF6), Color(0xffA855F7)],
                                            )
                                          : null,
                                      color: isActive ? null : const Color(0xff111827),
                                      border: Border.all(
                                        color: isActive ? Colors.transparent : Colors.white.withOpacity(0.05),
                                      ),
                                      boxShadow: isActive
                                          ? [
                                              BoxShadow(
                                                color: const Color(0xff8B5CF6).withOpacity(0.3),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              )
                                            ]
                                          : [],
                                    ),
                                    child: Center(
                                      child: Text(
                                        filters[index],
                                        style: TextStyle(
                                          color: isActive ? Colors.white : const Color(0xffD1D5DB),
                                          fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 32.h),

                          isLoading
                              ? const Center(child: CircularProgressIndicator(color: Color(0xff8B5CF6)))
                              : savedPodcasts.isEmpty
                                  ? _buildEmptyState()
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: savedPodcasts.length,
                                      itemBuilder: (context, index) {
                                        final podcast = savedPodcasts[index];
                                        final dateStr = podcast['date'] ?? "";
                                        final displayDate = dateStr.split(' ')[0];

                                        return GestureDetector(
                                          onTap: () {
                                            AppRoutes.push(
                                              context,
                                              PodcastPlayerScreen(
                                                audioPaths: List<String>.from(podcast['paths']),
                                                title: podcast['title'] ?? "Untitled Podcast",
                                                description: "Voice: ${podcast['voice'] ?? "AI Voice"}",
                                              ),
                                            );
                                          },
                                          child: LibraryCard(
                                            image: "assets/images/profile2.png",
                                            status: "PUBLISHED",
                                            date: displayDate,
                                            title: podcast['title'] ?? "Untitled Podcast",
                                            duration: "AI Generated",
                                            voice: podcast['voice'] ?? "AI Voice",
                                            favorite: podcast['isFavorite'] ?? false,
                                          ),
                                        );
                                      },
                                    ),
                          SizedBox(height: 120.h),
                        ],
                      ),
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
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        SizedBox(height: 60.h),

        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 180.w,
                height: 180.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xff8B5CF6).withOpacity(0.05),
                ),
              ),
              Icon(
                Icons.mic_none_rounded,
                size: 80.sp,
                color: const Color(0xff8B5CF6).withOpacity(0.5),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          "No Podcasts Yet",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          width: 280.w,
          child: Text(
            "Create your first AI-powered podcast and it will appear here.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xff9CA3AF),
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 32.h),

        Container(
          height: 54.h,
          width: 200.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            gradient: const LinearGradient(
              colors: [Color(0xff8B5CF6), Color(0xff3B82F6)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff8B5CF6).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.r),
              ),
            ),
            child: Text(
              "Create Podcast",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Opacity(
          opacity: 0.6,
          child: Column(
            children: [
              Text(
                "Tap the + button below",
                style: TextStyle(
                  color: const Color(0xff9CA3AF),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 8.h),
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 5 * (1 - _pulseController.value)),
                    child: Icon(
                      Icons.keyboard_double_arrow_down_rounded,
                      color: const Color(0xff8B5CF6),
                      size: 20.sp,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
