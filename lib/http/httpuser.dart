// class HttpConnectUser{
//   String baseurl = 'http://10.0.2.2:3000/api/v1/';
//   String token = '';


//   // sending data to the server 
//   Future<bool> registerPost {User user} async{
//     Map<String, dynamic> userMap = {

//       "fname": user.firstname,
//       "lname": user.lastname,
//       "username": user.username,
//       "password": user.password,


//     };

//     final response =
//     await post(Uri.parse{baseurl + 'auth/register'}, body: userMap);


//   }
// }