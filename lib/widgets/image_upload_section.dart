import 'dart:io';

import 'package:bubt_app/screens/home_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScetion extends StatefulWidget {

  const ImageUploadScetion({ Key? key }) : super(key: key);

  @override
  _ImageUploadScetionState createState() => _ImageUploadScetionState();
}

class _ImageUploadScetionState extends State<ImageUploadScetion> {

  final userImage = "assets/icons/user-profile.png";
  
  File? imageFile;
  final imagePicker = ImagePicker();
  String? downloadUrl;

  // pick up image
  void _openGallery(BuildContext context) async{

    final pickedFile = await ImagePicker().pickImage(

      source: ImageSource.gallery,
      maxHeight: 120.h,
      maxWidth: 120.w
    );
    
    setState(() {

        if(pickedFile != null)
        {
          imageFile = File(pickedFile.path);
        }
    });
    Navigator.pop(context);
  }

  void _openCamera(BuildContext context)  async{

    final pickedFile = await ImagePicker().pickImage(

      source: ImageSource.camera,
      maxHeight: 120.h,
      maxWidth: 120.w
    );
    setState(() {

        if(pickedFile != null)
        {
          imageFile = File(pickedFile.path);
        }
    });
    Navigator.pop(context);
  }

  // upload image to firbase storage
  Future uploadImage() async{

    Reference ref = FirebaseStorage.instance.ref().child("images");
    await ref.putFile(imageFile!);

    downloadUrl = await ref.getDownloadURL();
  }

  // alert dialog
  Future<void>_showChoiceDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (BuildContext context){

      return AlertDialog(

        title: Text("Choose option", style: GoogleFonts.nunito(color: Colors.blue, fontWeight: FontWeight.w800)),
        content: SingleChildScrollView(
        child: ListBody(
          children: [

            const Divider(height: 1, color: Colors.blue),
            
            ListTile(

              onTap: (){
                _openGallery(context);
              },
              title: Text("Gallery", style: GoogleFonts.nunito(color: Colors.black)),
              leading: const Icon(Icons.account_box,color: Colors.black),
            ),

            const Divider(height: 1,color: Colors.blue,),

            ListTile(

              onTap: (){

                _openCamera(context);
              },
              title: Text("Camera", style: GoogleFonts.nunito(color: Colors.black)),
              leading: const Icon(Icons.camera,color: Colors.black),
            ),
          ],
        ),
      ),);
    });
  }
  

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

                radius: 100.0,
                backgroundColor: Colors.green[400],
                child: CircleAvatar(

                  radius: 90.0,
                  backgroundImage: imageFile == null ? AssetImage(userImage) : FileImage(imageFile!) as ImageProvider
                ),
              ),

              IconButton(

                onPressed: (){

                  _showChoiceDialog(context);
                },
                iconSize: 25.0,
                icon: Icon(Icons.add_a_photo_rounded, color: Colors.redAccent[700]),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          SizedBox(

            height: 40.h, width: 200.w,
            child: MaterialButton(

              onPressed: (){

                uploadImage();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));  
              },
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