import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:podcast_ai_app/core/model/voice_model.dart';
import 'package:podcast_ai_app/core/services/eleven_services.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';
import 'dart:ui';

import '../../../core/services/navigator/navigator.dart';
import '../../profile/widgets/profile_header.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/voice_card.dart';
import '../widgets/voice_chip.dart';

class VoiceSelectionScreen extends StatefulWidget {
  final List<String> selectedVoices;
  const VoiceSelectionScreen({required this.selectedVoices, super.key});
  @override
  State<VoiceSelectionScreen> createState() => _VoiceSelectionScreenState();
}

class _VoiceSelectionScreenState extends State<VoiceSelectionScreen> {
  bool isLoading = true;
  List<VoiceModel> elevens = [];
  List<VoiceModel> filteredVoices = [];
  int selectedChip = 0;
  final TextEditingController _searchController = TextEditingController();

  Future<void> loadVoices() async {
    setState(() {
      isLoading = true;
      filteredVoices = [];
    });
    elevens = await ElevenServices.getVoices();
    setState(() {
      filteredVoices = elevens;
      isLoading = false;
    });
  }

  Future<void> _pickAndAddVoice() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);
      if (result == null || result.files.single.path == null) return;

      String filePath = result.files.single.path!;
      final TextEditingController nameController = TextEditingController();

      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xff111827),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
          title: const Text("Name your Voice", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          content: TextField(
            controller: nameController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "e.g. My Custom Voice",
              hintStyle: TextStyle(color: Colors.white38),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff8B5CF6))),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel", style: TextStyle(color: Colors.white54)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8B5CF6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
              ),
              onPressed: () async {
                String name = nameController.text.trim();
                if (name.isNotEmpty) {
                  Navigator.pop(context);
                  setState(() => isLoading = true);
                  bool success = await ElevenServices.addVoices(name, filePath);
                  if (success) {
                    await Future.delayed(const Duration(seconds: 2));
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Voice Added Successfully!")));
                    await loadVoices();
                  } else {
                    setState(() => isLoading = false);
                  }
                }
              },
              child: const Text("Add Voice", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
  }

  void _filterVoices(String query) {
    setState(() {
      filteredVoices = elevens.where((v) => v.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadVoices();
  }

  @override
  void dispose() {
    _searchController.dispose();
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Row(
                    children: [
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white12),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/myimg.jpg"),
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
                          fontSize: 20.sp,
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
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        Text(
                          "Select your Voice",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 34.sp,
                            letterSpacing: -0.4,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Find the perfect AI personality for your podcast.",
                          style: TextStyle(
                            color: const Color(0xff9CA3AF),
                            fontSize: 14.sp,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Search Bar
                        Container(
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: const Color(0xff111827),
                            border: Border.all(color: Colors.white.withOpacity(.05)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.15),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: _searchController,
                            onChanged: _filterVoices,
                            style: const TextStyle(color: Colors.white),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: "Search AI Voices",
                              hintStyle: TextStyle(color: const Color(0xff6B7280), fontSize: 14.sp),
                              prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(0.7), size: 22.sp),
                              suffixIcon: Icon(Icons.tune_outlined, color: Colors.white.withOpacity(0.6), size: 20.sp),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Filter Chips
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              VoiceChip(
                                title: 'ALL VOICES',
                                isSelected: selectedChip == 0,
                                onTap: () => setState(() => selectedChip = 0),
                              ),
                              VoiceChip(
                                title: 'NARRATOR',
                                isSelected: selectedChip == 1,
                                onTap: () => setState(() => selectedChip = 1),
                              ),
                              VoiceChip(
                                title: 'STORY',
                                isSelected: selectedChip == 2,
                                onTap: () => setState(() => selectedChip = 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        // Voice Cloning Action Card
                        _buildVoiceCloningCard(),
                        SizedBox(height: 24.h),
                        isLoading
                            ? const Center(child: CircularProgressIndicator(color: Color(0xff8B5CF6)))
                            : filteredVoices.isEmpty
                                ? const Center(child: Text("No voices found", style: TextStyle(color: Colors.white70)))
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: filteredVoices.length,
                                    itemBuilder: (context, index) {
                                      final voice = filteredVoices[index];
                                      bool isSelected = widget.selectedVoices.contains(voice.voiceId);
                                      return VoiceCard(
                                        imagePath: voice.image,
                                        name: voice.name,
                                        category: 'AI Voice',
                                        description: 'Voice ID: ${voice.voiceId}',
                                        isSelected: isSelected,
                                        onTap: () => Navigator.pop(context, voice),
                                      );
                                    },
                                  ),
                        SizedBox(height: 120.h),
                      ],
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

  Widget _buildVoiceCloningCard() {
    return GestureDetector(
      onTap: _pickAndAddVoice,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: Colors.white.withOpacity(.05)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff8B5CF6).withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xff8B5CF6).withOpacity(0.12),
              ),
              child: Icon(Icons.mic_rounded, color: const Color(0xff8B5CF6), size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Voice Cloning",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Clone your own voice using ElevenLabs AI",
                    style: TextStyle(color: const Color(0xff9CA3AF), fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: Colors.white.withOpacity(0.4), size: 24.sp),
          ],
        ),
      ),
    );
  }
}
