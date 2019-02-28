import 'package:flutter/material.dart';

class ListLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Logo(
            location: 'image/logoapple.jpg',
          ),
          Logo(
            location: 'image/logosamsung.jpg',
          ),
          Logo(
            location: 'image/logohuawei.png',
          ),
          Logo(
            location: 'image/logovsmart.png',
          ),
          Logo(
            location: 'image/logoxiaomi.png',
          ),
          Logo(
            location: 'image/logooppo.jpg',
          )
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  final String location;

  Logo({
    this.location,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100.0,
        //height: 50,
        child: Image(
          image: AssetImage(location),
          width: 100,
          //height: 100,
        ),
      ),
    );
  }
}
