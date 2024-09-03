

import 'dart:async';
import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'package:geolocator/geolocator.dart';

void main() {
  runApp( MyWidget());
}

class MyWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return(MyState());
  }


}

class MyState extends State<MyWidget>{
var uname;
var pass;
var jsonString;
static var deviceid='';
var device_name;



  

var mycontroller1=TextEditingController();
var mycontroller2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return(
  MaterialApp(

   home: Scaffold(
   body:Column(
    children: [
  Padding
  (padding: EdgeInsets.all(10),
    child: TextField(
    controller: mycontroller1,
    decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder()
),

  ),
  ),
   

   Padding
  (padding: EdgeInsets.all(10),
    child: TextField( 
      obscureText: true,
    controller: mycontroller2,
    decoration: InputDecoration(
    labelText: 'Password',
    border: OutlineInputBorder()
),

  ),
  ),
   

   Padding(
    
    padding:EdgeInsets.all(10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
      child: Text("click here"),
      onPressed: () async
      {
       DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          
        Position position=await Geolocator. getCurrentPosition();

 
        setState(() {

        uname=mycontroller1.text;
        pass=mycontroller2.text;
         deviceid=androidInfo.id;
         device_name=androidInfo.model;

         geolocation gl=geolocation(position.latitude,position.longitude,position.accuracy);
         print('device id=$deviceid');
         print('device name=$device_name');


         logcheck ob=logcheck(uname, pass,deviceid,device_name,gl);
         jsonString=jsonEncode(ob.toJson());


         
          
        });
      },
    ),
    ),


Padding(
  padding: EdgeInsets.all(10),
child:Text('User name=$uname  password=$pass',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,backgroundColor: Colors.deepOrange ),)

),

         
         
Padding(
  padding: EdgeInsets.all(10),
child:Text('JSONString=$jsonString',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,backgroundColor: Color.fromARGB(255, 34, 237, 255) ),)

)
    ],
   ) ,

   appBar: AppBar(
    title: Text('object to JSON conversion'),
   ),
  ),
)

    );

  }


}

   class geolocation
{

  var lat,long,accuracy;
  geolocation(this.lat,this.long,this.accuracy);

}

class logcheck{

  var uname='';
   var pass='';
   var deviceid='';
   var devicename='';
    
     geolocation gl;

   logcheck(this.uname,this.pass,this.deviceid,this.devicename,this.gl);


       Map toJson()
   {
       return{
      
        'uname':uname,
        'pass':pass,
        'deviceid':deviceid,
        'devicename':devicename,

        'geolocation': {

            
          'latlong':"${gl.lat},${gl.long}",
          'Accuracy':"${gl.accuracy}"
       
        }

       };

   }
}