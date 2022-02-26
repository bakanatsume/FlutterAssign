import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/main.dart';
import 'package:krisha/model/edit_profile_model.dart';
import 'package:krisha/pages/home.dart';
import 'package:krisha/services/admin_log.dart';
import 'package:krisha/utils/snackbar.utils.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {

      _usernameController.text = localStorage.getString("username").toString();
      // asd
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.BROWN,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Material(
                      elevation: 4,
                      shadowColor: AppColor.BLACK,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(
                              letterSpacing: 2,
                              color: AppColor.BROWN,
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: AppColor.WHITE,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      shadowColor: AppColor.BLACK,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              letterSpacing: 2,
                              color: AppColor.BROWN,
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: AppColor.WHITE,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Material(
                      elevation: 4,
                      shadowColor: AppColor.BLACK,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: TextFormField(
                        controller: _phone,
                        decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: TextStyle(
                              letterSpacing: 2,
                              color: AppColor.BROWN,
                              fontWeight: FontWeight.bold,
                            ),
                            fillColor: AppColor.WHITE,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () async {
                          // print("asdasd"+localStorage.getString("token").toString());
                          // if(_confirmPasswordController.text == _passwordController.text){
                          //   if(_passwordController.text.length > 6){
                              final profileData = EditProfile(
                                username: _usernameController.text,
                                phoneNo: _phone.text,
                                email: _email.text,
                              );
                              final res = await EditProfileServiceWithToken()
                                  .editProfile(profileData);
                              if(res.success == true){
                                snackThis(
                                    context: context,
                                    color: Colors.green,
                                    content: Text("Updated Profile"));
                                Navigator.pop(context);

                                await localStorage.setString("email", _email.text);
                                await localStorage.setString("phoneNo", _phone.text);
                              }
                              else{
                                snackThis(
                                    context: context,
                                    color: Colors.red,
                                    content: Text(res.msg.toString()));
                              }
                            // }
                          //   else{
                          //     snackThis(
                          //         context: context,
                          //         color: Colors.red,
                          //         content: Text("Password must be longer than 6 characters"));
                          //   }
                          // }
                          // else{
                          //   snackThis(
                          //       context: context,
                          //       color: Colors.red,
                          //       content: Text("Both passwrd must be same"));
                          // }
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => HomePage()),
                          // );
                        },
                        color: AppColor.BLACK,
                        child: Center(
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            //
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: AppColor.BROWN,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/profile.png'),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 80, left: 90),
            child: CircleAvatar(
              backgroundColor: AppColor.BLACK,
              child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class HeaderCurvedContainer extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()..color = AppColor.BROWN;
//     Path path = Path()
//       ..relativeLineTo(0, 150)
//       ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
//       ..relativeLineTo(0, -150)
//       ..close();
//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
