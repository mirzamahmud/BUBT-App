import 'package:bubt_app/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileFormWidget extends StatefulWidget {

  const UserProfileFormWidget({ Key? key }) : super(key: key);

  @override
  _UserProfileFormWidgetState createState() => _UserProfileFormWidgetState();
}

class _UserProfileFormWidgetState extends State<UserProfileFormWidget> {

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

    return Form(
      
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextFormField(

            readOnly: true,
            decoration: InputDecoration(

              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintText: "${loggedInUser.name}",
              hintStyle: GoogleFonts.nunito(color: Colors.white70, fontSize: 16.sp, fontWeight: FontWeight.w700),
              prefixIcon: const Icon(Icons.account_circle_rounded, color: Colors.white)
            ),
          ),

          SizedBox(height: 15.h),

          TextFormField(

            readOnly: true,
            decoration: InputDecoration(

              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintText: "${loggedInUser.id}",
              hintStyle: GoogleFonts.nunito(color: Colors.white70, fontSize: 16.sp, fontWeight: FontWeight.w700),
              prefixIcon: const Icon(Icons.perm_contact_calendar_rounded, color: Colors.white)
            ),
          ),

          SizedBox(height: 15.h),

          TextFormField(

            readOnly: true,
            decoration: InputDecoration(

              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintText: "${loggedInUser.department}",
              hintStyle: GoogleFonts.nunito(color: Colors.white70, fontSize: 16.sp, fontWeight: FontWeight.w700),
              prefixIcon: const Icon(Icons.business_rounded, color: Colors.white)
            ),
          ),

          SizedBox(height: 15.h),

          TextFormField(

            readOnly: true,
            decoration: InputDecoration(

              border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintText: "${loggedInUser.email}",
              hintStyle: GoogleFonts.nunito(color: Colors.white70, fontSize: 16.sp, fontWeight: FontWeight.w700),
              prefixIcon: const Icon(Icons.email_rounded, color: Colors.white)
            ),
          )
        ],
      ),
    );
  }
}