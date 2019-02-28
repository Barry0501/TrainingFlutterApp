import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutterapp/Listlogo.dart';
import 'package:flutterapp/Danhmucsanpham.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Widget _image = new Container(
      //width: 100,
      height: 200,

      child: new Carousel(
        boxFit: BoxFit.none,
        images: [
          AssetImage('image/anh1.jpg'),
          AssetImage('image/anh2.jpg'),
          AssetImage('image/anh3.jpg'),
        ],
        autoplay: true,
        // animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang Chủ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => {},
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Huy dz'),
              accountEmail: Text('phamquochuy24082301@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.blueAccent),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Trang chủ'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Thông tin'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Giỏ hàng'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Cài đặt'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Liên hệ'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // ảnh băng chuyền
          _image,
          // text
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Hãng điện thoại nổi tiếng",
              style: TextStyle(
                fontSize: 15,
                //fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // ảnh logo hãng điện thoại
          ListLogo(),
          //Danh mục sản phẩm
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Danh mục sản phẩm",
              style: TextStyle(
                fontSize: 16,
                //fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Container(
            height: 300,
            child: DanhMucSanPham(),
          )
        ],
      ),
    );
  }
}
