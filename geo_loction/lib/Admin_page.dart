

import 'dart:async';
import 'dart:convert';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:geo_loction/addcheckbox.dart';
import 'package:geo_loction/main.dart';

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



  

  @override
  Widget build(BuildContext context) {
    return(
  MaterialApp(
      debugShowCheckedModeBanner: false,
   home: Scaffold(
  //  body:
   
  //  Column(
  //   children: [
  
        

  //   ],
  //  ) ,


     
      drawer: Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
    //   children: [
    //     DrawerHeader(
    //       decoration: BoxDecoration(
    //         color: Colors.deepOrange,

    //       ),
    //        child: Column(
    //         children: [
    //           Icon(
    //             Icons.account_circle_rounded, // Your desired icon
    //             size: 48, // Customize the icon size
    //             color: Colors.white, // Customize the icon color
    //           ),
    //         Text('Admin CRM',style: TextStyle(
    //   color: Colors.white, // Customize the text color.
    //   fontSize: 20, // Customize the font size.
    //   fontWeight: FontWeight.bold, // Customize the font weight.
    //   fontFamily: 'Roboto', // Customize the font family.
      
    // ),),
    //         ],
    //       ),
    //     ),
      children: [    
       SizedBox(
        height: 150, // Set your desired height here
        child: DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
          ),
           child: Column(
            children: [
              Icon(
                Icons.account_circle_rounded, // Your desired icon
                size: 48, // Customize the icon size
                color: Colors.white, // Customize the icon color
              ),
            Text('Admin CRM',style: TextStyle(
      color: Colors.white, // Customize the text color.
      fontSize: 20, // Customize the font size.
      fontWeight: FontWeight.bold, // Customize the font weight.
      fontFamily: 'Roboto', // Customize the font family.
      
    ),),
            ],
          ),
      
        
        ),

      ),

        ListTile(
          title: Text('Home'),
          leading: Icon(Icons.home),
          onTap: () {
            // Handle item 1 tap.
          },
        ),
        ListTile(
          title: Text('My Profile'),
          leading: Icon(Icons.person),
          onTap: () {
            // Handle item 2 tap.
          },
        ),
        // Add more items as needed.
        Divider(),

        
        ListTile(
          title: Text('Visit Check-In'),
          leading: Icon(Icons.arrow_forward_rounded),
          onTap: () {
            // Handle item 1 tap.
          },
        ),
        ListTile(
          title: Text('Add Customer'),
          leading: Icon(Icons.plus_one),
          onTap: () {
            // Handle item 2 tap.
          },
        ),

         Divider(),

        
        ListTile(
          title: Text('Create Order'),
          leading: Icon(Icons.arrow_forward),
          onTap: () {
            // Handle item 1 tap.
          },
        ),
        ListTile(
          title: Text('View Order'),
          leading: Icon(Icons.arrow_back),
          onTap: () {
            // Handle item 2 tap.
          },
        ),

         ListTile(
          title: Text('Offline Order'),
          leading: Icon(Icons.settings),
          onTap: () {
            // Handle item 2 tap.
          },
        ),

   Divider(),
         ListTile(
          title: Text('Log Off'),
          leading: Icon(Icons.person_off),
          onTap: () {
            // Handle item 2 tap.
          },
        ),

      ]
    ),
  ),


  
  // Other content goes here.



    appBar: AppBar(
          title: Text('Konark CRM',  style: TextStyle(
      color: Colors.white, // Customize the text color.
      fontSize: 20, // Customize the font size.
      fontWeight: FontWeight.bold, // Customize the font weight.
      fontFamily: 'Roboto', // Customize the font family.
    ),),
          backgroundColor:  Colors.deepOrange,
          
        ),
  ),
)

    );

  }


}
