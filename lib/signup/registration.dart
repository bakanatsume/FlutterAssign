import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/model/admin.dart';
import 'package:krisha/services/admin_log.dart';
import 'package:krisha/signup/login.dart';
import 'package:krisha/utils/snackbar.utils.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  final _Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.CREAM,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: AppColor.BROWN,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height - 40,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account, It's free ",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Form(
                key: _Key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Username",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "please enter your username";
                        } else {
                          return null;
                        }
                      },
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.CREAM)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Phone No",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "please enter your phone number";
                        } else {
                          return null;
                        }
                      },
                      controller: _phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.CREAM)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "please enter your password";
                        } else {
                          return null;
                        }
                      },
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.CREAM)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == "") {
                          return "please enter your Confirm password";
                        } else {
                          return null;
                        }
                      },
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.CREAM)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              //
              Container(
                width: size.width * 0.2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: AppColor.BLACK,
                    padding: const EdgeInsets.all(10.0),
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () async {
                    if (_Key.currentState!.validate()) {
                      if (_passwordController.text == _confirmPassword.text) {
                        final data = User(
                            username: _usernameController.text,
                            password: _passwordController.text);
                        final res = await SignUpService().signUp(data);
                        if (res.message == "Registered Successs") {
                          snackThis(
                              context: context,
                              color: Colors.green,
                              content: Text(res.message.toString()));
                          // print('Registered success');
                          Navigator.pop(context);
                        } else {
                          print("Registered Successs");
                          snackThis(
                              context: context,
                              color: Colors.red,
                              content: Text(res.message.toString()));
                        }
                      }
                      else{
                        snackThis(
                            context: context,
                            color: Colors.red,
                            content: Text("Both password must be same"));
                      }
                    }
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: AppColor.WHITE),
                  ),
                ),
              ),

              //
            ],
          ),
        ),
      ),
    );
  }
}
