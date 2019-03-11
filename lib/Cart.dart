import 'package:flutter/material.dart';
import 'package:flutterapp/CartProduct.dart';
class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Cart();
  }
}

class _Cart extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ hàng"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: CartProduct(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text("Tổng Tiền"),
              subtitle: Text("21304040 VND"),
            ),
          ),
          Expanded(
            child: new MaterialButton(
              onPressed: (){},
              child: Text("Thanh toán ngay",style: TextStyle(
                color: Colors.white,
              ),),
              color: Colors.blue,
            ),
          )
        ],),
      ),
    );
  }
}
