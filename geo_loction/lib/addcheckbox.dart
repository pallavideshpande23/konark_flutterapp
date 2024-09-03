

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

bool? flag1=false;

  

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
  (padding: EdgeInsets.all(20),
    child: TextField(
    controller: mycontroller1,
    decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder()
),

  ),
  ),
   

   Padding
  (padding: EdgeInsets.all(20),
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
                padding: EdgeInsets.all(10),

                 child: InkWell(
            child: Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
           // onTap: () => launch('https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                onTap: () =>print(' terms and condition linklabel is clicked'),

          ),
              ),

   

          Padding
  (padding: EdgeInsets.all(10),
       
    child: ListTile(
           //titleAlignment: ListTileTitleAlignment.center,
           
         title: Text('I agree'),
         leading: Checkbox(
          value: flag1, 
     
          onChanged: (value){
     setState(() {
         flag1=value;
});

          }
          ),

    )
  ),
   
    
       

   Padding(
    
    padding:EdgeInsets.all(10),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
      child: Text("LOGIN"),
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

         geolocation gl=geolocation(position.latitude,position.longitude,position.accuracy.ceil());
         print('device id=$deviceid');
         print('device name=$device_name');

         
            if(flag1==true){

         
         logcheck ob=logcheck(uname, pass,deviceid,device_name,gl);
         jsonString=jsonEncode(ob.toJson());
           
              }
              else{

                print('please check i agree ');
              }
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

         
         
Padding(
  padding: EdgeInsets.all(10),
child:Text('JSONString=$jsonString',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,backgroundColor: Color.fromARGB(255, 34, 237, 255) ),)

)
    ],
   ) ,

   appBar: AppBar(
    //title: Text('object to JSON conversion'),
    backgroundColor: Colors.deepOrange,
  ),
)
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