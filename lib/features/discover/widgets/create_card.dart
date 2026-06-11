import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatorCard extends StatelessWidget{
  final String image;
  final String name;
  final String role;
  const CreatorCard({
    super.key,
    required this.image,
    required this.name,
    required this.role,
  });
  @override
  Widget build(BuildContext context){
    return Container(
      width: 80.w.clamp(70.0, 110.0),
      margin: EdgeInsets.only(right: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          Container(
            width: 65.w.clamp(55.0, 85.0),
            height: 65.w.clamp(55.0, 85.0),
            decoration:BoxDecoration(
              shape:BoxShape.circle,
              border:Border.all(
                color:const Color(0xff8B5CF6),
                width: 2.w,
              ),
              image:DecorationImage(
                image:AssetImage(image),
                fit:BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            name,
            textAlign:TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:TextStyle(
              color:Colors.white,
              fontWeight:FontWeight.bold,
              fontSize: 12.sp.clamp(10.0, 14.0),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            role,
            textAlign:TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:TextStyle(
              color:Colors.white38,
              fontSize: 10.sp.clamp(8.0, 12.0),
            ),
          ),
        ],
      ),
    );
  }
}