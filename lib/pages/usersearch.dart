import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';

class UserSearch extends StatelessWidget {
  const UserSearch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.BROWN,
        elevation: 0,
        title:ClipRRect(
          borderRadius:BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(8),
            color: AppColor.CREAM,
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: AppColor.BLACK
                ),
                Container(
                  child: Text(
                    'Search',
                    style:TextStyle(color: AppColor.BLACK),
                  ),
                )
              ],
            ),


          )
        )
      ),
      body: Center(child: Text('Search Bar '))
      
    );
  }
}