import 'package:flutter/material.dart';

import 'home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => HomeScreen(),
    };
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
      title: 'Portal grancoffee',
    );
  }
}
