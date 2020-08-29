import 'package:final_project_flutter_android/pages/calificaciones.dart';
import 'package:final_project_flutter_android/pages/login_page.dart';
import 'package:final_project_flutter_android/pages/maps_page.dart';
import 'package:final_project_flutter_android/providers/provider_usuario.dart';
import 'package:final_project_flutter_android/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AsyncSnapshot snapshot;
    return ChangeNotifierProvider(
      child: MaterialApp(
        title: 'Android Project App',
        // home: LoginPage(),
        home: CalifPage(CalifPage.withSampleData(snapshot).seriesList),
        theme: ThemeData(
          brightness: Brightness.dark,
          //primaryColor: Color.fromRGBO(42, 117, 188, 1),
          //accentColor: Color.fromRGBO(42, 117, 188, 1),
          //backgroundColor: Color.fromRGBO(28, 27, 27, 1),
        ),
        initialRoute: "login",
        routes: getApplicationRoutes(),
      ),
      create: (context) => UsuarioInfo(),
    );
  }
}
