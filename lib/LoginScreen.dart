import 'package:art_board/ApiService.dart';
import 'package:art_board/Boy/Boy_Screen.dart';
import 'package:art_board/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();


}

class _LoginScreenState extends State<LoginScreen> {



  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var errorText;
  bool validate = false;
  bool circular = false;
  final storage = new FlutterSecureStorage();


  callLoginApi() {
    final service = new ApiServices();


    service.apiCallLogin(
      {
        "phone": phoneController.text,
        "password": passwordController.text,
      },
    ).then((value){
      if(value.error != null){
        print("get data >>>>>> " + value.error!);
      }if(value.userType == 'admin')
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
      }if(value.userType == 'delivery')
      {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>BoyScreen()), (route) => false);

      }if(value.token != null)
      {

      }

    });

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,) ,
              Container(
                child: Icon(Icons.abc,size: 200,color: Colors.black54,),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Login",style: TextStyle(fontSize: 50,color: Colors.black54),),
                    SizedBox(width: MediaQuery.of(context).size.width/3,),
                    TextButton(onPressed: (){}, child: Center(
                      child: Text("Forget Password",style: TextStyle(color: Colors.black54),),
                    ))
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.mail),

                    hintText: 'Email',

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 2,color: Colors.black))
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController  ,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.shield),

                      hintText: 'Password',

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(width: 2,color: Colors.black))
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: ()async{
                  callLoginApi();

                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Text('Login',style: TextStyle(fontSize: 25,color: Colors.white),),
                  ),
                ),
              ),
              ),
              SizedBox(height: 50,),
              TextButton(onPressed: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (c)=>BoyScreen()), (route) => false);
              }, child: Center(
                child: Text("Sign Up"),
              ))

            ],

          ),
        ),
      ),
    );
  }
}
