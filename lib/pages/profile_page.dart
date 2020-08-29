import 'dart:io';

import 'package:final_project_flutter_android/providers/provider_usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<UsuarioInfo>(context);
    File _image;

    return Scaffold(
      appBar: AppBar(title: Text('Welcome to your Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenido ${profileProvider.userInfo}',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Nombre',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Apellido1',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'Apellido2',
              style: TextStyle(fontSize: 22.0),
            ),
            Text(
              'CURP',
              style: TextStyle(fontSize: 22.0),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              //margin: EdgeInsets.symmetric(horizontal: 50),
              //'https://scontent-qro1-1.xx.fbcdn.net/v/t1.0-9/89505307_2923676754359456_8811794812756819968_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeEHFe2ZkGpXFG5PiF5o63P6I5X4tzZiv-Ujlfi3NmK_5QThRhVtgEESM0J7RGSTbMnGlBn2BMR32Wfn_9bloTg0&_nc_ohc=3AVkAPkE7ckAX98PpKs&_nc_ht=scontent-qro1-1.xx&oh=ba98746c45f3140a4da07437b9cfdea1&oe=5F545C7D')
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Container(
                //padding: EdgeInsets.all(8.0),
                width: 100,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent-qro1-1.xx.fbcdn.net/v/t1.0-9/89505307_2923676754359456_8811794812756819968_n.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeEHFe2ZkGpXFG5PiF5o63P6I5X4tzZiv-Ujlfi3NmK_5QThRhVtgEESM0J7RGSTbMnGlBn2BMR32Wfn_9bloTg0&_nc_ohc=3AVkAPkE7ckAX98PpKs&_nc_ht=scontent-qro1-1.xx&oh=ba98746c45f3140a4da07437b9cfdea1&oe=5F545C7D'),

                  //radius: 30.0,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Calificaciones',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/calif');
              },
            ),
            ListTile(
              title: Text(
                'Mapas',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/maps');
              },
            ),
            ListTile(
              title: Text(
                'Comentarios',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/comments');
              },
            ),
          ],
        ),
      ),
    );
  }
}
