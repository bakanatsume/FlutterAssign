import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krisha/colors/colors.dart';


class UserPicture extends StatefulWidget {
  const UserPicture({ Key? key }) : super(key: key);

  @override
  _UserPictureState createState() => _UserPictureState();
}

class _UserPictureState extends State<UserPicture> {
  final _formkey = GlobalKey<FormState>();  
  File? _images;

  String Comment = '';
  String Caption = '';


  @override
  void initState(){
    super.initState();
    _images = null;
  }
  //method to open image from gallery
_imageFromGallery() async {
final images = await ImagePicker().pickImage(source: ImageSource.gallery);
setState(() {
_images = File(images!.path);
});
}

  //method to open image from camera
_imageFromCamera() async {
final images = await ImagePicker().pickImage(source: ImageSource.camera);
setState(() {
_images = File(images!.path);
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.BROWN,
        title: Text('Add Picture',
        style: TextStyle(color: AppColor.WHITE,
        fontWeight: FontWeight.bold),),

      ),
       body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text('Add Post to the feed ',
              style: TextStyle(
                fontSize: 20,
                fontWeight:FontWeight.bold,
                color: AppColor.BLACK,
                letterSpacing: 5.0
              ),
              ),
            ),
            Stack(
              children: [
               CircleAvatar(
                 radius: 50,
                 backgroundImage: _images == null?
                 const AssetImage('images/profile.png')
                 as ImageProvider:FileImage(_images!),
                 child: InkWell(
                   onTap: () {
                     showModalBottomSheet(context: context,
                      builder: (builder)=> bottomSheet());
                   },
                   child: const Icon(Icons.upload,
                   color:Colors.blue,
                   size:30,),
                 ),
               ),
              ],
            ),
             TextFormField(
                  onSaved: (value) {
                    Comment = value!;
                  },
                  maxLength: 30,
                  decoration: const InputDecoration(
                    labelText: 'Comment:',
                    hintText: 'Enter your Comment for the post',
                  ),
                ),
                TextFormField(
                  onSaved: (newValue) {
                    Caption = newValue!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Caption:',
                    hintText: 'Enter your Caption for the post',
                  ),
                ),
               
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
              
                  onPressed: () {  },
                  child: const Text(' ADD'),
                ),
                const SizedBox(height: 10),
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     minimumSize: const Size(double.infinity, 50),
                //   ),
                 
                //   onPressed: () {  },
                //   child: const Text('View comment'),
               // ),

          ],
        ),
        
        
            )),
      // Center(child: Text("Add Pictures"),),
      
    );
  }
  Widget bottomSheet(){
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text('choose profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(onPressed:(){
                _imageFromCamera();
                Navigator.pop(context);
              }, 
               icon: const Icon(Icons.camera), 
               label: const Text('Camera'),),
               const SizedBox(
                 width: 20,
               ),
               ElevatedButton.icon(onPressed: (){
                 _imageFromGallery();
                 Navigator.pop(context);

               },
                icon: const Icon(Icons.image),
                 label: const Text('Gallery'),),

            ],
          )
        ],
      ),
    );
  }
}
      
  