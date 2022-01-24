import 'package:bubt_app/models/user_model.dart';
import 'package:bubt_app/screens/home_screen.dart';
import 'package:bubt_app/screens/image_upload_screen.dart';
import 'package:bubt_app/screens/start_screen.dart';
import 'package:bubt_app/screens/user_profile_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawerWidget extends StatefulWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  void initState()
  {
    super.initState();

    FirebaseFirestore.instance.collection("users").doc(user!.uid).get()
      .then((value) => {

        loggedInUser = UserModel.fromMap(value.data()),

        setState(() {})
      });
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: Material(

        color: const Color(0xff1e3799),
        
        child: SafeArea(

          child: ListView(
        
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            children: [
              
              UserAccountsDrawerHeader(

                decoration: BoxDecoration(

                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                accountName: Text("${loggedInUser.name}", style: GoogleFonts.nunito(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                accountEmail: Text("${loggedInUser.email}", style: GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.normal)),
                currentAccountPicture: InkWell(

                  onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageUploadScreen()));
                  },
                  child: const CircleAvatar(
                
                    radius: 40.0, backgroundColor: Colors.amber,
                    child: CircleAvatar(
                  
                      radius: 30.0, backgroundImage: AssetImage("assets/icons/user-profile.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
        
              buildMenuItem(
        
                text: "Home",
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0),
              ),
              SizedBox(height: 10.h),
        
              buildMenuItem(
        
                text: "Profile",
                icon: Icons.account_circle_rounded,
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
        
              SizedBox(height: 10.h),
        
              const Divider(color: Colors.white70, thickness: 1),
        
              SizedBox(height: 10.h),
        
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

  Future<void> selectedItem(BuildContext context, int index) async {

    Navigator.pop(context);

    switch (index){

      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfileScareen()));
        break;
      
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      
      case 7:

        await FirebaseAuth.instance.signOut();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const StartScreen()));
        break;
    }
  }
}