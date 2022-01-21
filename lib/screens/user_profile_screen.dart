import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileScareen extends StatefulWidget {

  final String userName;
  final String userImage;

  const UserProfileScareen({ Key? key, required this.userName, required this.userImage}) : super(key: key);

  @override
  _UserProfileScareenState createState() => _UserProfileScareenState();
}

class _UserProfileScareenState extends State<UserProfileScareen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        body: SafeArea(

          child: SingleChildScrollView(

            child: Center(

              child: Column(),
            ),
          ),
        )
      ),
    );
  }
}