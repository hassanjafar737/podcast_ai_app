import 'package:flutter/material.dart';

class TopIcon extends StatelessWidget {

  final IconData icon;
  final VoidCallback onTap;
  const TopIcon({super.key, required this.icon, required this.onTap,});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(screenWidth * 0.05,),
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: screenWidth * 0.10,
          height: screenHeight * 0.05,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.05),
            border: Border.all(color: Colors.white10,),
          ),
          child: Icon(
            icon,
            color: Colors.white70,
            size: screenWidth * 0.05,
          ),
        ),
      )
    );
  }
}