import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateOrderApi{

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('https://art-board-techkit.herokuapp.com/order/new');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode(response.body);
    return LoginApiResponse( error: data["error"],width: data['width'], widthin: data['widthin'], height: data['height'], heightin: data['heightin'],shopName: data['shopName'], shopaddress: data['shopaddress'],shopLocation: data['shopLocation'] );
  }
}


class LoginApiResponse{

  final String? error;
  final int? width;
  final int? widthin;
  final int? height;
  final int? heightin;
  final String? shopName;
  final String? shopaddress;
  final String? shopLocation;

  LoginApiResponse({this.error,this.width, this.widthin, this.height, this.heightin, this.shopaddress, this.shopName, this.shopLocation});

}