import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geo_loction/Admin_page.dart';
import 'package:geo_loction/Data.dart';
import 'package:geo_loction/addcheckbox.dart';

import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyState());
  }
}

class MyState extends State<MyWidget> {
  var uname;
  var pass;
  var jsonString;
  var deviceid;
  var device_name;
  var response;

  bool? flag1 = false;

  var mycontroller1 = TextEditingController();
  var mycontroller2 = TextEditingController();

  final apiUrl = 'http://crm.konarkgroup.com:8101//v1/app/login';
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  Future<void> sendPostRequest() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    Position position = await Geolocator.getCurrentPosition();
    geolocation gl = geolocation(position.latitude.toInt(),
        position.longitude.toInt(), position.accuracy.toInt());

    uname = mycontroller1.text;
    pass = mycontroller2.text;
    deviceid = androidInfo.id;
    device_name = androidInfo.model;

    logcheck ob = logcheck(uname, pass, deviceid, device_name, gl);
    response = await http.post(Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body:

            //  jsonEncode(ob.toJson())

            jsonEncode({
          "UserName": "yogm",
          "Password": "MyKey@0624",
          "DeviceId": "8377fc89-eaf4-412e",
          "DeviceName": "Xiaomi M2101K7AI",
          "GeoLocation": {"LatLong": "123", "Accuracy": "456"}
        }));

    // final dio = Dio();
    // final response = await dio.post(apiUrl, data: {
    //   'UserName': "yogm",
    //   'Password': "MyKey@0624",
    //   'DeviceId': "8377fc89-eaf4-412e",
    //   'DeviceName': "Xiaomi M2101K7AI",
    //   'GeoLocation': {"LatLong": "123", "Accuracy": "456"}
    // });

    // print(response.data);

    if (response.statusCode == 200) {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Post created successfully!"),
      // ));

      print("successful==$response");

      print(response.body);

      Get_Login_Response gl =
          Get_Login_Response.fromJson(jsonDecode(response.body));
      print(gl);
      JsonData.jsondata = gl;
    }

    // if (response.statusCode == 201) {
    //   // Scaffold.of(context).showSnackBar(SnackBar(
    //   //   content: Text("Post created successfully!"),
    //   //)
    //   //);

    //    print(response.body);

    // }

    // if (response.statusCode == 202) {
    //   // Scaffold.of(context).showSnackBar(SnackBar(
    //   //   content: Text("Post created successfully!"),
    //   //)
    //   //);

    //   print(response.body);
    // }

    else {
      // Scaffold.of(context).showSnackBar(SnackBar(
      //   content: Text("Failed to create post!"),
      // ));

      print("something wrong==");
      print(response.body);

      Get_Login_Response gl =
          Get_Login_Response.fromJson(jsonDecode(response.toString()));
      print(gl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  width: 180,
                  height: 135,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.zero,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     offset: const Offset(5.0, 5.0),
                    //     blurRadius: 10.0,
                    //     spreadRadius: 2.0,
                    //   ),
                    //   BoxShadow(
                    //     color: Colors.white,
                    //     offset: const Offset(0.0, 0.0),
                    //     blurRadius: 0.0,
                    //     spreadRadius: 0.0,
                    //   ),
                    // ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: mycontroller1,
                  decoration: InputDecoration(
                      labelText: 'Username', border: OutlineInputBorder()),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  obscureText: true,
                  controller: mycontroller2,
                  decoration: InputDecoration(
                      labelText: 'Password', border: OutlineInputBorder()),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  child: Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  // onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                  onTap: () =>
                      print(' terms and condition linklabel is clicked'),
                ),
              ),

              Padding(
                  padding: EdgeInsets.all(1),
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    //titleAlignment: ListTileTitleAlignment.center,

                    title: Text('I Agree'),

                    leading: Checkbox(
                        value: flag1,
                        onChanged: (value) {
                          setState(() {
                            flag1 = value;
                          });
                        }),
                  )),

              Padding(
                padding: EdgeInsets.all(5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                  child: Text("LOGIN"),
                  onPressed: () async {
                    sendPostRequest();
                
                    // Navigator.push(
                    //  context,
                    //   MaterialPageRoute(builder: (context) => MyWidget1()),
                    //  );

                    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

                    // Position position = await Geolocator.getCurrentPosition();

                    setState(() {
                      uname = mycontroller1.text;
                      pass = mycontroller2.text;
                      // deviceid = androidInfo.id;
                      // device_name = androidInfo.model;

                      // geolocation gl = geolocation(position.latitude.toInt(),
                      //     position.longitude.toInt(), position.accuracy.toInt());
                      // print('device id=$deviceid');
                      // print('device name=$device_name');
                      // print('latitude=${position.latitude.toInt()}');

                      if (flag1 == true) {
                        // logcheck ob =
                        //     logcheck(uname, pass, deviceid, device_name, gl);
                        // jsonString = jsonEncode(ob.toJson());
                      } else {
                        print('please check i agree ');
                      }
                      //               if (uname!="" && pass!="" && flag1 == true){

                      //                   print("all ok");

                      //               }

                      //               else {
                      //                 print('please enter username and password and select checkbox ');

                      //                  showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return AlertDialog(
                      //       title: Text("ok"),
                      //       content: Text("Saved successfully"),
                      //       // Add action buttons if needed.
                      //     );
                      //   },
                      // );
                      //                  }
                      //  if(flag1==true){

                      //   print("check box selected");
                      //  }
                      //  else{
                      //         print("check box not selected");
                      //  }
                    });
                  },
                ),
              ),

// Padding(
//   padding: EdgeInsets.all(10),
// child:Text('User name=$uname  password=$pass',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,backgroundColor: Colors.deepOrange ),)

// ),

              // Padding(
              //     padding: EdgeInsets.all(10),
              //     child: Text(
              //       'JSONString=',
              //       style: TextStyle(
              //           fontSize: 20,
              //           fontStyle: FontStyle.italic,
              //           backgroundColor: Color.fromARGB(255, 34, 237, 255)),
              //     ))
            ],
          ),
          appBar: AppBar(
            //title: Text('object to JSON conversion'),
            backgroundColor: Colors.deepOrange,
          ),
        )));
  }
}

class geolocation {
  var lat, long, accuracy;
  geolocation(this.lat, this.long, this.accuracy);
}

class logcheck {
  var uname = '';
  var pass = '';
  var deviceid = '';
  var devicename = '';

  geolocation gl;

  logcheck(this.uname, this.pass, this.deviceid, this.devicename, this.gl);

  Map toJson() {
    return {
      "UserName": uname,
      "Password": pass,
      "DeviceId": deviceid,
      "DeviceName": devicename,
      "GeoLocation": {
        "LatLong": "${gl.lat}${gl.long}",

        // "LatLong":"${gl.lat}",
        "Accuracy": "${gl.accuracy}"
      }
    };
  }
}

class Get_Login_Response {
  // "UserID": 0,
  // "UserName": "string",
  // "FullName": "string",
  // "Designation": "string",
  // "IsAppAccessAllowed": true,
  // "IsGEOTrackEnabled": true,
  // "ApiAuthToken": "string",
  // "LogoutHrs": 0,
  // "CheckOutDistance": 0,
  // "LogGEODistance": 0,
  // "LogGEOTime": 0,
  // "TrackGEOType": 0,
  // "TrackGEOValue": 0

  int UserId = 0;
  var UserName = '';
  var FullName = '';
  var Designation = '';
  bool IsAppAccessAllowed = false;
  bool IsGEOTrackEnabled = false;
  var ApiAuthToken = '';
  var LogoutHrs = 0;
  var CheckOutDistance = 0;
  var LogGEODistance = 0;

  var LogGEOTime = 0;
  var TrackGEOType = 0;
  var TrackGEOValue = 0;

  Get_Login_Response(
      this.UserId,
      this.UserName,
      this.FullName,
      this.Designation,
      this.IsAppAccessAllowed,
      this.IsGEOTrackEnabled,
      this.ApiAuthToken,
      this.LogoutHrs,
      this.CheckOutDistance,
      this.LogGEODistance,
      this.LogGEOTime,
      this.TrackGEOType,
      this.TrackGEOValue);

  factory Get_Login_Response.fromJson(dynamic json) {
    Get_Login_Response log = Get_Login_Response(
      json['UserID'] as int,
      json['UserName'] as String,
      json['FullName'] as String,
      json['Designation'] as String,
      json['IsAppAccessAllowed'] as bool,
      json['IsGEOTrackEnabled'] as bool,
      json['ApiAuthToken'] as String,
      json['LogoutHrs'] as int,
      json['CheckOutDistance'] as int,
      json['LogGEODistance'] as int,
      json['LogGEOTime'] as int,
      json['TrackGEOType'] as int,
      json['TrackGEOValue'] as int,
    );
    return log;
  }

  @override
  String toString() {
    return "${this.UserId},${this.UserName},${this.FullName},${this.Designation},${this.IsAppAccessAllowed},${this.IsGEOTrackEnabled},${this.ApiAuthToken},${this.LogoutHrs},${this.CheckOutDistance},${this.LogGEODistance},${this.LogGEOTime},${this.TrackGEOType},${this.TrackGEOValue}";
  }
}
