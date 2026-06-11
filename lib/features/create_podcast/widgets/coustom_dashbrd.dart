import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CoustomDashbrd extends StatelessWidget{
  const CoustomDashbrd({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.w),child:   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32.w.clamp(28.0, 40.0),
              height: 32.w.clamp(28.0, 40.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/profile.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),SizedBox(width: 8.w,),
            Text(
              "VOX AI",
              style: TextStyle(
                color: Colors.blue.shade900,
                fontSize: 20.sp.clamp(16.0, 24.0),
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: (){},
              child: Icon(Icons.notifications_none,size: 20.sp.clamp(18.0, 24.0),color: Colors.white70,),
            ),
            SizedBox(width: 10.w,),
            InkWell(
              onTap: (){},
              child: Icon(Icons.settings_outlined,size: 20.sp.clamp(18.0, 24.0),color: Colors.white70,),
            )
          ],
        ),
        Divider(color: Colors.white10, height: 20.h),

      ],
    )
    );
  }}