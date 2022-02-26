import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/pages/follower.dart';
import 'package:krisha/response/all_post.dart';

class UserPost extends StatelessWidget {
  final AllPostResponse res;

  UserPost({required this.res});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  new GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Follower()),
                      );
                    },
                    child: Text(
                      res.userId!.username.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Text(name,
                  // style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                ],
              ),
              Icon(Icons.menu),
            ],
          ),
        ),

        Builder(builder: (context) {
          print("http://192.168.1.84:1001/post/" + res.image.toString());
          return Container(
            height: 250,
            color: Colors.white,
            child: Image.network(
                "http://192.168.1.84:1001/post/" + res.image.toString()),
          );
        }),
        //post
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Icon(Icons.chat_bubble_outline),
                  ),
                  Icon(Icons.share),
                ],
              ),
            ],
          ),
        ),
        // //comment
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Row(
        //     children: [
        //       Text('liked by'),
        //       Text(
        //         'Susiyana',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //       Text('and'),
        //       Text(
        //         'others',
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       )
        //     ],
        //   ),
        // ),
        //captions
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: res.userId!.username.toString()+ "  " ,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: res.caption.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
