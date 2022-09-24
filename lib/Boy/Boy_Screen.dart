import 'package:art_board/Services/CreateOrderApi.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';

class BoyScreen extends StatefulWidget {
  const BoyScreen({Key? key}) : super(key: key);

  @override
  State<BoyScreen> createState() => _BoyScreenState();
}

class _BoyScreenState extends State<BoyScreen> {
  TextEditingController shopenameController = TextEditingController();
  TextEditingController shopeAddressController = TextEditingController() ;
  TextEditingController heightInFeetController = TextEditingController();
  TextEditingController heightInInchController = TextEditingController();
  TextEditingController widthInFeetController = TextEditingController();
  TextEditingController widthIninchController = TextEditingController();
  TextEditingController shopLocationController = TextEditingController();

  callLoginApi() {
    final service = new CreateOrderApi();


    service.apiCallLogin(
      {
        "width": widthInFeetController.text,
        "widthin": widthIninchController.text,
        "height": heightInFeetController.text,
        "heightin": heightInInchController.text,
        "shopaddress": shopeAddressController.text,
        "shopName": shopenameController.text,
        "shopNLocation": shopLocationController.text,
      },
    ).then((value){
      if(value.error != null){
        print("get data >>>>>> " + value.error!);
      }

    });

  }


  var mapUrl = "";
  var address = "";
  var streetAddress = "";

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }


    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async{
    List<Placemark>placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    print(place.street);
    streetAddress = "${place.street},${place.locality},${place.subLocality},${place.postalCode}|";
    print(streetAddress);
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        // drawer: Drawer(),
        appBar: AppBar(
          title: Text("Measurement"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: shopenameController,
                    decoration: InputDecoration(

                        label: Text("Shope Name"),
                        hintText: 'eg: Tirumala Enterprise',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: shopeAddressController..text = address,
                    decoration: InputDecoration(
                        label: Text("Shope Location"),
                        hintText: 'Bangalore',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: shopeAddressController..text = address,
                    decoration: InputDecoration(
                        label: Text("Shope Address"),
                        hintText: 'Bangalore',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: heightInFeetController,
                    decoration: InputDecoration(
                      label: Text("Height"),
                      hintText: 'Size(s) in Feet',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: heightInInchController,

                    decoration: InputDecoration(
                        label: Text("Height"),
                        hintText: 'Size(s) in inch',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widthInFeetController,
                    decoration: InputDecoration(
                        label: Text("Width"),
                        hintText: 'Size(s) in Feet',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: widthIninchController,
                    decoration: InputDecoration(
                        label: Text("Width"),
                        hintText: 'Size(s) in Inch',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()async{
                      Position position = await _getGeoLocationPosition();
                      print(position.latitude);
                      print(position.longitude);
                      print(position.timestamp);
                      address = "https://maps.google.com/?q=${position.latitude},${position.longitude}";
                      print(address);
                      GetAddressFromLatLong(position);
                      setState(() {

                      });

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 62,
                      child: ListTile(
                        title: Text("Get Shop Location",style: TextStyle(color: Colors.white),),
                        leading: Icon(Icons.location_pin,color: Colors.white,),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()async{
                      callLoginApi();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 62,
                      child: ListTile(
                        title: Text("Submmit Order",style: TextStyle(color: Colors.white),),
                        leading: Icon(Icons.location_pin,color: Colors.white,),
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
