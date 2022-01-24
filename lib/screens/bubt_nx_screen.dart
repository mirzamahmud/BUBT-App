import 'dart:io';

import 'package:bubt_app/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BubtNxScreen extends StatefulWidget {

  const BubtNxScreen({ Key? key }) : super(key: key);

  @override
  _BubtNxScreenState createState() => _BubtNxScreenState();
}

class _BubtNxScreenState extends State<BubtNxScreen> {

  @override
  void initState() {
    super.initState();
     // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(

          iconTheme: const IconThemeData(color: Colors.white, size: 30.0),
          backgroundColor: Colors.blue[800],
          elevation: 0,
          title: Text("Bubt Annex", style: GoogleFonts.nunito(color: Colors.white, fontWeight: FontWeight.w700)),
        ),

        body: const WebView(

          initialUrl: "https://annex.bubt.edu.bd/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}