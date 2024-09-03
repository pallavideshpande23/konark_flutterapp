
import 'package:flutter/material.dart';


void main() {
  runApp(
   MyWidget()
  );
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

   home: Scaffold(
   body:Column(
    children: [
 
    Builder(builder: (context)
    {
      return(
       ElevatedButton(
  child: Text("Show Dialog"),
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return 
        AlertDialog(
  title: Text("Confirmation"),
  content: Text("Are you sure you want to delete?"),
  actions: [
    TextButton(
      onPressed: () {
        Navigator.of(context).pop(); // Close the dialog.
      },
      child: Text("Cancel"),
    ),
    ElevatedButton(
      onPressed: () {
        // Perform the delete operation.
        Navigator.of(context).pop(); // Close the dialog.
      },
      child: Text("Delete"),
    ),
  ],
);

      },
    );

    
  },
)
      );
    }
    
    )
      
  

    ],
   ) ,

   appBar: AppBar(
    title: Text('alert dialogue box'),
   ),
  ),
)

    );

  }


}

  