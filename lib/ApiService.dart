import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices{

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('https://art-board-techkit.herokuapp.com/user/login');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["error"],userType: data['userType'] );
  }
}


class LoginApiResponse{
  final String? token;
  final String? error;
  final String? userType;
  final String? emaill;

  LoginApiResponse(
      {this.token,this.error,this.userType,this.emaill});

}