import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:krisha/colors/colors.dart';
import 'package:krisha/main.dart';
import 'package:krisha/model/admin.dart';
import 'package:krisha/services/admin_log.dart';
import 'package:krisha/signup/registration.dart';
import 'package:krisha/pages/home.dart';
import 'package:krisha/utils/sharedpreference_utils.dart';
import 'package:krisha/utils/snackbar.utils.dart';
import 'package:passwordfield/passwordfield.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.CREAM,
      body: Center(
        child: Container(
          height: size.height * 0.6,
          width: size.width * 0.8,
          color: AppColor.BROWN,
          child: Column(
            children: [
              // Image(image: AssetImage('images/pet.png')),
              Container(
                child: Image.asset(
                  'images/pet.png',
                  width: 150,
                  height: 150,
                ),
              ),

              Container(
                width: size.width * 0.7,
                child: TextField(
                  controller: _usernameController,
                  style: TextStyle(color: AppColor.BLACK),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: AppColor.BLACK),
                    hintText: 'Enter your username',
                    hintStyle: TextStyle(color: AppColor.BLACK),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                width: size.width * 0.7,
                child: TextField(
                  obscureText: true,
                  /*......*/
                  controller: _passwordController,
                  style: TextStyle(color: AppColor.BLACK),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: AppColor.BLACK),
                    hintText: 'Enter your password',
                    hintStyle: TextStyle(color: AppColor.BLACK),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {

                  final data = User(
                      username: _usernameController.text,
                      password: _passwordController.text);
                  final res = await LoginService().login(data);
                  if (res.message == "successs!!!") {
                    await localStorage.setString("token", res.token.toString());
                    await localStorage.setString("username", _usernameController.text);
                    await localStorage.setString("password", _passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    snackThis(
                        context: context,
                        color: Colors.green,
                        content: Text("Login Sucess"));
                    // print(res.token);
                    // print('login success');
                  } else {
                    print(res.message);
                    snackThis(
                        context: context,
                        color: Colors.red,
                        content: Text("Username or password incorrect"));
                  }
                },
                child: const Text(
                  'login',
                ),
              ),
              // Container(
              //   width: size.width * 0.5,
              //   child: TextButton(
              //     style: TextButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       backgroundColor: AppColor.BLACK,
              //       padding: const EdgeInsets.all(10.0),
              //       primary: Colors.black,
              //       textStyle: const TextStyle(fontSize: 15),
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              // context,
              // MaterialPageRoute(builder: (context) => HomePage()),);

              //     },
              //     child: Text(
              //       "Login",
              //       style: TextStyle(color: AppColor.WHITE),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const Text("Don't have an account?")],
                ),
              ),
              Container(
                width: size.width * 0.5,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: AppColor.WHITE),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
