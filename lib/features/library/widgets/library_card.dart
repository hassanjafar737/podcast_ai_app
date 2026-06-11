import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryCard extends StatelessWidget{
  final String image;
  final String status;
  final String date;
  final String title;
  final String duration;
  final String voice;
  final bool favorite;
  const LibraryCard({
    super.key,
    required this.image,
    required this.status,
    required this.date,
    required this.title,
    required this.duration,
    required this.voice,
    required this.favorite,
  });

  @override
  Widget build(BuildContext context){
    return Container(
      width:double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration:BoxDecoration(
        color:const Color(0xff0B0F1A),
        borderRadius: BorderRadius.circular(24.r),
        border:Border.all(
          color:Colors.white10,
        ),
      ),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child:Image.asset(
              image,
              width: 55.w.clamp(45.0, 75.0),
              height: 55.w.clamp(45.0, 75.0),
              fit:BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                  children:[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration:BoxDecoration(
                        color: const Color(0xff232323),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child:Text(
                        status,
                        style: TextStyle(
                          color:Colors.white54,
                          fontSize: 9.sp.clamp(8.0, 10.0),
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      date,
                      style:TextStyle(
                        color:Colors.white38,
                        fontSize: 10.sp.clamp(8.0, 12.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  title,
                  maxLines:1,
                  overflow: TextOverflow.ellipsis,
                  style:TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp.clamp(14.0, 18.0),
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children:[
                    Icon(
                      Icons.access_time,
                      color:Colors.white38,
                      size: 14.sp.clamp(12.0, 16.0),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      duration,
                      style:TextStyle(
                        color:Colors.white54,
                        fontSize: 11.sp.clamp(9.0, 13.0),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.graphic_eq,
                      color:Colors.white38,
                      size: 14.sp.clamp(12.0, 16.0),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child:Text(
                        voice,
                        overflow: TextOverflow.ellipsis,
                        style:TextStyle(
                          color:Colors.white54,
                          fontSize: 11.sp.clamp(9.0, 13.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            children:[
              Icon(
                Icons.copy,
                color:Colors.white54,
                size: 18.sp.clamp(16.0, 20.0),
              ),
              SizedBox(height: 14.h),
              Icon(
                favorite
                    ?Icons.favorite_border
                    :Icons.more_vert,
                color:Colors.white54,
                size: 18.sp.clamp(16.0, 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}