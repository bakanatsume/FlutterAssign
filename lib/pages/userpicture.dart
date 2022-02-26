import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/model/add_post_model.dart';
import 'package:krisha/services/admin_log.dart';
import 'package:http/http.dart' as http;

import '../main.dart';

class UserPicture extends StatefulWidget {
  const UserPicture({Key? key}) : super(key: key);

  @override
  _UserPictureState createState() => _UserPictureState();
}

class _UserPictureState extends State<UserPicture> {
  final _formkey = GlobalKey<FormState>();
  // File? _images;


  File? _imageFile;

  final ImagePicker _picker = ImagePicker();


  String Comment = '';
  String Caption = '';

  @override
  void initState() {
    super.initState();
    _imageFile = null;
  }


  Future<void> _pickImage(ImageSource source) async {
    // _imageFile = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile.path));
    var selected = await _picker.pickImage(source: source, imageQuality: 10);

    setState(() {
      if (selected != null) {
        _imageFile = File(selected.path);
        // Fluttertoast.showToast(msg: "Image updated succesfully");
      } else {
        print('No image selected.');
        // Fluttertoast.showToast(msg: "No image Selected");
      }
    });
  }

  //method to open image from gallery
  // _imageFromGallery() async {
  //   final imagePath =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (imagePath != null) {
  //       _images = File(imagePath!.path);
  //     } else {
  //       Fluttertoast.showToast(msg: "No image Selected");
  //     }
  //   });
  // }
  //
  // //method to open image from camera
  // _imageFromCamera() async {
  //   final imagePath = await ImagePicker().pickImage(source: ImageSource.camera);
  //   setState(() {
  //     if (imagePath != null) {
  //       _images = File(imagePath!.path);
  //     } else {
  //       Fluttertoast.showToast(msg: "No image Selected");
  //     }
  //   });
  // }

  final TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.BROWN,
        title: Text(
          'Add Picture',
          style: TextStyle(color: AppColor.WHITE, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Add Post to the feed ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.BLACK,
                        letterSpacing: 5.0),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (builder) => bottomSheet());
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _imageFile == null
                            ? const AssetImage('images/profile.png')
                                as ImageProvider
                            : FileImage(_imageFile!),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (builder) => bottomSheet());
                          },
                          child: const Icon(
                            Icons.upload,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TextFormField(
                //      onSaved: (value) {
                //        Comment = value!;
                //      },
                //      maxLength: 30,
                //      decoration: const InputDecoration(
                //        labelText: 'Comment:',
                //        hintText: 'Enter your Comment for the post',
                //      ),
                //    ),
                TextFormField(
                  controller: _caption,
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
                  onPressed: ()async {
                    print(_caption.text);
                    print(_imageFile.toString());

                    final filename = _imageFile!.path.split('/').last;

                    // final postContent = AddPostRequest(
                    //   image: _images.toString(),
                    //   caption: _caption.text
                    // );
                    final res = await AddPostServiceWithToken().addPost(_imageFile!, _caption.text);
                    if(res.success==true){
                      print("post added");
                    }
                    else(
                    print(res.msg.toString())
                    );
                  },
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

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'choose profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context, rootNavigator: true).pop();
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context, rootNavigator: true).pop();
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
