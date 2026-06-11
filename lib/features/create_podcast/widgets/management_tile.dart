import 'package:flutter/material.dart';

class ManagementTile extends StatelessWidget{

  final IconData leftIcon;
  final String title;
  final String subtitle;
  final IconData rightIcon;
  final VoidCallback onTap;

  const ManagementTile({
    super.key,
    required this.leftIcon,
    required this.title,
    required this.subtitle,
    required this.rightIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context){
    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(screenWidth*0.06,),
        splashColor: Colors.white24,
        highlightColor: Colors.white10,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth*0.045,
            vertical: screenHeight*0.022,
          ),
          decoration: BoxDecoration(
            color: const Color(0xff0B0F1A),
            borderRadius: BorderRadius.circular(screenWidth*0.06,),
            border: Border.all(
              color: Colors.white10,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withOpacity(0.05),
                blurRadius: screenWidth*0.05,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: screenWidth*0.11,
                height: screenWidth*0.11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Icon(
                  leftIcon,
                  color: const Color(0xffC084FC),
                  size: screenWidth*0.055,

                ),

              ),
              SizedBox(width: screenWidth*0.04,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth*0.04,
                      ),
                    ),
                    SizedBox(height: screenHeight*0.004,),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white54,
                        height: 1.5,
                        fontSize: screenWidth*0.03,

                      ),

                    )
                  ],
                ),
              ),
              SizedBox(width: screenWidth*0.02,),
              Icon(
                rightIcon,
                color: Colors.white54,
                size: screenWidth*0.05,

              ),

            ],

          ),

        ),

      ),

    );
  }
}