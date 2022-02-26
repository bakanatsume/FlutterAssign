import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/pages/home.dart';
import 'package:krisha/pages/profile.dart';
import 'package:krisha/signup/login.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'krisha',
              style: TextStyle(fontSize: 20, color: AppColor.BLACK),
            ),
            accountEmail: Text(
              '@gmail.com',
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
          ListTile(
              leading: Icon(Icons.login),
              title: Text("Login"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
            onTap: () => print("fav"),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text("|| LOGOUT  ||"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              }),
        ],
      ),
    );
  }
}
