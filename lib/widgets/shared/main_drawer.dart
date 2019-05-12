import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Counter'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushReplacementNamed(context, '/'),
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text('Todos'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushReplacementNamed(context, '/todos'),
          ),
          ListTile(
            leading: Icon(Icons.rss_feed),
            title: Text('News'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Maps'),
            trailing: Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}
