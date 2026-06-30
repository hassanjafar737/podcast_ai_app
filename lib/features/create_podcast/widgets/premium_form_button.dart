import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/services/script_service.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/generate_audio_screen.dart';

import '../../../core/services/navigator/navigator.dart';

class PremiumFormSection extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController outlineController;

  const PremiumFormSection({
    super.key,
    required this.titleController,
    required this.outlineController,
  });

  @override
  State<PremiumFormSection> createState() => _PremiumFormSectionState();
}

class _PremiumFormSectionState extends State<PremiumFormSection> with SingleTickerProviderStateMixin {
  String selectedStyle = "Business & Tech";
  double duration = 15;
  bool generateCover = true;
  bool isLoading = false;

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

  Future<void> generate() async {
    String title = widget.titleController.text;
    String outline = widget.outlineController.text;

    if (title.isEmpty && outline.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a title or outline first")),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      String prompt = "";
      if (title.isNotEmpty) prompt += "Podcast Title: $title\n";
      if (outline.isNotEmpty) prompt += "Main Topic/Outline: $outline";

      final script = await GeminiService.generatePodcastScript(prompt);

      if (mounted) {
        AppRoutes.push(context, ScriptGeneratorScreen(script: script));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: Colors.white.withOpacity(.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CONTENT STYLE",
            style: TextStyle(
              color: const Color(0xffC084FC),
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 56.h,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(18.r),
              border: Border.all(color: Colors.white.withOpacity(.05)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: const Color(0xff111827),
                value: selectedStyle,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70),
                style: const TextStyle(color: Colors.white),
                isExpanded: true,
                items: ["Business & Tech", "Storytelling", "Educational", "News"].map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (value) => setState(() => selectedStyle = value!),
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TARGET DURATION",
                style: TextStyle(
                  color: const Color(0xffC084FC),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.white.withOpacity(.05)),
                ),
                child: Text(
                  "~${duration.toInt()} min",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xFF3B82F6),
              inactiveTrackColor: Colors.white12,
              thumbColor: Colors.white,
              overlayColor: const Color(0xFF8B5CF6).withOpacity(0.2),
              trackHeight: 4,
            ),
            child: Slider(
              value: duration,
              min: 5,
              max: 60,
              onChanged: (value) => setState(() => duration = value),
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTapDown: (_) => _btnController.forward(),
            onTapUp: (_) => _btnController.reverse(),
            onTapCancel: () => _btnController.reverse(),
            onTap: isLoading ? null : generate,
            child: ScaleTransition(
              scale: _btnScale,
              child: Container(
                width: double.infinity,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.r),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withOpacity(0.35),
                      blurRadius: 18,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
                            SizedBox(width: 12.w),
                            Text(
                              "GENERATE SCRIPT",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: .5,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
