import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VoiceCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String category;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  const VoiceCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.category,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(28.r),
            splashColor:Colors.white10,
        highlightColor: Colors.white10,
          onTap: onTap,
          child:  Container(
            margin: EdgeInsets.only(bottom: 15.h),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: const Color(0xff0B0F1A),
              borderRadius: BorderRadius.circular(28.r),
            border: Border.all(color:isSelected? const Color(0xff8B5CF6): Colors.white10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   ClipRRect(
                     borderRadius: BorderRadius.circular(20.r),
                     child: Image.asset(
                       imagePath,
                       width: 55.w.clamp(45.0, 75.0),
                       height: 55.w.clamp(45.0, 75.0),
                       fit: BoxFit.cover,
                     ),
                   ),
                   SizedBox(width: 12.w,),
                   Expanded(child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         name, style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 18.sp.clamp(16.0, 22.0),
                       ),),
                       SizedBox(height: 4.h,),
                       Text(
                           category,
                           style: TextStyle(
                             color: const Color(0xffC084FC),
                             fontWeight: FontWeight.w600,
                             fontSize: 12.sp.clamp(10.0, 14.0),
                           ))
                     ],
                   )),
                   Container(
                     width: 40.w.clamp(35.0, 50.0),
                     height: 40.w.clamp(35.0, 50.0),
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white10
                     ),
                     child: Icon(Icons.play_arrow,color: Colors.white,size: 20.sp.clamp(18.0, 24.0)),
                   )
                 ],
               ),
                SizedBox(height: 10.h,),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12.sp.clamp(10.0, 14.0),
                height: 1.5,
              )),
            SizedBox(height: 15.h,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(isSelected?"Selected ":"Select Voice",style: TextStyle(
                color: const Color(0xffC084FC),
                fontWeight: FontWeight.bold,
                fontSize: 12.sp.clamp(10.0, 14.0),
              ),))
              ],
            ),
          ),
        ));
  }}