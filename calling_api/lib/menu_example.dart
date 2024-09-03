
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image in Container'),
          backgroundColor: Colors.greenAccent[400],
        ),

         
          drawer: Drawer(
          
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),

           child: Column(
            children: [
              Icon(
                Icons.account_circle, // Your desired icon
                size: 48, // Customize the icon size
                color: Colors.white, // Customize the icon color
              ),
              Text('User Name'), // Add user name or other text
            ],
          ),
        ),
         // child: Text('Drawer Header'),
      

        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Handle item 1 tap.
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Handle item 2 tap.
          },
        ),

           Divider(),
          
           
           ListTile(
          
          title: Text('Item 2'),
          onTap: () {
            // Handle item 2 tap.
          },
        ),
           Divider(),
              Card(
                
              child:
              Column(
               
                
                children: [
                   
                  Text(
                        'This is a label',
                         style: TextStyle(
                         //fontSize: 20,
                         //fontWeight: FontWeight.bold,
                         color: Colors.blue,
                        // Alignment: TextAlign.left,
                         ),
                         ),

                ListTile(
                leading: Icon(Icons.person),
                title: Text('John Doe'),
                subtitle: Text('Software Engineer'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle tap
                },
              ),
           
              
                ListTile(
                leading: Icon(Icons.person),
                title: Text('abcd'),
                subtitle: Text('manager'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle tap
                },
              ),
           
                
                ],
              )
               
              
              

            ),

             // Divider(),

             
        // Add more items as needed.
      ],
    ),
  ),
  // Other content goes here.



        body: Center(
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/sun_image.jpeg'),
              
            
               fit: BoxFit.cover,
              ),
              border: Border.all(
                color: Colors.green,
                width: 8,
              ),
              borderRadius: BorderRadius.circular(15),
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
       
        
      ),
    ),
  );
}