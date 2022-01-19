import 'package:bubt_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        drawer: const NavigationDrawerWidget(),

        appBar: AppBar(

          iconTheme: const IconThemeData(color: Colors.black, size: 30.0),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Home Page", style: GoogleFonts.nunito(color: Colors.black, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}