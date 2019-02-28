import 'package:flutter/material.dart';

class MangHinh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.grey[200],
        child: new ListView(
          children: <Widget>[
            new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 10.0),
                  child: new Row(
                    children: <Widget>[
                      new Column(
                        //alignment: Alignment.bottomLeft,
                        // mainAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Icon(Icons.person, size: 50),
                        ],
                      ),
                      new Column(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 30.0),
                              child: OutlineButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  //disabledBorderColor: Colors.blue,
                                  borderSide: BorderSide(color: Colors.blue),
                                  highlightedBorderColor: Colors.blue,
                                  child: new Text(
                                    "Đăng Nhập",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))))
                        ],
                      )
                    ],
                  ),
                )),
            new Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                color: Colors.white,
                child: new ListView(
                  //scrollDirection: Axis.vertical,
                  children: <Widget>[
                    InkWell(
                      highlightColor: Colors.green,
                      splashColor: Colors.blue,
                      onTap: () {},
                      child: ListTile(
                        title: Text(
                          "Chung",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.green,
                      splashColor: Colors.blue,
                      onTap: () {},
                      child: ListTile(
                        title: Text("Lịch sử tìm kiếm"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.green,
                      splashColor: Colors.blue,
                      child: ListTile(
                        title: Text("Thông tin về TaZapa"),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 0,
        onTap: null,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Trang chủ"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Sản phẩm"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.shutter_speed),
            title: Text("Dịch vụ"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.local_car_wash),
            title: Text("Chi nhánh"),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Tài khoản"),
          ),
        ],
      ),
    );
  }
}
