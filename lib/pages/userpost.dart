import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/pages/follower.dart';

class UserPost extends StatelessWidget {
  final String name;

   UserPost({ required this.name});

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
                  Container(width: 40,height: 40, decoration: BoxDecoration(
                  color: Colors.grey,
                  shape:BoxShape.circle,
                ) ,),
                SizedBox(
                  width: 10,
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Follower()),
                      
            );
                  },

                  child: Text(name,
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
            
            Container(
              height: 250,
              color: Colors.grey,
            ),
            //post
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:[
                Icon(Icons.favorite),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(Icons.chat_bubble_outline),
                  ),
                Icon(Icons.share),
                    ],
                  ),

              ],),
            ),
            //comment
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
               Row(children:[ Text('liked by'), Text(
                'Susiyana',
                 style: TextStyle(fontWeight: FontWeight.bold),),
                 Text('and'),
                 Text('others',
                 style: TextStyle(fontWeight: FontWeight.bold),)
                 ],),
            ),
            //captions
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(text:TextSpan(style: TextStyle(color: Colors.black),
              children:[
                TextSpan(
                text: name,
                 style: TextStyle(fontWeight: FontWeight.bold),),
                TextSpan( text:'please help me find this dog!'),
              ],
              ),
              ),     
                 ),
            
          ],
        );

  }
  }