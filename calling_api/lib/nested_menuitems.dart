import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nested Drawer Items')),
      drawer: buildGroupedDrawer(context),
      body: Center(child: Text('Main Content')),
    );
  }

  Widget buildGroupedDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              'Grouped Items Navigation Drawer',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          buildExpansionTile('Group 1', ['Element 1.1', 'Element 1.2', 'Element 1.3']),
          buildExpansionTile('Group 2', ['Element 2.1', 'Element 2.2', 'Element 2.3']),
          // Add more groups as needed
        ],
      ),
    );
  }

  Widget buildExpansionTile(String title, List<String> items) {
    return ExpansionTile(
      title: Text(title),
      children: items.map((item) {
        return ListTile(
          title: Text(item),
          onTap: () {
           // Navigator.pop(); // Close the drawer
            // Handle item tap if needed
          },
        );
      }).toList(),
    );
  }
}
