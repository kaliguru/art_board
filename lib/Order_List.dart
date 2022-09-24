import 'dart:convert';

import 'package:art_board/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Models/post.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List users = [];
  getOrderData()
    async{
      var response = await http.get(Uri.parse("https://art-board-techkit.herokuapp.com/order/all"));
      var jsonData = jsonDecode(response.body);

      print(jsonData['orderData'].length);



       for(var U=0; U < jsonData['orderData'].length;U++){
         Order user = await Order(jsonData['orderData'][U]['shopName'],jsonData['orderData'][U]['shopaddress'],jsonData['orderData'][U]['shopLocation'],jsonData['orderData'][U]['width'],jsonData['orderData'][U]['widthin'],jsonData['orderData'][U]['height'],jsonData['orderData'][U]['heightin']);
         users.add(user);
         print('users ${user.shopLocation}');
       }
       print("object");

       print(users[0].shopName);
       print("start");
       return users;
  }



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getOrderData();
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order List"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Card(
            child: FutureBuilder(future: getOrderData(),builder: (context,AsyncSnapshot snapshot){
              if(snapshot.data == null)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }else return ListView.builder(itemCount: 10,itemBuilder: (context, index)
              {
                return ListTile(
                  title: Text(snapshot.data[index].shopName),
                  subtitle: Text(snapshot.data[index].shopaddress),
                );

              });


            },),
          ),
        )

          ),
        );


  }
}


class Order
{
  final String? shopName, shopaddress, shopLocation;
  final int? width, widthin, height, heightin;

  Order(this.shopName, this.shopaddress, this.shopLocation, this.width, this.widthin,this.height,this.heightin);
}

// class User
// {
//   final String name,username,email;
//
//   User(this.name, this.username, this.email);
// }