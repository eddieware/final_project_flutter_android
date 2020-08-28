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
      body: Column(
        children: <Widget>[
          Text('data'),
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
        ],
      ),
    );
  }
}
