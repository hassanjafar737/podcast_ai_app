import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'package:podcast_ai_app/features/library/widgets/library_card.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../discover/widgets/header_icon.dart';
import '../../player/screens/mini_player.dart';
import '../../player/screens/podcast_player_screen.dart';
import '../../settings/screen/app_setting_screen.dart';
import 'library_services.dart';
class LibraryScreen extends StatefulWidget{
  const LibraryScreen({super.key});
  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}
class _LibraryScreenState extends State<LibraryScreen>{
  int selectedIndex=0;
  List<dynamic> savedPodcasts = [];
   bool isLoading = true;
  final List<String> filters = [
    "Drafts", "Published", "Downloads", "Favorites",
  ];
  Future<void> loadLibraryData() async {
    try {
      final data = await LibraryServices.getPodcasts();
      setState(() {
        savedPodcasts = data.reversed.toList(); // Newest first
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
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
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    "VOX AI",
                    style: TextStyle(
                      color: const Color(0xff4F7CFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp.clamp(16.0, 24.0),
                    ),
                  ),
                  const Spacer(),
                  HeaderIcon(icon: Icons.notifications_none, onTap: () {}),
                  SizedBox(width: 8.w),
                  HeaderIcon(
                    icon: Icons.settings_outlined,
                    onTap: () {
                      AppRoutes.push(context, const AppSettingScreen());
                    },
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white10, height: 1.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 20.h),
                      Text(
                        "Library",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp.clamp(24.0, 40.0),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Manage your AI-generated audio creations.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12.sp.clamp(10.0, 14.0),
                        ),
                      ),
                      SizedBox(height: 25.h),
                      // Filter Chips Row
                      SizedBox(
                        height: 40.h.clamp(35.0, 50.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filters.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.w),
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: selectedIndex == index
                                      ? const Color(0xffD8B4FE)
                                      : const Color(0xff161616),
                                  border: Border.all(
                                    color: Colors.white10,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    filters[index],
                                    style: TextStyle(
                                      color: selectedIndex == index
                                          ? Colors.black
                                          : Colors.white70,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp.clamp(10.0, 14.0),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 25.h),
                      // Actual Podcast List
                      isLoading
                          ? const Center(child: CircularProgressIndicator(color: Color(0xffC084FC)))
                          : savedPodcasts.isEmpty
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 50),
                                    child: Text("No podcasts yet", style: TextStyle(color: Colors.white54)),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: savedPodcasts.length,
                                  itemBuilder: (context, index) {
                                    final podcast = savedPodcasts[index];
                                    final dateStr = podcast['date'] ?? "";
                                    final displayDate = dateStr.split(' ')[0];

                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: GestureDetector(
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
                                      ),
                                    );
                                  },
                                ),
                      SizedBox(height: 100.h),
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
    );
  }
}


