import 'package:bubt_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenTopWidget extends StatefulWidget {

  const HomeScreenTopWidget({ Key? key }) : super(key: key);

  @override
  _HomeScreenTopWidgetState createState() => _HomeScreenTopWidgetState();
}

class _HomeScreenTopWidgetState extends State<HomeScreenTopWidget> {

  User? user = FirebaseAuth.instance.currentUser;
  
  UserModel loggedInUser = UserModel();

  @override
  void initState()
  {
    super.initState();

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get()
      .then((value) => {

        loggedInUser = UserModel.fromMap(value.data()),

        setState(() {})
      });
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Image.asset("assets/images/bubt-logo.png", height: 100.0.h, width: 100.0.w),
        SizedBox(height: 10.h),

        Text(
        
          "Welcome, ${loggedInUser.name}",
          style: GoogleFonts.amita(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w800),
        ),

        Text(

          "Enjoy your new experience",
          style: GoogleFonts.amita(color: Colors.grey[700], fontSize: 14.sp, fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}