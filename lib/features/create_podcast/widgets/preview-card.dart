// preview_card.dart

import 'package:flutter/material.dart';

class PreviewCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const PreviewCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,

  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius:BorderRadius.circular(30),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            screenWidth * 0.025,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      height: screenHeight * 0.16,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      splashColor: Colors.white24,
                      highlightColor: Colors.white10,
                      onTap: onTap,
                      child: Container(
                        width: screenWidth * 0.16,
                        height: screenWidth * 0.16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xff8B5CF6).withOpacity(0.45),
                          border: Border.all(
                            color: Colors.white24,
                          ),
                        ),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: screenWidth * 0.08,
                        ),

                      ),

                    ),

                  ),

                ],

              ),

              SizedBox(height: screenHeight * 0.02,
              ),
              Text(title,
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                  fontSize: screenWidth * 0.028,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(height: screenHeight * 0.008,),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ],
          ),
        ),

      ),

    );
  }
}