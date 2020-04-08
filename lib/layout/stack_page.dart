import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这里是测试Stack Widget页面"),
      ),
      body: Center(
        child: Stack(
          //根据代码属性的注释，很容易明白Alignment中x,y的意义，而且，这里的对齐，是整个子Widget在父Widget中的位置，很好
          alignment: const Alignment(0.6, 0.6),
          children: <Widget>[
            CircleAvatar(
              //todo AssetImage和Image.asset的区别
              //暂且理解为一个是ImageProvider的实现类，但其实质上还是通过Image.asset方法来加载图片
              backgroundImage: AssetImage("image/demo/middle-pic-1.jpg"),
              radius: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
              child: Text(
                "Mila, Miya",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
