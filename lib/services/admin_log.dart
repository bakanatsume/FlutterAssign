import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:krisha/main.dart';
import 'package:krisha/model/admin.dart';
import 'package:krisha/model/comment_model.dart';
import 'package:krisha/model/edit_profile_model.dart';
import 'dart:convert';

import 'package:krisha/response/admin_resp.dart';
import 'package:krisha/response/comment_response.dart';
import 'package:krisha/response/edit_profile_response.dart';
import 'package:krisha/response/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginService {
  Future<LoginResponse> login(User loginRequest) async {
    try {
      return await http
          .post(Uri.parse('http://192.168.16.103:1001/user/login'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
          body: json.encode(loginRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = LoginResponse.fromJson(jsonDecode(data.body));

          // sharedPreferences.setString('userImage', response.user.userImage);

          return response;
        } else {
          return LoginResponse(message: null, token: null);
        }
      }).catchError((e) {
        return LoginResponse(message: null, token: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return LoginResponse(message: null, token: null);
    } on HttpException {
      return LoginResponse(message: null, token: null);
    } on FormatException {
      return LoginResponse(message: null, token: null);
    }
  }
}

class SignUpService {
  Future<RegisterResponse> signUp(User signUpRequest) async {
    try {
      return await http
          .post(Uri.parse('http://192.168.16.103:1001/user/register'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
          },
          body: json.encode(signUpRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = RegisterResponse.fromJson(jsonDecode(data.body));

          // sharedPreferences.setString('userImage', response.user.userImage);

          return response;
        } else {
          return RegisterResponse(message: null);
        }
      }).catchError((e) {
        return RegisterResponse(message: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return RegisterResponse(message: null);
    } on HttpException {
      return RegisterResponse(message: null);
    } on FormatException {
      return RegisterResponse(message: null);
    }
  }
}

class EditProfileServiceWithToken {
  Future<EditProfileResponse> editProfile(EditProfile editProfileRequest) async {
    try {
      String token = localStorage.getString("token").toString();

      return await http
          .put(Uri.parse('http://192.168.16.103:1001/user/update/'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': "Bearer ${token.toString()}",
          },
          body: json.encode(editProfileRequest.toJson()))
          .then((data) {
        if (data.statusCode == 200) {
          final response = EditProfileResponse.fromJson(jsonDecode(data.body));

          return response;
        } else {
          return EditProfileResponse(msg: null);
        }
      }).catchError((e) {
        return EditProfileResponse(msg: null);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return EditProfileResponse(msg: null);
    } on HttpException {
      return EditProfileResponse(msg: null);
    } on FormatException {
      return EditProfileResponse(msg: null);
    }
  }
}

