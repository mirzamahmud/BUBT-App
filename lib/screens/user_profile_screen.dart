import 'package:bubt_app/widgets/navigation_drawer_widget.dart';
import 'package:bubt_app/widgets/user_profile_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScareen extends StatefulWidget {

  const UserProfileScareen({ Key? key}) : super(key: key);

  @override
  _UserProfileScareenState createState() => _UserProfileScareenState();
}

class _UserProfileScareenState extends State<UserProfileScareen> {

  final userProfileImage = "assets/icons/user-profile.png";

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Colors.blue[800],
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(

          backgroundColor: Colors.blue[800],
          iconTheme: const IconThemeData(color: Colors.white, size: 30.0),
          elevation: 0,
          title: Text("Profile", style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 0.5)),
        ),
        body: SafeArea(

          child: SingleChildScrollView(
        
            child: Center(
        
              child: Padding(
        
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                child: Column(
        
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
        
                    CircleAvatar(
        
                      radius: 80.0,
                      backgroundColor: Colors.amber,
                      child: CircleAvatar(
        
                        radius: 75.0,
                        backgroundImage: AssetImage(userProfileImage),
                      ),
                    ),
        
                    SizedBox(height: 30.0.h),
        
                    const UserProfileFormWidget()
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}