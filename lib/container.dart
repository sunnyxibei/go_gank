import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  Widget buildContainer() => Container(
        decoration: BoxDecoration(color: Colors.black12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                _buildImage("lake"),
                _buildImage("lake"),
              ],
            ),
            Row(
              children: [
                _buildImage("lake"),
                _buildImage("lake"),
              ],
            ),
          ],
        ),
      );

  Widget _buildImage(String name) {
    //Expanded 可以缩放大小的Widget
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        margin: EdgeInsets.all(4),
        child: Image.asset(
          "image/demo/$name.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Demo"),
      ),
      body: Center(
        child: buildContainer(),
      ),
    );
  }
}
