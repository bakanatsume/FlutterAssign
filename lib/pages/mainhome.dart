import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/main.dart';
import 'package:krisha/pages/home.dart';
import 'package:krisha/pages/profile.dart';
import 'package:krisha/pages/userpost.dart';
import 'package:krisha/signup/login.dart';

class UserHome extends StatelessWidget {
  final List people = ['Mallika', 'Sejal', 'Susiyana', 'Prasiddhi', 'Yuki'];

  var username = localStorage.getString("username");
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  username.toString(),
                  style: TextStyle(fontSize: 20, color: AppColor.BLACK),
                ),
                accountEmail: Text(
                  '${username.toString()}gmail.com',
                  style: TextStyle(fontSize: 20, color: AppColor.BLACK),
                ),
                currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                  child: Image.network(
                    'https://unsplash.com/photos/nKC772R_qog',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                )),
                decoration: BoxDecoration(
                  color: AppColor.BROWN,
                  image: DecorationImage(
                    image: NetworkImage(
                      '',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorites"),
                onTap: () => print("fav"),
              ),
              ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text("Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  }),
              ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage()),
                    // );
                  }),
              ListTile(
                  leading: Icon(Icons.search),
                  title: Text("Search"),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => HomePage()),
                    // );
                  }),
              //   ListTile(
              //     leading: Icon(Icons.login),
              //     title: Text("Login"),
              //     onTap: () {
              //        Navigator.push(context
              // , MaterialPageRoute(builder: (context) => LoginPage()),
              //   );
              //     }
              //
              //   ),

              // ListTile(
              //   leading: Icon(Icons.exit_to_app),
              //   title: Text("Exit"),
              //   onTap: () => print("fav"),
              //
              // ),
              ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("|| LOGOUT  ||"),
                  onTap: () {
                    localStorage.clear();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: AppColor.BROWN,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Paw Finder'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: people.length,
                  itemBuilder: (context, index) {
                    return UserPost(name: people[index]);
                  }),
            ),
          ],
        ));
  }
}
