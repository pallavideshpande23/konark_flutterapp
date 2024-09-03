
import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image in Container'),
          backgroundColor: Colors.greenAccent[400],
        ),
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