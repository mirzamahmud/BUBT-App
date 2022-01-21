import 'package:bubt_app/widgets/home_screen_grid.dart';
import 'package:bubt_app/widgets/home_screen_top_widget.dart';
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

        body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

            image: DecorationImage(

              image: const AssetImage("assets/images/bubt.png"), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop)
            )
          ),
          child: SingleChildScrollView(

            physics: const BouncingScrollPhysics(),
            child: Padding(
          
              padding: const EdgeInsets.all(20.0),
              child: Column(
          
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  const HomeScreenTopWidget(),
          
                  SizedBox(height: 20.h),
          
                  const HomeScreenGrid()
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}