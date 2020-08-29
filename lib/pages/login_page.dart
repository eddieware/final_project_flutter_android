import 'package:final_project_flutter_android/providers/auth_provider.dart';
import 'package:final_project_flutter_android/providers/provider_usuario.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _txtPassCntrllr = new TextEditingController();
  TextEditingController _txtEmailCntrllr = new TextEditingController();

  double _altoScreen;
  double _anchoScreen;
  String _email;
  String _password;

  // GlobalKey<FormState> _formKey;
  AuthProvider _auth;

  @override
  Widget build(BuildContext context) {
    final superUsuarioInfo = Provider.of<UsuarioInfo>(context);

    _altoScreen = MediaQuery.of(context).size.height;
    _anchoScreen = MediaQuery.of(context).size.width;
    _txtEmailCntrllr.text = 'test@test.com';
    _txtPassCntrllr.text = 'password';

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Align(
          alignment: Alignment.center,
          child: ChangeNotifierProvider<AuthProvider>.value(
            value: AuthProvider.instance,
            //child: _loginPageUI(),
            child: Column(
              children: <Widget>[
                _loginPageUI(),
                Container(
                  height: _altoScreen * 0.06,
                  width: _anchoScreen * 0.8,
                  child: RaisedButton(
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      //para evitar el bug y esperar a que regrese antes de hacer el salto
                      await _auth.loginUserWithEmailAndPassword(
                          _txtEmailCntrllr.text, _txtPassCntrllr.text, () {});
                      //print('${_auth.user}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                      print('${_txtEmailCntrllr.text}');
                      print('${_txtPassCntrllr.text}');
                      if (_auth.user == null) {
                        print('Usuario no valido');
                        _mostrarAlert(context);
                      } else {
                        print('Login Succesfully');
                        superUsuarioInfo.userInfo = _txtEmailCntrllr.text;
                        Navigator.pushNamed(context, '/profile');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginPageUI() {
    //para usar el build context
    return Builder(builder: (BuildContext _context) {
      _auth = Provider.of<AuthProvider>(_context);

      return Container(
        //color: CupertinoColors.activeBlue,
        height: _altoScreen * 0.40,
        padding: EdgeInsets.symmetric(horizontal: _anchoScreen * 0.10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _headingWidget(),
            _inputForm(),
          ],
        ),
      );
    });
  }

  Widget _headingWidget() {
    return Container(
      //color: CupertinoColors.destructiveRed,
      height: _altoScreen * 0.16, //para difinir la altura del alto del Widget
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Welcome to EddiewareApp!",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          Text(
            "Please login to your account.",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w200, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _inputForm() {
    return Container(
      //color: CupertinoColors.activeBlue,

      height: _altoScreen * 0.16,
      child: Form(
        // key: _formKey,
        onChanged: () {
          // _formKey.currentState.save();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _emailTextField(),
            _passwordTextField(),
            //_loginButton(),

            //_passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _txtEmailCntrllr,
      autocorrect: false,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: 'test@test.com',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _txtPassCntrllr,
      autocorrect: false,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "password",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginButton() {
    // _txtEmailCntrllr.text = 'test@test.com';
    // _txtPassCntrllr.text = 'password';
    return _auth.status == AuthStatus.Authenticating
        ? Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Container(
            height: _altoScreen * 0.06,
            width: _anchoScreen,
            child: RaisedButton(
              child: Text(
                "LOGIN",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              onPressed: () async {
                //para evitar el bug y esperar a que regrese antes de hacer el salto
                await _auth.loginUserWithEmailAndPassword(
                    _txtEmailCntrllr.text, _txtPassCntrllr.text, () {});
                //print('${_auth.user}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                print('${_txtEmailCntrllr.text}');
                print('${_txtPassCntrllr.text}');
                if (_auth.user == null || _auth.status == AuthStatus.Error) {
                  print('Usuario no valido');
                  _mostrarAlert(context);
                } else {
                  print('Login Succesfully');
                  //superUsuarioInfo.userInfo = usrCntrollr.text;
                  Navigator.pushNamed(context, '/profile');
                }
              },
            ),
          );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        // requiere el context y se manda como argumento desde arriba
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Warning!'),
            content: Column(
              mainAxisSize: MainAxisSize
                  .min, //para hacer que la columna se autoadapte al contenido
              children: <Widget>[
                Text(
                  'El usuario o contraseña no son Validos',
                  style: TextStyle(fontSize: 20),
                ),
                FlutterLogo(size: 100)
                //Image.asset('')
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 15),
                  )),
            ],
          );
        });
  }
}
