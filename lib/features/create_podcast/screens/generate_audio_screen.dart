import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/ai_generating_loading.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/voice_selection_screen.dart';
import '../../../core/services/navigator/navigator.dart';
import '../../../core/widgets/bottom_nav_bar.dart';
import '../../profile/widgets/profile_header.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/coustom_voice_card.dart';
import '../widgets/management_tile.dart';
import '../widgets/script_box.dart';
import '../widgets/top_icon.dart';
class ScriptGeneratorScreen extends StatefulWidget {
  final String script;
  const ScriptGeneratorScreen({super.key, required this.script});
  @override
  State createState() => _ScriptGeneratorScreenState();
}
class _ScriptGeneratorScreenState extends State<ScriptGeneratorScreen>{
  String selectedHostVoice = "";
  String selectedGuestVoice = "";
  String result="";
  bool isLoading=true;

  Future<void> _selectHostVoice() async {
    final selectedResult = await AppRoutes.push(
      context,
      VoiceSelectionScreen(selectedVoices: [selectedHostVoice, selectedGuestVoice]),//iska mtlb ju voice alredy scltd ha wu show krta
    );
    if (selectedResult != null) {
      setState(() {
        selectedHostVoice = selectedResult;
      });
    }
  }

  Future<void> _selectGuestVoice() async {
    final selectedResult = await AppRoutes.push(
      context,
      VoiceSelectionScreen(selectedVoices: [selectedHostVoice, selectedGuestVoice]), //Iska faida ye hota hai ke jab selection screen khulti hai, toh wo is list ko check karti hai. Agar wahan kisi voice ka naam is list se match kar jata hai, toh wo us card ko Highlighted (Selected) dikhati hai
    );
    if (selectedResult != null) {
      setState(() {
        selectedGuestVoice = selectedResult;
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
          child: const BottomNavbar(selectedIndex: 2,),
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h,),
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
                        ), SizedBox(width: 8.w,),
                        Text(
                          "VOX AI",
                          style: TextStyle(
                            color: const Color(0xff4F7CFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp.clamp(16.0, 24.0),

                          ),
                        ),
                        const Spacer(),
                        ProfileHeader(icon: Icons.notifications_none, onTap: () {  },),
                        SizedBox(width: 8.w,),
                        ProfileHeader(icon: Icons.settings_outlined, onTap: () {
                          AppRoutes.push(context, const AppSettingScreen());
                        },),
                        SizedBox(width: 8.w,),

                      ],
                    ),
                  ), Divider(color: Colors.white10, height: 1.h,),
                  Expanded(
                      child: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(13.w), child:
                      Column(
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
                            SizedBox(height: 20.h,),
                            ScriptBox(script: widget.script),
                            SizedBox(height: 30.h,),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Column(
                                children: [
                                  Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 8.w,
                                          ), child:Text(
                                            "SELECT AI VOICES",
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.sp.clamp(14.0, 20.0),)
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
                                            ))
                                      ]),
                                  const SizedBox(height: 10),
                                  CustomVoiceCard(
                                    voiceName: selectedHostVoice.isEmpty ? "No Host Selected" : selectedHostVoice,
                                    voiceType: 'Host • AI Personality',
                                    imagePath: "assets/images/onboard1.png",
                                    isSelected: selectedHostVoice.isNotEmpty,
                                    onTap: _selectHostVoice,
                                    selectedVoice: selectedHostVoice,
                                  ),
                                  const SizedBox(height: 5),
                                  CustomVoiceCard(
                                    voiceName: selectedGuestVoice.isEmpty ? "No Guest Selected" : selectedGuestVoice,
                                    voiceType: 'Guest • AI Personality',
                                    imagePath: "assets/images/onboard1.png",
                                    isSelected: selectedGuestVoice.isNotEmpty,
                                    onTap: _selectGuestVoice,
                                    selectedVoice: selectedGuestVoice,
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(35.r),
                                splashColor: Colors.white24,
                                highlightColor: Colors.white10,
                                onTap: () async {
                                  if (selectedHostVoice.isEmpty || selectedGuestVoice.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("Please select both Host and Guest voices")),
                                    );
                                    return;
                                  }
                                  AppRoutes.push(context, const AiGeneratingLoading());
                                  await Future.delayed(
                                    const Duration(
                                      milliseconds: 180,
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
                                        color: Colors.blue.withOpacity(0.25),
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
                                      SizedBox(width: 10.w,),
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
                            SizedBox(height: 12.h,),
                            Center(
                              child: Text(
                                "Estimated length: 2:45 • 420 words",
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12.sp.clamp(10.0, 14.0),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h,),
                            Text(
                              "Script Management",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp.clamp(20.0, 30.0),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            ManagementTile(
                              leftIcon: Icons.article_outlined,
                              title: "AI Tone & Style",
                              subtitle: "Adjust writing persona and complexity",
                              rightIcon: Icons.tune,
                              onTap: () {},
                            ),
                            SizedBox(height: 15.h,),
                            ManagementTile(
                              leftIcon: Icons.record_voice_over_outlined,
                              title: "Voice Settings",
                              subtitle: //selectedHostVoice.isEmpty && selectedGuestVoice.isEmpty
                                 // ?
                                "Choose AI voices and speech style"
                                  //: "Host: $selectedHostVoice • Guest: $selectedGuestVoice",
                              ,rightIcon: Icons.graphic_eq,
                              onTap:(){} //_selectHostVoice,
                            ),
                            SizedBox(height: 15.h,),
                            ManagementTile(
                              leftIcon: Icons.settings_outlined,
                              title: "Output Settings",
                              subtitle: "Configure export formats and cloud sync",
                              rightIcon: Icons.description_outlined,
                              onTap: () {},
                            ),
                            SizedBox(height: 60.h,),
                          ]
                      )
                      )))])));
  }
}
