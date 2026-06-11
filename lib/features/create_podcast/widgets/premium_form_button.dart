import 'package:flutter/material.dart';
import 'package:podcast_ai_app/core/services/script_service.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/generate_audio_screen.dart';

import '../../../core/services/navigator/navigator.dart';

class PremiumFormSection extends StatefulWidget {

  final TextEditingController titleController;
  final TextEditingController outlineController;
  const PremiumFormSection({
    super.key,
    required this.titleController, 
    required this.outlineController
  });
  @override
  State<PremiumFormSection> createState() => _PremiumFormSectionState();
}
class _PremiumFormSectionState extends State<PremiumFormSection> {
  // late String script;
  String result="";
  bool isLoading = false;
  Future<void> generate() async {
    String title = widget.titleController.text;
    String outline = widget.outlineController.text;

    if (title.isEmpty && outline.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a title or outline first")),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      // Combine both fields for a better prompt
      String prompt = "";
      if (title.isNotEmpty) prompt += "Podcast Title: $title\n";
      if (outline.isNotEmpty) prompt += "Main Topic/Outline: $outline";

      final script = await GeminiService.generatePodcastScript(prompt);

      setState(() {
        result = script;
      });

      if (mounted) {
        AppRoutes.push(
          context, 
          ScriptGeneratorScreen(script: script,),
        );
      }

    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }

    setState(() {
      isLoading = false;
    });
  }


  String selectedStyle = "Business & Tech";
  double duration = 15;
  bool generateCover = true;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(14),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff0B0F1A),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.white10,
        ),
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
              fontSize: screenWidth * 0.032,
            ),
          ),
          SizedBox(height: screenHeight * 0.02,),
          Container(
            height: screenHeight * 0.075,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white10,
              ),

            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: const Color(0xff111827),
                value: selectedStyle,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white70,
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
                isExpanded: true,
                items: [
                  "Business & Tech",
                  "Storytelling",
                  "Educational",
                  "News",
                ].map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedStyle = value!;
                  });
                },
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.04,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TARGET DURATION",
                style: TextStyle(
                  color: const Color(0xffC084FC),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.032,
                ),
              ),
              Text(
                "~${duration.toInt()} min",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xff2563EB),
              inactiveTrackColor: Colors.white12,
              thumbColor: Colors.white,
              overlayColor: Colors.purple.withOpacity(0.2),
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 8,
              ),
              trackHeight: 4,
            ),
            child: Slider(
              value: duration,
              min: 5,
              max: 60,
              onChanged: (value) {
                setState(() {
                  duration = value;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "5m",
                style: TextStyle(
                  color: Colors.white38,
                ),
              ),
              Text(
                "30m",
                style: TextStyle(
                  color: Colors.white38,
                ),
              ),
              Text(
                "60m",
                style: TextStyle(
                  color: Colors.white38,
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight * 0.04,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GENERATE COVER ART",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:screenWidth * 0.035,
                ),
              ),
              Switch(
                value: generateCover,
                activeColor: const Color(0xffC084FC),
                activeTrackColor: Colors.purple.withOpacity(0.5),
                inactiveThumbColor: Colors.white54,
                inactiveTrackColor: Colors.white12,
                onChanged: (value) {
                  setState(() {
                    generateCover = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.04,),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(40),
              splashColor: Colors.white10,
              highlightColor: Colors.white10,
              onTap: isLoading ? null : generate,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
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
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: isLoading 
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.auto_awesome,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "GENERATE SCRIPT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.038,
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
