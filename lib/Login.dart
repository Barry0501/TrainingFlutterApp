import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    Color _coloreye = Colors.grey;
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
                                suffixIcon: InkWell(
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: _coloreye,
                                  ),
                                  onTap: () {
                                    print("??");
                                    _ChangeColorEyePassWord(_coloreye);
                                  },
                                ),
                              ),
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
                    onTap: () {
                      _ChangeColorEyePassWord(_coloreye);
                    },
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
                          onTap: () {},
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

  void _ChangeColorEyePassWord(Color _coloreye) {
    setState(() {
      if (_coloreye == Colors.grey) {
        // print("mau xám");
        _coloreye = Colors.blue;
      } else {
        _coloreye = Colors.grey;
        //print("màu xanh");
      }
    });
  }
}
