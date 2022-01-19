import 'package:bubt_app/screens/home_screen.dart';
import 'package:bubt_app/widgets/image_upload_section.dart';
import 'package:bubt_app/widgets/image_upload_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageUploadScreen extends StatefulWidget {

  const ImageUploadScreen({ Key? key }) : super(key: key);

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        body: SingleChildScrollView(

          child: SafeArea(

            child: Padding(

              padding: const EdgeInsets.all(20.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const ImageUploadTopWidget(),

                  SizedBox(height: 30.h),

                  const ImageUploadScetion(),

                  SizedBox(height: 50.h),

                  Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(

                        onPressed: (){

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        },
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(

                              "Skip", textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(color: Colors.blueAccent, fontSize: 16.sp),
                            ),

                            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.blueAccent, size: 20.0)
                          ],
                        ),
                      )
                    ],
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