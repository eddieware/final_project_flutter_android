import 'package:final_project_flutter_android/pages/calificaciones.dart';
import 'package:final_project_flutter_android/pages/comentarios_page.dart';
import 'package:final_project_flutter_android/pages/profile_page.dart';
import 'package:final_project_flutter_android/pages/login_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/home': (BuildContext context) => LoginPage(),
    '/profile': (BuildContext context) => ProfilePage(),
    '/calif': (BuildContext context) => CalificacionesPage(),
    '/maps': (BuildContext context) => CalificacionesPage(),
    '/comments': (BuildContext context) => ComentariosPage(),
  };
}
