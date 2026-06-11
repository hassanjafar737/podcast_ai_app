import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/features/create_podcast/screens/voice_selection_screen.dart';

import '../../../core/services/navigator/navigator.dart';

class CustomVoiceCard extends StatelessWidget{
  final  String selectedVoice;
  final String voiceName;
  final String voiceType;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;
  const CustomVoiceCard({  required this.voiceName,
    required this.selectedVoice,
  required this.voiceType,
  required this.imagePath,
  required this.isSelected,
  required this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
   return   Material(

       color: Colors.transparent,
       child: InkWell(
           borderRadius: BorderRadius.circular(24.r),
           splashColor: Colors.white10,
           highlightColor: Colors.white10,
               onTap: onTap,
           child: AnimatedContainer(
               duration: const Duration(
                 milliseconds: 250,
               ),
               margin: EdgeInsets.all(8.w),
               padding: EdgeInsets.symmetric(
                 horizontal: 14.w,
                 vertical: 12.h,
               ),
               decoration: BoxDecoration(
                 color: const Color(0xff111111),
                 borderRadius: BorderRadius.circular(24.r),
                 border: Border.all(
                   color: isSelected
                       ? const Color(0xff8B5CF6)
                       : Colors.white10,
                   width: isSelected ? 2 : 1,
                 ),
                 boxShadow:
                 isSelected ? [
                   BoxShadow(
                     color: Colors.purple.withOpacity(0.25),
                     blurRadius: 14.w,
                     spreadRadius: 1,
                   ),
                 ]
                     : [],
       ),
             child: Row(
               children: [
                 CircleAvatar(
                   radius: 24.r.clamp(20.0, 30.0),
                   backgroundColor: Colors.white10,
                   backgroundImage: AssetImage(imagePath.replaceAll('"', '')),
                 ),
                 SizedBox(width: 12.w,),
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisSize: MainAxisSize.min,
                     children: [
                       Text(
                         voiceName,
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 14.sp.clamp(12.0, 18.0),
                         ),
                       ),
                       SizedBox(
                         height: 4.h,
                       ),
                       Text(
                         voiceType,
                         style: TextStyle(
                           color: Colors.white54,
                           fontSize: 12.sp.clamp(10.0, 14.0),
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                 ),
                 AnimatedContainer(
                   duration:
                   const Duration(
                     milliseconds: 250,
                   ),
                   child: Icon(
                     isSelected
                         ? Icons.check_circle
                         : Icons.radio_button_unchecked,
                     color:
                     isSelected
                         ? const Color(0xffC084FC)
                         : Colors.white24,
                     size: 20.sp.clamp(18.0, 24.0),
                   ),),
               ],
             ),

           )));
  }

}