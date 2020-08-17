import 'package:flutter/material.dart';
import 'package:stock_taking_application/pages/userpage.dart';
import 'package:stock_taking_application/pages/adminpage.dart';
import 'package:stock_taking_application/pages/loginpage.dart';
void main() {
  runApp(MyApp());
}
String username='';
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: MainPage(),
      routes: <String,WidgetBuilder>{
        '/pages/adminpage': (BuildContext context)=> AdminPage(username: username,),
        '/pages/userpage': (BuildContext context)=> UserPage(),
        '/pages/loginpage': (BuildContext context)=> MainPage(),
      },
    );
  }
}