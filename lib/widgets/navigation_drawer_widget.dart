import 'package:bubt_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerWidget extends StatelessWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: Material(

        color: const Color(0xff1e3799),
        child: ListView(

          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [

            SizedBox(height: 50.h),

            buildMenuItem(

              text: "Home",
              icon: Icons.home,
              onClicked: () => selectedItem(context, 0),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "People",
              icon: Icons.people,
              onClicked: () => selectedItem(context, 1),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "Favorites",
              icon: Icons.favorite_outlined,
              onClicked: () => selectedItem(context, 2),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "Workflow",
              icon: Icons.workspaces_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "Updates",
              icon: Icons.update_rounded,
              onClicked: () => selectedItem(context, 4),
            ),

            SizedBox(height: 20.h),

            const Divider(color: Colors.white70, thickness: 0.8),

            SizedBox(height: 20.h),

            buildMenuItem(

              text: "Share",
              icon: Icons.share_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "Settings",
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 6),
            ),
            SizedBox(height: 10.h),

            buildMenuItem(

              text: "Logout",
              icon: Icons.logout_outlined,
              onClicked: () => selectedItem(context, 7),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({required String text, required IconData icon, required VoidCallback? onClicked})
  {

    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(

      
      leading: Icon(icon, color: color),
      title: Text(text, style: GoogleFonts.nunito(color: color, fontSize: 14.sp, fontWeight: FontWeight.w600)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {

    switch (index){

      case 0:
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
    }
  }
}