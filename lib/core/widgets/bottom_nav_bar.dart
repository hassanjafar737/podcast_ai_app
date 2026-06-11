import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/main_create_podcast_screen.dart';
import 'package:podcast_ai_app/features/discover/screens/discover_screen.dart';
import 'package:podcast_ai_app/features/home/screens/home_screen.dart';
import 'package:podcast_ai_app/features/library/screens/library_screen.dart';
import 'package:podcast_ai_app/features/profile/screens/profile_screen.dart';

import '../services/navigator/navigator.dart';
class BottomNavbar extends StatefulWidget {
  final int selectedIndex;
  const BottomNavbar({required this.selectedIndex,super.key});
  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}
  class _BottomNavbarState extends State<BottomNavbar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: const Color(0xff0B0F1A),
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(color: Colors.white10,),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            icon: Icons.home_filled,
            title: "Home",
            isActive: widget.selectedIndex==0,
            onTap: () {
              AppRoutes.push(
                context,
                const HomeScreen(),
                currentIndex: widget.selectedIndex,
                targetIndex: 0,
              );
            },
          ),
          NavItem(
            icon: Icons.explore_outlined,
            title: "Discover",
            isActive: widget.selectedIndex==1,
            onTap: () {
              AppRoutes.push(
                context,
                const DiscoverScreen(),
                currentIndex: widget.selectedIndex,
                targetIndex: 1,
              );
            },
          ),
          Transform.translate(
            offset: const Offset(0, -22),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50.r),
                splashColor: Colors.white24,
                highlightColor: Colors.white10,
                onTap: () {
                  AppRoutes.push(
                    context,
                    const MainCreatePodcastScreen(),
                    currentIndex: widget.selectedIndex,
                    targetIndex: 2,
                  );
                },
                child: Container(
                  width: 60.w.clamp(50.0, 80.0),
                  height: 60.w.clamp(50.0, 80.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff2563EB),
                        Color(0xffC084FC),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.35),
                        blurRadius: 18,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.sp.clamp(24.0, 40.0),
                  ),
                ),
              ),
            ),
          ),
          NavItem(
            icon: Icons.library_music_outlined,
            title: "Library",
            isActive: widget.selectedIndex==3,
            onTap: () {
              AppRoutes.push(
                context,
                const LibraryScreen(),
                currentIndex: widget.selectedIndex,
                targetIndex: 3,
              );            },
          ),
          NavItem(
            icon: Icons.person_outline,
            title: "Profile",
            isActive: widget.selectedIndex==4,
              onTap: () {
                AppRoutes.push(
                  context,
                  const ProfileScreen(),
                  currentIndex: widget.selectedIndex,
                  targetIndex: 4,
                );              },
          ),
        ],
      ),
    );
  }
}
class NavItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const NavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius:BorderRadius.circular(20.r),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isActive
                    ? const Color(0xff8B5CF6)
                    : Colors.white38,
                size: 24.sp.clamp(20.0, 30.0),
              ),
              SizedBox(height: 4.h),
              Text(
                title,
                style: TextStyle(
                  color: isActive
                      ? Colors.white
                      : Colors.white38,
                  fontSize: 11.sp.clamp(9.0, 13.0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
