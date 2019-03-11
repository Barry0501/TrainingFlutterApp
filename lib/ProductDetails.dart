import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_image;
  final product_detail_decoration;
  ProductDetails(
      {this.product_detail_name,
      this.product_detail_price,
      this.product_detail_image,
      this.product_detail_decoration});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProducDetails();
  }
}

class _ProducDetails extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi Tiết Sản Phẩm"),
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
      body: new ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_image),
              ),
              footer: Center(
                child: Container(
                    color: Colors.grey[200],
                    child: ListTile(
                      title: Padding(
                          padding: EdgeInsets.only(left: 50),
                          child: new Text("${widget.product_detail_name}")),
                      trailing: Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: new Text(
                          "${widget.product_detail_price}",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              //Size button
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Kích cỡ"),
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
              //Color button
               Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Màu"),
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
               Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("Số Lượng"),
                      ),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Text("Mua ngay"),
                  textColor: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart,color:Colors.blue),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.favorite_border,color:Colors.blue),
                onPressed: (){},
              )
          ],

          ),
          Divider(),
          ListTile(
            title: Text("Đặc điểm Nổi bật",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            subtitle: Text("\n"+"${widget.product_detail_decoration}"),
          )
        ],
      ),
    );
  }
}
