import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';

class Follower extends StatelessWidget {
  const Follower({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top: 30 ),
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
                   Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text('19',
                            style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                            Text('Posts'),

                          
                          ],
                        ),
                       Column(
                      children: [
                        Text('2000',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Follower'),

                      
                      ],
                    ),
                    Column(
                      children: [
                        Text('654',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        Text('Following'),      
                      ],
                    ),
                  ],
                ),
              ),
              ],
          ),
        // name bio
          Padding(padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
          Text(
            'Kayden',
            style: TextStyle(fontWeight: FontWeight.bold),

          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),
          child:
          Text('better space for everyone',
          ),
          ),
          Text('snapchat,com/kayden',
          style: TextStyle(color: Colors.blue),
          ),
        ],
          ),
          ), 
          Row(
                children: [
                  Expanded(child:
                  Container(
                        padding: EdgeInsets.all(5),
                        child: Center(child: Text('follow',),
                        ),
                        decoration: 
                        BoxDecoration(border: Border.all(color: AppColor.BROWN),
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