import 'package:bubt_app/screens/bubt_nx_screen.dart';
import 'package:bubt_app/screens/bubt_screen.dart';
import 'package:bubt_app/screens/dashboard_screen.dart';
import 'package:bubt_app/screens/online_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenGrid extends StatefulWidget {

  const HomeScreenGrid({ Key? key }) : super(key: key);

  @override
  _HomeScreenGridState createState() => _HomeScreenGridState();
}

class _HomeScreenGridState extends State<HomeScreenGrid> {

  List screenList = [

    const BubtScreen(), const BubtNxScreen(), const OnlinePaymentScreen(), const DashBoardScreen()
  ];

  List<String> iconList = [

    "assets/icons/university.png",
    "assets/icons/nx.png",
    "assets/icons/payment.png",
    "assets/icons/dashboard.png"
  ];

  List<String> textList = ["BUBT", "BUBT NX", "Online Payment", "DashBoard"];

  @override
  Widget build(BuildContext context) {

    return Center(
      
      child: GridView.builder(

        itemCount: 4,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10
        ),
        itemBuilder:(context, index) {
          
          return GestureDetector(
          
            onTap: (){
          
              Navigator.push(context, MaterialPageRoute(builder: (context) => screenList[index]));
            },
            child: Container(
            
              height: 400.h, width: 400.w,
              decoration: BoxDecoration(
          
                color: Colors.blue.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.blue)
              ),
              child: Center(
          
                child: Column(
          
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
          
                    Image.asset(iconList[index], height: 70.h, width: 70.w),
                    SizedBox(height: 10.0.h),
                    
                    Text(
          
                      textList[index], textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w700)
                    )
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}