import 'package:bubt_app/screens/login_screen.dart';
import 'package:bubt_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreenButtons extends StatelessWidget {

  const StartScreenButtons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        MaterialButton(
              
          height: 50, minWidth: MediaQuery.of(context).size.width.w,
          elevation: 0,
          onPressed: (){

            //Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
          },
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(

            "Login",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),

        const SizedBox(height: 10),

        MaterialButton(
              
          height: 50, minWidth: MediaQuery.of(context).size.width.w,
          elevation: 0,
          onPressed: (){

            //Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
          },
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(

            "Register",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(color: Theme.of(context).primaryColor, fontSize: 18.sp, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}