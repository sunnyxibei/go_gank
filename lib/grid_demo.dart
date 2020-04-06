import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridExtentWidget extends StatelessWidget {
  Widget buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(
            30,
            (index) => Container(
                  child: Image.asset(
                    "image/demo/middle-pic-${index + 1}.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我是GridView测试页面")),
      body: buildGrid(),
    );
  }
}
