import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:podcast_ai_app/core/model/voice_model.dart';
import 'package:podcast_ai_app/core/services/eleven_services.dart';
import 'package:podcast_ai_app/core/widgets/bottom_nav_bar.dart';

import '../../../core/services/navigator/navigator.dart';
import '../../profile/widgets/profile_header.dart';
import '../../settings/screen/app_setting_screen.dart';
import '../widgets/voice_card.dart';
import '../widgets/voice_chip.dart';

class VoiceSelectionScreen extends StatefulWidget {
  final List<String> selectedVoices;
  const VoiceSelectionScreen({required this.selectedVoices,super.key,});
  @override
  State<VoiceSelectionScreen> createState() => _VoiceSelectionScreenState();
}
class _VoiceSelectionScreenState extends State<VoiceSelectionScreen> {
  bool isLoading = true;
  final ElevenServices elevenServices=ElevenServices();
  List<VoiceModel> elevens=[];
   int selectedChip = 0;
  Future<void>loadVoices()async{
    elevens=await ElevenServices.getVoices();
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState(){
    super.initState();
    loadVoices();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050816),

      body: SafeArea(child: Stack(
        children: [
          Column(
            children: [
      Padding(
      padding: EdgeInsets.symmetric( horizontal: 16.w,
        vertical: 10.h,),
        child: Row(
          children: [
            Container(
              width: 32.w.clamp(28.0, 40.0),
              height: 32.w.clamp(28.0, 40.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white12,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/myimg.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),SizedBox(width: 8.w,),

            Text(
              "VOX AI",
              style: TextStyle(
                color:  const Color(0xff4F7CFF),
                fontWeight: FontWeight.bold,
                fontSize: 20.sp.clamp(16.0, 24.0),

              ),
            ),
            const Spacer(),
            ProfileHeader(icon:  Icons.notifications_none, onTap: () {  },),
            SizedBox(width: 8.w,),
            ProfileHeader(icon: Icons.settings_outlined, onTap: () { AppRoutes.push(context,const AppSettingScreen()); },),
            SizedBox(width: 8.w,),

          ],
        ),
      ),  Divider(color: Colors.white10, height: 1.h,),

          Expanded(child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Select your Voice",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22.sp.clamp(18.0, 28.0)),),
                  SizedBox(height: 4.h,),
                Text("Find the perfect AI personality for your podcast.",style: TextStyle(color: Colors.white54,fontSize: 14.sp.clamp(12.0, 16.0)),),
                  SizedBox(height: 15.h,),
                  Container(
                    height: 50.h.clamp(45.0, 60.0),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color:Colors.white,
                    ),
                    child:TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration:const InputDecoration(
                        hintText:"Search Your Voice",
                        hintStyle:TextStyle(
                          color:Colors.black45,
                        ),
                        prefixIcon:Icon(
                          Icons.search, color:Colors.black54,
                        ),
                        border:InputBorder.none,
                      ),
                    ),
                  ),
          SizedBox(height: 20.h,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                VoiceChip(title: 'ALL VOICES', isSelected:selectedChip==0,  onTap: () { setState(() {
                  selectedChip=0;
                }); },),
                VoiceChip(title: 'NARRATOR', isSelected: selectedChip==1, onTap: () {setState(() {
                  selectedChip=1;
                });  },),
                VoiceChip(title: 'STORY', isSelected: selectedChip==2, onTap: () { setState(() {
                  selectedChip=2;
                }); },),
              ],
            ),
          ),
          SizedBox(height: 30.h,),
         elevens.isEmpty?
         const Center(
           child:
           CircularProgressIndicator(),
         ):
         ListView.builder(
             shrinkWrap: true,
             physics:  const NeverScrollableScrollPhysics(),
             itemCount: elevens.length,
             itemBuilder: (context,index){
           final voice = elevens[index];
           
           // Check if this voice is in our selected list (case-insensitive and trimmed)
           bool isSelected = widget.selectedVoices
               .where((s) => s.trim().isNotEmpty)
               .any((s) => s.trim().toLowerCase() == voice.name.trim().toLowerCase());

           return Padding(padding: EdgeInsets.only(bottom: 10.h),
          child:   VoiceCard(imagePath: 'assets/images/elena1.png', name: voice.name, category: 'AI Voice', description: 'Voice Id :${voice.voiceId}',
              isSelected: isSelected, 
              onTap: () {
                Navigator.pop(context,voice.name); 
              },),);
             }),
          ],)),
          )],),

          Positioned(
              bottom: 20.h,
              right: 20.w,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40.r),
                    splashColor: Colors.white10,
                    highlightColor: Colors.white10,
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff2563EB),
                            Color(0xffC084FC),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.purple.withOpacity(0.3),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),),
                          SizedBox(width: 10.w),
                          Text(
                            "Voice Cloning",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp.clamp(12.0, 16.0),
                            ),
                          ),
                        ],

                      ),

                    ),
                  )))]
      ),

       ),
   bottomNavigationBar: Padding(
     padding: EdgeInsets.only(
       left: 14.w,
       right: 14.w,
       bottom: 30.h,
     ),
     child: const BottomNavbar(selectedIndex: 2,),)

    );
  }}
//https://api.elevenlabs.io/v2/voices
