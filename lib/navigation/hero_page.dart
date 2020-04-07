import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///使用Hero实现跨页面的过渡动画效果，类似Android原生的transition
///hero在两个页面中的tag要相同
///原理和Transition一致
class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hero"),
        ),
        body: GestureDetector(
          child: Hero(
            tag: "lake",
            child: Image.asset(
              "image/demo/lake.jpg",
            ),
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => _DetailPage()));
          },
        ));
  }
}

class _DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      child: Center(
        child: Hero(
          tag: "lake",
          child: Image.asset("image/demo/lake.jpg"),
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    ));
  }
}
