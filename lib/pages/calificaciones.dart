import 'package:flutter/material.dart';

class CalificacionesPage extends StatefulWidget {
  CalificacionesPage({Key key}) : super(key: key);

  @override
  _CalificacionesPageState createState() => _CalificacionesPageState();
}

class _CalificacionesPageState extends State<CalificacionesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calificaciones Page'),
      ),
    );
  }
}
