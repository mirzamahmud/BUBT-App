import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageUploadScetion extends StatefulWidget {

  const ImageUploadScetion({ Key? key }) : super(key: key);

  @override
  _ImageUploadScetionState createState() => _ImageUploadScetionState();
}

class _ImageUploadScetionState extends State<ImageUploadScetion> {

  @override
  Widget build(BuildContext context) {

    return Center(
      
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Row(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(

                radius: 70.0,
                backgroundColor: Colors.green[300],
                child: CircleAvatar(
              
                  radius: 65.0,
                  child: Image.asset("assets/icons/user-profile.png", height: 150.h, width: 150.w),
                ),
              ),

              IconButton(

                onPressed: (){},
                iconSize: 25.0,
                icon: Icon(Icons.add_a_photo_rounded, color: Colors.green[400]),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          SizedBox(

            height: 40.h, width: 200.w,
            child: MaterialButton(

              onPressed: (){},
              elevation: 0,
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Text(

                "Upload Image",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}