import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateUserApi{

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('https://art-board-techkit.herokuapp.com/user/signup');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["error"],userType: data['userType'], phone: data['phone'], );
  }
}


class LoginApiResponse{
  final String? token;
  final String? error;
  final String? userType;
  final String? phone;
  final String? password;

  LoginApiResponse({this.token,this.error,this.userType, this.phone, this.password});

}