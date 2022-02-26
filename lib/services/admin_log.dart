import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:krisha/main.dart';
import 'package:krisha/model/add_post_model.dart';
import 'package:krisha/model/admin.dart';
import 'package:krisha/model/comment_model.dart';
import 'package:krisha/model/edit_profile_model.dart';
import 'package:krisha/model/get_user_response.dart';
import 'dart:convert';

import 'package:http_parser/http_parser.dart';

import 'package:krisha/response/admin_resp.dart';
import 'package:krisha/response/all_post.dart';
import 'package:krisha/response/comment_response.dart';
import 'package:krisha/response/edit_profile_response.dart';
import 'package:krisha/response/post_response.dart';
import 'package:krisha/response/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginService {
  Future<LoginResponse> login(User loginRequest) async {
    try {
      return await http
          .post(Uri.parse('http://192.168.1.84:1001/user/login'),
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
          .post(Uri.parse('http://192.168.1.84:1001/user/register'),
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
          .put(Uri.parse('http://192.168.1.84:1001/user/update/'),
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



class GetPostWithToken {
  Future<List<AllPostResponse>> getAll() async {
    try {
      String token = localStorage.getString("token").toString();

      return await http
          .get(Uri.parse('http://192.168.1.84:1001/getall/post'),
          headers: {
            'Content-Type': 'application/json',
            'accept': 'application/json',
            'Authorization': "Bearer ${token.toString()}",
          })
          .then((data) {
        if (data.statusCode == 200) {
          return allPostResponseFromJson(data.body);
        } else {
          return List<AllPostResponse>.from([]);
        }
      }).catchError((e) {
        return List<AllPostResponse>.from([]);
      });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return List<AllPostResponse>.from([]);
    } on HttpException {
      return List<AllPostResponse>.from([]);
    } on FormatException {
      return List<AllPostResponse>.from([]);
    }
  }
}


class AddPostServiceWithToken {
  Future<PostResponse> addPost(File file, String caption) async {
    try {
      String token = localStorage.getString("token").toString();

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token.toString()}',
      };
      var request = http.MultipartRequest("POST", Uri.parse('http://192.168.1.84:1001/post/insert'))
        ..fields['caption'] = caption
        ..files.add(http.MultipartFile.fromBytes(
            'postimage', await File.fromUri(Uri.parse(file.path)).readAsBytes(),
            contentType: MediaType('image', 'jpg'), filename: 'image.jpg'))
        ..headers.addAll(headers);

      return await request.send().then((data) async {
        // print(caption.toString()+"asdasd");
        // print(file);
        if (data.statusCode == 200) {
          var responseData = await data.stream.toBytes();
          var responseString = String.fromCharCodes(responseData);
          final response =
          PostResponse.fromJson(jsonDecode(responseString));

          return response;
        } else {
          return PostResponse(
            msg: "Some error has occured1"
          );
        }
      }).catchError((e) {
        // print(e);
        return PostResponse(
          msg: "Some error has occured2",
          // token: null,null
        );
      });


      // var request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.84:1001/post/insert/'));
      // request.headers.addAll({ 'Content-Type': 'application/json',
      //   'accept': 'application/json',
      //   'Authorization': "Barer ${token.toString()}",});

      // request.files.add(await http.MultipartFile.fromPath("image", filePath));
      //
      // var response = await request.send();
      //
      // var responsed = await http.Response.fromStream(response);
      // final responseData = json.decode(responsed.body);
      //
      // if(response.statusCode == 200){
      //   print("success");
      //   print(responseData);
      // }else{
      //   print("ERRR:");
      // }
      //
      // return await http
      //     .get(Uri.parse('http://192.168.1.84:1001/post/insert/'),
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'accept': 'application/json',
      //       'Authorization': "Bearer ${token.toString()}",
      //     })
      //     .then((data) {
      //   if (data.statusCode == 200) {
      //     final response = PostResponse.fromJson(jsonDecode(data.body));
      //     return response;
      //   } else {
      //     print("errrr");
      //     return PostResponse(msg: null);
      //   }
      // }).catchError((e) {
      //   return PostResponse(msg: null);
      // });
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e);
      return PostResponse(msg: null);
    } on HttpException {
      return PostResponse(msg: null);
    } on FormatException {
      return PostResponse(msg: null);
    }
  }
}


// class GetUserDetails {
//   Future<GetUserResponse> getUserDetails() async {
//     String token = localStorage.getString("token").toString();
//     String username = localStorage.getString("username").toString();
//     try {
//       return await http
//           .get(Uri.parse('http://192.168.1.84:1001/search/user'),
//           headers: {
//             'Content-Type': 'application/json',
//             'accept': 'application/json',
//             'Authorization': "Bearer ${token.toString()}",
//           },
//           body: json.encode(username))
//           .then((data) {
//           final response = GetUserResponse.fromJson(jsonDecode(data.body));
//           print(response.id.toString());
//           print("asdasdasdasd");
//
//           // sharedPreferences.setString('userImage', response.user.userImage);
//           return response;
//       }).catchError((e) {
//         return GetUserResponse(id: null);
//       });
//     } on SocketException catch (e) {
//       // ignore: avoid_print
//       print(e);
//       return GetUserResponse(id: null);
//     } on HttpException {
//       return GetUserResponse(id: null);
//     } on FormatException {
//       return GetUserResponse(id: null);
//     }
//   }
// }