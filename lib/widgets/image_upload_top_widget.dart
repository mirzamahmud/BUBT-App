import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageUploadTopWidget extends StatelessWidget {

  const ImageUploadTopWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset("assets/images/bubt-logo.png", height: 120.h, width: 120.w),

        SizedBox(height: 10.h),

        Text(

          "Welcome, Bubtians",
          style: GoogleFonts.amita(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w800),
        ),

        Text(

          "Upload your profile image",
          style: GoogleFonts.amita(color: Colors.grey[600], fontSize: 14.sp, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}