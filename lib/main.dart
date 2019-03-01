import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _isobscuretext = true;
  Color _coloreye = Colors.grey;
  _Buildtitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Login",
          style: TextStyle(
            fontSize: 42.0,
          )),
    );
  }

  _BuildTitleLine() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 40.0,
          height: 1.8,
          color: Colors.black,
        ),
      ),
    );
  }

  _BuildEmail() {
    return TextFormField(
      onSaved: (str) {
        _email = str;
      },
      validator: (str) {
        if (str.isEmpty || !str.contains("@gmail.com")) {
          return 'Please enter an email';
        }
      },
      autovalidate: true,
      decoration: InputDecoration(labelText: "Email Address"),
    );
  }

  _BuildPassWord() {
    return TextFormField(
      onSaved: (str) {
        _email = str;
      },
      validator: (str) {
        if (str.isEmpty || str.length <= 5) {
          return 'Please enter an password';
        }
      },
      autovalidate: true,
      //onFieldSubmitted: ,
      decoration: InputDecoration(
        labelText: "Password",
        suffixIcon: IconButton(
          onPressed: () {
            if (_isobscuretext == true) {
              setState(() {
                _coloreye = Colors.blue;
                _isobscuretext = false;
              });
            } else {
              setState(() {
                _coloreye = Colors.grey;
                _isobscuretext = true;
              });
            }
          },
          icon: Icon(Icons.remove_red_eye),
          color: _coloreye,
        ),
      ),
      obscureText: _isobscuretext,
    );
  }

  _BuildForgotPassWord() {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, right: 5.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            child: Text("Forgot Password?"),
            onTap: () {},
          ),
        ));
  }

  _BuildButtonLogin() {
    return Align(
      child: SizedBox(
        height: 50.0,
        width: 250.0,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
            }
          },
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22.0, 0.0, 22.0, 22.0),
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight,
          ),
          _Buildtitle(),
          _BuildTitleLine(),
          SizedBox(
            height: 70,
          ),
          _BuildEmail(),
          _BuildPassWord(),
          _BuildForgotPassWord(),
          SizedBox(
            height: 50,
          ),
          _BuildButtonLogin(),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text("or login with"),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  width: 80.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: new BorderRadius.circular(50.0)),
                  //color: Colors.red,
                  child: Icon(
                    GroovinMaterialIcons.google,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              InkWell(
                child: Container(
                  width: 80.0,
                  height: 30.0,
                  color: Colors.blueAccent,
                  child: Icon(
                    GroovinMaterialIcons.facebook,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
