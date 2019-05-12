import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:learn_flutter_provider/blocs/counter_bloc.dart';
import 'package:learn_flutter_provider/counter_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      builder: (_) => CounterBloc(),
      dispose: (_, CounterBloc bloc) => bloc.dispose(),
      child: MaterialApp(
        home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('Counter'),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.library_books),
                  title: Text('Todos'),
                  trailing: Icon(Icons.arrow_forward),
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
          ),
          appBar: AppBar(
            title: Text('Flutter Provider'),
          ),
          body: CounterManager(),
        ),
      ),
    );
  }
}
