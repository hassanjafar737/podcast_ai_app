import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/model/voice_model.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/ai_generating_loading.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/voice_selection_screen.dart';
import 'package:podcast_ai_app/features/library/widgets/library_header.dart';
import 'dart:ui';
import '../../../core/services/navigator/navigator.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/coustom_voice_card.dart';
import '../widgets/management_tile.dart';
import '../widgets/script_box.dart';

class ScriptGeneratorScreen extends StatefulWidget {
  final String script;
  const ScriptGeneratorScreen({super.key, required this.script});
  @override
  State createState() => _ScriptGeneratorScreenState();
}

class _ScriptGeneratorScreenState extends State<ScriptGeneratorScreen> with TickerProviderStateMixin {
  VoiceModel? selectedHostVoice;
  VoiceModel? selectedGuestVoice;

  late AnimationController _btnController;
  late Animation<double> _btnScale;

  @override
  void initState() {
    super.initState();
    _btnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _btnScale = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _btnController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _btnController.dispose();
    super.dispose();
  }

  Future<void> _selectHostVoice() async {
    final result = await AppRoutes.push(
      context,
      VoiceSelectionScreen(
        selectedVoices: selectedHostVoice != null ? [selectedHostVoice!.voiceId] : [],
      ),
    );
    if (result != null && result is VoiceModel) {
      setState(() {
        selectedHostVoice = result;
      });
    }
  }

  Future<void> _selectGuestVoice() async {
    final result = await AppRoutes.push(
      context,
      VoiceSelectionScreen(
        selectedVoices: selectedGuestVoice != null ? [selectedGuestVoice!.voiceId] : [],
      ),
    );
    if (result != null && result is VoiceModel) {
      setState(() {
        selectedGuestVoice = result;
      });
    }
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 24.h),
                          Text(
                            "Script Generator",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 34.sp,
                              letterSpacing: -0.4,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "Select AI voices for your Host and Guest before generating your podcast.",
                            style: TextStyle(
                              color: const Color(0xFF9CA3AF),
                              fontSize: 14.sp,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 32.h),
                          ScriptBox(script: widget.script),
                          SizedBox(height: 32.h),
                          Row(
                            children: [
                              Text(
                                "SELECT AI VOICES",
                                style: TextStyle(
                                  color: const Color(0xFF9CA3AF),
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.2,
                                  fontSize: 13.sp,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: _selectHostVoice,
                                child: Text(
                                  "VIEW ALL VOICES",
                                  style: TextStyle(
                                    color: const Color(0xFF8B5CF6).withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          CustomVoiceCard(
                            voiceName: selectedHostVoice?.name ?? "No Host Selected",
                            voiceType: 'Host • AI Personality',
                            imagePath: selectedHostVoice?.image ?? "assets/images/myimg.jpg",
                            isSelected: selectedHostVoice != null,
                            onTap: _selectHostVoice,
                            accentColor: const Color(0xFF3B82F6),
                          ),
                          CustomVoiceCard(
                            voiceName: selectedGuestVoice?.name ?? "No Guest Selected",
                            voiceType: 'Guest • AI Personality',
                            imagePath: selectedGuestVoice?.image ?? "assets/images/myimg.jpg",
                            isSelected: selectedGuestVoice != null,
                            onTap: _selectGuestVoice,
                            accentColor: const Color(0xFF8B5CF6),
                          ),
                          SizedBox(height: 32.h),
                          GestureDetector(
                            onTapDown: (_) => _btnController.forward(),
                            onTapUp: (_) => _btnController.reverse(),
                            onTapCancel: () => _btnController.reverse(),
                            onTap: () async {
                              if (selectedHostVoice == null || selectedGuestVoice == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please select both Host and Guest voices")),
                                );
                                return;
                              }
                              AppRoutes.push(
                                context,
                                AiGeneratingLoading(
                                  script: widget.script,
                                  hostVoiceId: selectedHostVoice!.voiceId,
                                  guestVoiceId: selectedGuestVoice!.voiceId,
                                ),
                              );
                            },
                            child: ScaleTransition(
                              scale: _btnScale,
                              child: Container(
                                width: double.infinity,
                                height: 58.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3B82F6),
                                      Color(0xFF8B5CF6),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF8B5CF6).withOpacity(0.35),
                                      blurRadius: 24,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 20.w,
                                      top: 0,
                                      bottom: 0,
                                      child: Icon(
                                        Icons.mic,
                                        color: Colors.white,
                                        size: 22.sp,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Generate Audio",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.5,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Center(
                            child: Text(
                              "Estimated length: 2:45 • 420 words",
                              style: TextStyle(
                                color: const Color(0xFF9CA3AF),
                                fontSize: 12.sp,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Text(
                            "Script Management",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 20.h),
                          ManagementTile(
                            leftIcon: Icons.article_outlined,
                            title: "AI Tone & Style",
                            subtitle: "Adjust writing persona and complexity",
                            rightIcon: Icons.tune,
                            onTap: () {},
                          ),
                          SizedBox(height: 16.h),
                          ManagementTile(
                            leftIcon: Icons.record_voice_over_outlined,
                            title: "Voice Settings",
                            subtitle: selectedHostVoice == null 
                                ? "Choose AI voices and speech style"
                                : "Selected: ${selectedHostVoice!.name}",
                            rightIcon: Icons.graphic_eq,
                            onTap: _selectHostVoice,
                          ),
                          SizedBox(height: 16.h),
                          ManagementTile(
                            leftIcon: Icons.settings_outlined,
                            title: "Output Settings",
                            subtitle: "Configure export formats and cloud sync",
                            rightIcon: Icons.description_outlined,
                            onTap: () {},
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
