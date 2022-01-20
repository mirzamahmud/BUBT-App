import 'package:bubt_app/widgets/register_bottom_widget.dart';
import 'package:bubt_app/widgets/register_form_widget.dart';
import 'package:bubt_app/widgets/register_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(

          child: SafeArea(

            child: Padding(
              
              padding: const EdgeInsets.all(20.0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const RegisterTopWidget(),
                  SizedBox(height: 20.h),

                  const RegisterFormWidget(),

                  SizedBox(height: 20.h),

                  const RegisterBottomWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}