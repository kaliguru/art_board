import 'package:art_board/Create_User.dart';
import 'package:art_board/Order_List.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Art Board"),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: <Widget>[
                DrawerHeader(child: UserAccountsDrawerHeader(accountName: Text('name'), accountEmail: Text("Phone"),)),
                SizedBox(height: 20,),
                ExpansionTile(title: Text("User Management"),
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>CreateUser()));
                    },
                    child: ListTile(
                      title: Text("Create User"),
                      leading: Icon(Icons.person_add),
                    ),
                  ),
                  ListTile(
                    title: Text("Manage User"),
                    leading: Icon(Icons.person),
                  )
                ],),
                ExpansionTile(title: Text("Order(s) Management"),
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>OrderList()));
                      },
                      child: ListTile(
                        title: Text("Order(s)"),
                        leading: Icon(Icons.bookmark_add_outlined),
                      ),
                    ),

                  ],),

              ],
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

            ],
          ),
        ),
      ),
    );
  }
}
