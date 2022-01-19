import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTopWidget extends StatelessWidget {

  const RegisterTopWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset("assets/images/bubt-logo.png", height: 120.h, width: 120.w),
        const SizedBox(height: 10),

        Text(

          "Register Here,",
          style: GoogleFonts.amita(color: Colors.black, fontSize: 24.sp, fontWeight: FontWeight.w800),
        ),

        Text(

          "To start your journey",
          style: GoogleFonts.amita(color: Colors.grey[600], fontSize: 14.sp, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}