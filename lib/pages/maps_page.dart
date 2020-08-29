import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  MapsPage({Key key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(
      target: LatLng(20.64760073045063, -101.39031406491995), zoom: 17.4746);

  final List<Marker> markers = [];

  addMarker(cordinate) {
    // int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(
        position: LatLng(20.64760073045063, -101.39031406491995),
        markerId: MarkerId('Eduardos House'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
      // body: Column(
      //   children: <Widget>[
      //     _cardTipo1(),
      //     Container(
      //       height: 300,
      //       child: GoogleMap(
      //         initialCameraPosition: _initialPosition,
      //         mapType: MapType.normal,
      //         onMapCreated: (controller) {
      //           setState(() {
      //             //_controller = controller;
      //             addMarker(LatLng(20.64760073045063, -101.39031406491995));
      //           });
      //         },
      //         markers: markers.toSet(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      //Colum para poder ordenar mas   elementos dentro de esa tarjeta en manera vertical
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text(
              'Eddieware Developers',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            //subtitle: Text('Cel: 4622494244'),
          ),
          ListTile(
            leading: Icon(Icons.mail, color: Colors.blue),
            title: Text(
              'eddieware@info.com',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            //subtitle: Text('Cel: 4622494244'),
          ),
          ListTile(
            leading: Icon(Icons.phone_android, color: Colors.blue),
            title: Text(
              'Cel: 4622494244',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            //subtitle: Text('Cel: 4622494244'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final card = Container(
      height: 350,
      color: Colors.green,
      child: Column(children: <Widget>[
        Container(
          height: 300,
          child: GoogleMap(
            initialCameraPosition: _initialPosition,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                //_controller = controller;
                addMarker(LatLng(20.64760073045063, -101.39031406491995));
              });
            },
            markers: markers.toSet(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text('Eddieware Developers', style: TextStyle(fontSize: 22)),
        )
      ]),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]
          //color: Colors.red

          ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ), //sirve para cortar cualquier cosa fuera de ese contenedor
    );
  }
}
