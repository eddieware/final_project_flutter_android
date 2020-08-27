import 'package:final_project_flutter_android/pages/login_page.dart';
import 'package:final_project_flutter_android/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Android Project App',
        home: LoginPage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          //primaryColor: Color.fromRGBO(42, 117, 188, 1),
          //accentColor: Color.fromRGBO(42, 117, 188, 1),
          //backgroundColor: Color.fromRGBO(28, 27, 27, 1),
        ),
        initialRoute: "login",
        routes: getApplicationRoutes());
  }
}
