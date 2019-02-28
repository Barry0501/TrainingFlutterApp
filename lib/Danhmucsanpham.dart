import 'package:flutter/material.dart';

class DanhMucSanPham extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DanhMucSanPham();
  }
}

class _DanhMucSanPham extends State<DanhMucSanPham> {
  var listdanhmuc = [
    {
      "name": "IPX",
      "title": "Điện thoại IP X 64 GB Chính Hãng",
      "image": "image/ipX.jpg",
      "price": "23.000.000",
    },
    {
      "name": "IPXSMax",
      "title": "Điện thoại IP XS MAX 64 GB Chính Hãng",
      "image": "image/ipXSMax.jpg",
      "price": "34.000.000",
    },
    {
      "name": "SSGalaxyNote9",
      "title": "Điện thoại sam sung galaxy note9 512GB",
      "image": "image/samsunggalaxynote9.png",
      "price": "28.490.000",
    },
    {
      "name": "SSGalaxyA9",
      "title": "Điện thoại sam sung galaxy A9 512GB",
      "image": "image/samsunggalaxya9.jpg",
      "price": "12.490.000",
    },
    {
      "name": "Xiaomi 8 Lite",
      "title": "Điện thoại Xiao Mi 8 Lite",
      "image": "image/xiaomi8lite.jpg",
      "price": "7.400.000",
    },
    {
      "name": "Xiaomi Mi 8",
      "title": "Điện thoại XiaoMi Mi 8",
      "image": "image/xiaomimi8.jpg",
      "price": "12.990.000",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listdanhmuc.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //mainAxisSpacing: 2
      ),
      itemBuilder: (BuildContext context, int index) {
        return SanPham(
          name: listdanhmuc[index]["name"],
          title: listdanhmuc[index]["title"],
          image: listdanhmuc[index]["image"],
          price: listdanhmuc[index]["price"],
        );
      },
    );
  }
}

class SanPham extends StatelessWidget {
  final name;
  final title;
  final image;
  final price;
  SanPham({
    this.name,
    this.title,
    this.image,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.red,
      child: Hero(
        tag: name,
        child: Material(
          //color: Colors.red,
          //shadowColor: Colors.red,
          child: InkWell(
            onTap: () {},
            child: GridTile(
              footer: Container(
                color: Colors.white30,
                child: ListTile(
                  leading: Text(
                    name + "\n" + price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //subtitle: Text(price),
                ),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
