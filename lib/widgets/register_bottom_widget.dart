import 'package:bubt_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterBottomWidget extends StatelessWidget {

  const RegisterBottomWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(

          "Already have account?",
          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        TextButton(

          onPressed: (){

            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          child: Text(

            "Login",
            textAlign: TextAlign.left,
            style: GoogleFonts.nunito(color: Colors.blue[400], fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}