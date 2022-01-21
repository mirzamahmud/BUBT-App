import 'package:bubt_app/models/user_model.dart';
import 'package:bubt_app/screens/image_upload_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormWidget extends StatefulWidget {

  const RegisterFormWidget({ Key? key }) : super(key: key);

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sidController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;

  // register function
  void registerUser(String email, String password) async
  {
    if(_formKey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(

        email: email, 
        password: password
      ).then((value) => {

        postDetailsToFirestore()

      }).catchError((e){

        Fluttertoast.showToast(

          msg: e!.message,
          backgroundColor: Colors.white24,
          textColor: Colors.black,
          fontSize: 14.sp,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM
        );
      });
    }
  }

  postDetailsToFirestore() async{

    // calling firestore
    //calling user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = _nameController.text.toString();
    userModel.id = _sidController.text.toString();
    userModel.department = _departmentController.text.toString();

    await firebaseFirestore.collection("users")
    .doc(user.uid)
    .set(userModel.toMap());

    Fluttertoast.showToast(

      msg: "Account created successfully",
      backgroundColor: Colors.white24,
      textColor: Colors.black,
      fontSize: 14.sp,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM
    );

    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context) => const ImageUploadScreen()), 
      (route) => false
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(


      children: [

        Form(

          key: _formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              TextFormField(

                controller: _nameController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                decoration: InputDecoration(

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                                  
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  icon: const Icon(Icons.account_circle_rounded, color: Colors.black, size: 25.0),
                  hintText: "Name"
                ),

                validator: (value){

                  if(value!.isEmpty)
                  {
                     return "Please, enter your full-name";
                  }

                  return null;
                },

                onSaved: (value){

                  _nameController.text = value!;
                },
              ),

              SizedBox(height: 10.h),

              TextFormField(

                controller: _sidController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                decoration: InputDecoration(

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                                  
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  icon: const Icon(Icons.perm_contact_calendar_rounded, color: Colors.black, size: 25.0),
                  hintText: "ID"
                ),

                validator: (value){

                  if(value!.isEmpty)
                  {
                     return "Please, enter your student id";
                  }

                  return null;
                },
                onSaved: (value){

                  _sidController.text = value!;
                },
              ),

              SizedBox(height: 10.h),

              TextFormField(

                controller: _departmentController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                decoration: InputDecoration(

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                                  
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  icon: const Icon(Icons.business, color: Colors.black, size: 25.0),
                  hintText: "Department"
                ),

                validator: (value){

                  if(value!.isEmpty)
                  {
                     return "Please, enter your department";
                  }

                  return null;
                },
                onSaved: (value){

                  _departmentController.text = value!;
                },
              ),

              SizedBox(height: 10.h),

              TextFormField(

                controller: _emailController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                decoration: InputDecoration(

                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                                
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black)
                  ),
                  icon: const Icon(Icons.email_rounded, color: Colors.black, size: 25.0),
                  hintText: "Email"
                ),

                validator: (value){

                  if(value!.isEmpty || !value.contains("@") || !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                  {
                    return "Please, enter your valid email";
                  }

                  return null;
                },

                onSaved: (value){

                  _emailController.text = value!;
                },
              ),

              SizedBox(height: 10.h),

              TextFormField(

                controller: _passwordController,
                obscureText: _isObscure,
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                style: GoogleFonts.nunito(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                                
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                            
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.black)
                  ),

                  icon: const Icon(Icons.password_rounded, color: Colors.black, size: 25.0),
                  suffixIcon: IconButton(

                    onPressed: (){

                      setState(() {

                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                    )
                  ),
                  hintText: "Password"
                ),

                validator: (value) {

                  if(value!.isEmpty || value.length < 6)
                  {
                    return "Please, use more than 6 characters long password";
                  }

                  return null;
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),

        MaterialButton(

          height: 50.h, minWidth: MediaQuery.of(context).size.width.w,
          elevation: 0,
          color: Colors.amberAccent[400],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {

            registerUser(_emailController.text.toString(), _passwordController.text.toString());
          },
          child: Text(

            "Register",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}