import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  final   IconData?icon;
  final String text;
  final VoidCallback onPressed;
  const GradientButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8E2DE2),
            Color(0xFF4A00E0),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(screenWidth * 0.9, screenHeight * 0.07),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              text,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Icon(
              icon,
              size: screenHeight * 0.03,
              color: Colors.black,
            ),
          ],
        ),
      ),
    ));
  }
}