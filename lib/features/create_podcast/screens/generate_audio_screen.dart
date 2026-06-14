import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/model/voice_model.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/ai_generating_loading.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/voice_selection_screen.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../profile/widgets/profile_header.dart';
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

class _ScriptGeneratorScreenState extends State<ScriptGeneratorScreen> {
  VoiceModel? selectedHostVoice;
  VoiceModel? selectedGuestVoice;

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
                  ProfileHeader(icon: Icons.notifications_none, onTap: () {}),
                  SizedBox(width: 8.w),
                  ProfileHeader(
                    icon: Icons.settings_outlined,
                    onTap: () {
                      AppRoutes.push(context, const AppSettingScreen());
                    },
                  ),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
            Divider(color: Colors.white10, height: 1.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(13.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Script Generator",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.sp.clamp(24.0, 36.0),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      ScriptBox(script: widget.script),
                      SizedBox(height: 30.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(
                                    "SELECT AI VOICES",
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp.clamp(14.0, 20.0),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: _selectHostVoice,
                                  child: Text(
                                    "VIEW ALL VOICES",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.sp.clamp(10.0, 14.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            CustomVoiceCard(
                              voiceName: selectedHostVoice?.name ?? "No Host Selected",
                              voiceType: 'Host • AI Personality',
                              imagePath: "assets/images/onboarding1.png",
                              isSelected: selectedHostVoice != null,
                              onTap: _selectHostVoice,
                              selectedVoice: selectedHostVoice?.name ?? "",
                            ),
                            const SizedBox(height: 8),
                            CustomVoiceCard(
                              voiceName: selectedGuestVoice?.name ?? "No Guest Selected",
                              voiceType: 'Guest • AI Personality',
                              imagePath: "assets/images/onboarding2.png",
                              isSelected: selectedGuestVoice != null,
                              onTap: _selectGuestVoice,
                              selectedVoice: selectedGuestVoice?.name ?? "",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(35.r),
                          splashColor: Colors.white24,
                          highlightColor: Colors.white10,
                          onTap: () async {
                            if (selectedHostVoice == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please select at least a Host voice")),
                              );
                              return;
                            }
                            AppRoutes.push(
                              context,
                              AiGeneratingLoading(
                                script: widget.script,
                                voiceId: selectedHostVoice!.voiceId,
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 55.h.clamp(45.0, 65.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffC084FC),
                                  Color(0xff2563EB),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withValues(alpha: 0.25),
                                  blurRadius: 10.w,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mic_none,
                                  color: Colors.white,
                                  size: 20.sp.clamp(16.0, 24.0),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Generate Audio",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.sp.clamp(14.0, 18.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Center(
                        child: Text(
                          "Estimated length: 2:45 • 420 words",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12.sp.clamp(10.0, 14.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        "Script Management",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp.clamp(20.0, 30.0),
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
                      SizedBox(height: 15.h),
                      ManagementTile(
                        leftIcon: Icons.record_voice_over_outlined,
                        title: "Voice Settings",
                        subtitle: selectedHostVoice == null 
                            ? "Choose AI voices and speech style"
                            : "Selected: ${selectedHostVoice!.name}",
                        rightIcon: Icons.graphic_eq,
                        onTap: _selectHostVoice,
                      ),
                      SizedBox(height: 15.h),
                      ManagementTile(
                        leftIcon: Icons.settings_outlined,
                        title: "Output Settings",
                        subtitle: "Configure export formats and cloud sync",
                        rightIcon: Icons.description_outlined,
                        onTap: () {},
                      ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
