import 'package:bubt_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BUBT());

  SystemChrome.setSystemUIOverlayStyle(

    SystemUiOverlayStyle(

      statusBarColor: Colors.blue[800],
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
    )
  );
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
          scaffoldBackgroundColor: Colors.grey[300],
          secondaryHeaderColor: Colors.blue[900]
        ),

        home: const SplashScreen(),
      ),
    );
  }
}