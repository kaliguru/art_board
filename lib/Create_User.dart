import 'package:flutter/material.dart';

import 'Services/CreateUserApi.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();

  callLoginApi() {
    final service = new CreateUserApi();


    service.apiCallLogin(
      {
        "phone": _phoneController.text,
        "password": _passwordController.text,
        "userType":_userTypeController.text
      },
    ).then((value){
      if(value.error != null){
        print("get data >>>>>> " + value.error!);
      }if(value.userType == 'delivery')
      {
        return ScaffoldMessenger(child: SnackBar(content: Text("CreatedUser")));
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Center(
                  child: Text("Create User",style: TextStyle(fontSize: 30),),
                ),
                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    // obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Phone Numner"),
                        hintText: 'Phone Number',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.shield),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _userTypeController..text = "delivery",
                    obscureText: true,
                    decoration: InputDecoration(
                        label: Text("userType"),
                        hintText: 'Employee',
                        prefixIcon: Icon(Icons.shield),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),

                SizedBox(height: 20,),  
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
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
                        child: Text('Create User',style: TextStyle(fontSize: 25,color: Colors.white),),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
