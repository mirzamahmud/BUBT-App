import 'package:bubt_app/models/user_model.dart';
import 'package:bubt_app/widgets/image_upload_section.dart';
import 'package:bubt_app/widgets/image_upload_top_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageUploadScreen extends StatefulWidget {

  const ImageUploadScreen({ Key? key }) : super(key: key);

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {

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

                  SizedBox(height: 50.h),

                  ImageUploadScetion(userId: loggedInUser.uid),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}