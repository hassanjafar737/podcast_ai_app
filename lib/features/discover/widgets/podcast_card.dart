import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastCard extends StatelessWidget{
  final String image;
  final String title;
  final String subtitle;
  final bool playButton;
  const PodcastCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.playButton,
  });
  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Stack(
          alignment:Alignment.center,
          children:[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child:Image.asset(
                image,
                width:double.infinity,
                height: 140.h.clamp(140.0, 220.0),
                fit:BoxFit.cover,
              ),

            ),
            if(playButton)
              Container(
                width: 40.w.clamp(35.0, 50.0),
                height: 40.w.clamp(35.0, 50.0),
                decoration:const BoxDecoration(
                  shape:BoxShape.circle,
                  color:Colors.white,
                ),
                child: Icon(Icons.play_arrow,
                  color:Colors.black,
                  size: 24.sp.clamp(20.0, 30.0),
                ),
              ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:TextStyle(
            color:Colors.white,
            fontWeight:FontWeight.bold,
            fontSize: 14.sp.clamp(12.0, 16.0),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:TextStyle(
            color:Colors.white54,
            fontSize: 11.sp.clamp(9.0, 13.0),
          ),
        ),
      ],
    );
  }
}