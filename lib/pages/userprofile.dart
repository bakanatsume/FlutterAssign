import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/main.dart';
import 'package:krisha/pages/profile.dart';



class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.BROWN,
        title: Text(
          'Profile',
          style: TextStyle(color: AppColor.WHITE, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //profile pic
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
              // folower , following
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Posts'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('237',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Follower'),
                      ],
                    ),
                    Column(
                      children: [
                        Text('237',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Following'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // name bio
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localStorage.getString("username").toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    'Pet loverrr',
                  ),
                ),
                Text(
                  'youtube.com/krishaa',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Row(
            children: [
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      'Edit Profile',
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.BROWN),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
