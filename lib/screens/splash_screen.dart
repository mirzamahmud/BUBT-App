import 'dart:async';

import 'package:bubt_app/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState()
  {

    Timer(

      const Duration(seconds: 5),()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const StartScreen()));
      }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(

          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width.w,

          decoration: BoxDecoration(

            image: DecorationImage(

              image: const AssetImage("assets/images/bubt.png"), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
            )
          ),
          child: Center(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("assets/images/bubt-logo.png", height: 150.h, width: 150.w),

                SizedBox(height: 20.h),

                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(

                    "Bangladesh University of Business & Technology",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(

                      color: Theme.of(context).primaryColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}