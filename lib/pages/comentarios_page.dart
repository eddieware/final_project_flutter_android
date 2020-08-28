import 'package:flutter/material.dart';

class ComentariosPage extends StatefulWidget {
  ComentariosPage({Key key}) : super(key: key);

  @override
  _ComentariosPageState createState() => _ComentariosPageState();
}

class _ComentariosPageState extends State<ComentariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comentarios Page'),
      ),
    );
  }
}
