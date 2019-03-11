import 'package:flutter/material.dart';
import 'package:flutterapp/ProductDetails.dart';

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
      "decoration":
          "iPhone X được đã được Apple cho ra mắt ngày 12/9 vừa rồi đánh dấu chặng đường 10 năm lần đầu tiên iPhone ra đời. iPhone X mang trên mình thiết kế hoàn toàn mới với màn hình Super Retina viền cực mỏng và trang bị nhiều công nghệ hiện đại như nhận diện khuôn mặt Face ID, sạc pin nhanh và sạc không dây cùng khả năng chống nước bụi cao cấp.Thiết kế luôn mang tính đi đầu và cao cấp"
    },
    {
      "name": "IPXSMax",
      "title": "Điện thoại IP XS MAX 64 GB Chính Hãng",
      "image": "image/ipXSMax.jpg",
      "price": "34.000.000",
      "decoration":
          "Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.Màn hình OLED chất lượng cao rộng 6.5 inch đầu tiên của Apple Với công nghệ Super Retina kết hợp tấm nền OLED trên iPhone XS Max đem lại dải màu sắc cực kì sống động và sắc nét đến từng chi tiết."
    },
    {
      "name": "SSGalaxyNote9",
      "title": "Điện thoại sam sung galaxy note9 512GB",
      "image": "image/samsunggalaxynote9.png",
      "price": "28.490.000",
      "decoration": ""
    },
    {
      "name": "SSGalaxyA9",
      "title": "Điện thoại sam sung galaxy A9 512GB",
      "image": "image/samsunggalaxya9.jpg",
      "price": "12.490.000",
      "decoration": "",
    },
    {
      "name": "Xiaomi 8 Lite",
      "title": "Điện thoại Xiao Mi 8 Lite",
      "image": "image/xiaomi8lite.jpg",
      "price": "7.400.000",
      "decoration": "",
    },
    {
      "name": "Xiaomi Mi 8",
      "title": "Điện thoại XiaoMi Mi 8",
      "image": "image/xiaomimi8.jpg",
      "price": "12.990.000",
      "decoration": "",
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
          decoration: listdanhmuc[index]["decoration"],
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
  final decoration;
  SanPham({
    this.name,
    this.title,
    this.image,
    this.price,
    this.decoration,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new ProductDetails(
                      product_detail_name: name,
                      product_detail_price: price,
                      product_detail_image: image,
                      product_detail_decoration: decoration,
                    ))),
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
