
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/main.dart';
import 'package:krisha/pages/mainhome.dart';
import 'package:krisha/pages/profile.dart';
import 'package:krisha/pages/sidescreen.dart';
import 'package:krisha/pages/userpicture.dart';
import 'package:krisha/pages/userpost.dart';
import 'package:krisha/pages/userprofile.dart';
import 'package:krisha/pages/usersearch.dart';
import 'package:krisha/utils/sharedpreference_utils.dart';
class HomePage extends StatefulWidget {


   const HomePage( { Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int _selectedIdex = 0;
  void _navigateBottomNavBar(int index){
      setState ((){
      _selectedIdex = index;
    });
  }

  // different pages to navigate to 

  final List<Widget> _children =[
    UserHome(),
    UserSearch(),
    UserPicture(),
     UserProfile(),
  ];


  final token = localStorage.getString("token");
  final username = localStorage.getString("username");

  @override
  Widget build(BuildContext context) {
    print(localStorage.getString("token").toString());
    print(localStorage.getString("username").toString());
    // print(widget.token.toString());
    // print(widget.username.toString());
    return Scaffold(
      body: _children[_selectedIdex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIdex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
           label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Add pic',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'profile', 
          ),

      ],),
      
      
      // actions: [IconButton
      // (onPressed: () {
      //               Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => Profile()),
      //       );
      //             }, 
      //             icon: Icon(Icons.account_box_outlined)),
      
      // IconButton(icon: const Icon(Icons.search),
      // onPressed: () {
        
      // },
      // ),
      // ], 
       
          
       
     );
  }

}



