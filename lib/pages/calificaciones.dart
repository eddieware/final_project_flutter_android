import 'package:cloud_firestore/cloud_firestore.dart';
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
        body: StreamBuilder(
            stream: Firestore.instance.collection('Notes').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading...Please Wait...');
              } else {
                return Column(
                  children: <Widget>[
                    Text(snapshot.data.documents[0]['materia']),
                    Text(snapshot.data.documents[0]['calif'].toString())
                  ],
                );
              }
            }));
  }
}
