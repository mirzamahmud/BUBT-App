import 'package:bubt_app/widgets/start_screen_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatefulWidget {

  const StartScreen({ Key? key }) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

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
          child: SafeArea(
    
            child: Padding(
    
              padding: const EdgeInsets.all(20.0),
              child: Column(
    
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  Image.asset("assets/images/bubt-logo.png", height: 120.h, width: 120.w),
                  SizedBox(height: 10.h),

                  Text(

                    "Welcome, Bubtians",
                    style: GoogleFonts.amita(

                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800
                    ),
                  ),

                  Text(

                    "Enjoy your new journey",
                    style: GoogleFonts.amita(

                      color: Colors.grey[600],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800
                    ),
                  ),

                  SizedBox(height: 100.h),

                  const Center(

                    child: StartScreenButtons(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}