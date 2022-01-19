import 'package:bubt_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async
{

  SystemChrome.setSystemUIOverlayStyle(

    SystemUiOverlayStyle(

      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.grey[300],
      systemNavigationBarIconBrightness: Brightness.dark,
    )
  );

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const BUBT());
}

class BUBT extends StatelessWidget {

  const BUBT({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 690),
      builder: () => MaterialApp(

        debugShowCheckedModeBanner: false,
        title: "BUBT App",
        theme: ThemeData(

          primaryColor: Colors.blue[700],
          scaffoldBackgroundColor: Colors.grey[300]
        ),

        home: const SplashScreen(),
      ),
    );
  }
}