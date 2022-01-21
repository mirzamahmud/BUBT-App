import 'package:bubt_app/widgets/image_upload_section.dart';
import 'package:bubt_app/widgets/image_upload_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

                  SizedBox(height: 50.h),

                  const ImageUploadScetion(),

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