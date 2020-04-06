import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewCountPage extends StatelessWidget {
  Widget buildGrid(BuildContext context) {
    //本次练习的关键点：
    //1.获取屏幕方向，使用MediaQuery
    //2.GridView两种指定Children的方式，其一是指定个数其二是直接指定子View的宽度extent
    final orientation = MediaQuery.of(context).orientation;
    final crossAxisCount = orientation == Orientation.portrait ? 2 : 3;
    final childAspectRatio = orientation == Orientation.portrait ? 1.0 : 1.3;
    return GridView.count(
      crossAxisCount: crossAxisCount,
      padding: EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: childAspectRatio,
      children: List.generate(
        30,
        (index) => GridTile(
          child: Image.asset(
            'image/demo/middle-pic-${index + 1}.jpg',
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black12,
            title: Text("Picture ${index + 1}"),
            subtitle: Text("Descriptiopn of ${index + 1}"),
            trailing: Icon(
              Icons.star_border,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("我是GridView Count方法测试页面"),
        ),
        body: buildGrid(context),
      );
}
