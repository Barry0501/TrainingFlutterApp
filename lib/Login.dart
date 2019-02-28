import 'package:flutter/material.dart';
import 'package:flutterapp/Home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  var infoemail = "";
  var _size = 3.7;
  FocusNode id, pas;
  final myController = TextEditingController();
  @override
  void initState() {
    super.initState();
    myController.addListener(_stateCheckEmail);
    id = FocusNode();
    pas = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed
    id.dispose();
    pas.dispose();
    myController.dispose();
    super.dispose();
  }

  _stateCheckEmail() {
    if (myController.text.contains("@gmail.com")) {
      infoemail = "";
    } else
      infoemail = "Email không đúng định dạng";
  }

  _focusToPass() {
    FocusScope.of(context).requestFocus(pas);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / _size,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.cyan]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                  )),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new FlutterLogo(
                      size: 80,
                    ),
                  ),
                  new Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.0, top: 20.0),
                        child: new Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            // Tài khoản -------------------------
            new Container(
              
              margin: EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 40,
              child: TextField(
                focusNode: id,
                autofocus: true,
                decoration: InputDecoration(
                    //labelText: null,
                    errorText: infoemail,
                    hintText: 'Tài khoản đăng nhập',
                    icon: Icon(Icons.email)),
                controller: myController,

                //onSubmitted: _focusToPass(),
              ),
            ),
            //-----------MẬT KHẨU---------------------------
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 40,
              child: TextField(
                focusNode: pas,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  icon: Icon(Icons.vpn_key),
                ),
              ),
            ),
            //-----------Button login-----------------//
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red, Colors.cyan])),
              child: RaisedButton(
                onPressed: () {
                  
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => new Home()));
                },
                color: Colors.blue,
                splashColor: Colors.blue,
                child: Text("LOGIN",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
