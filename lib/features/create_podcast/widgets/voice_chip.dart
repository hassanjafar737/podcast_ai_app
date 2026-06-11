import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VoiceChip extends StatelessWidget{
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const VoiceChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(padding: EdgeInsets.only(right: screenWidth*0.03),
    child: Material(
      color:Colors.transparent,
      child:InkWell(
        borderRadius: BorderRadius.circular(30),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
        onTap: (){},
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.09,
              vertical: screenHeight * 0.012,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: isSelected ? const LinearGradient(
                colors: [
                  Color(0xff2563EB),
                  Color(0xffC084FC),
                ],
              ):null,
              color: isSelected?null:const Color(0xff111827),
            border: Border.all(color: Colors.white10)
        ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: screenWidth * 0.028,
            ),
          ),
      ),
    ))
    );
  }
}