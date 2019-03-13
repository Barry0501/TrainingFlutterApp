import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  bool check = false;
  /*FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLogged = false;
  Future<FirebaseUser> _loginWithFaceBook() async {
    var facebookLogin = new FacebookLogin();
    var ressult = await facebookLogin
        .logInWithReadPermissions(['email', 'puclic_profile']);

    FacebookAccessToken myToken = ressult.accessToken;
    AuthCredential credential =
        FacebookAuthProvider.getCredential(accessToken: myToken.token);
    FirebaseUser firebaseUser =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }*/

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        elevation: 0.2,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //color: Colors.grey[400],
            child: Column(
              children: <Widget>[
                Container(
                    height: _height / 4,
                    child: Center(
                      child: Text(
                        "Đăng Nhập",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                          //color: Colors.grey,
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    //color: Colors.white,
                    height: _height / 6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.person),
                                labelText: 'Nhập Tài Khoản',
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  //disabledBorder: Boder,
                                  border: InputBorder.none,
                                  icon: Icon(Icons.vpn_key),
                                  labelText: 'Nhập Mật Khẩu',
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    color: check == true
                                        ? Colors.grey
                                        : Colors.blue,
                                    onPressed: () {
                                      print(check);
                                      setState(() {
                                        check = !check;
                                      });
                                    },
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: InkWell(
                    highlightColor: Colors.red,
                    splashColor: Colors.black,
                    onTap: () {},
                    child: Container(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        color: Color(0xFF18D191),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          highlightColor: Colors.red,
                          splashColor: Colors.black,
                          onTap: () {
                             //_loginWithFaceBook();
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "FaceBook",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.blueAccent[200],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: InkWell(
                          highlightColor: Colors.red,
                          splashColor: Colors.black,
                          onTap: () {},
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Google",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.redAccent[200],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _ChangeColorEyePassWord(Color _coloreye) {}
}
