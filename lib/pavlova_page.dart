import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PavlovaPage extends StatelessWidget {
  //测试style的使用
  final defaultStyle = TextStyle(
    color: Colors.teal,
    fontStyle: FontStyle.italic,
    fontFamily: "Courier",
    decoration: TextDecoration.underline,
    decorationStyle: TextDecorationStyle.dotted,
  );

  @override
  Widget build(BuildContext context) {
    final rightImage = Expanded(
      child: Image.asset(
        'image/demo/pavlova.jpg',
        fit: BoxFit.cover,
      ),
    );

    final title = Container(
      padding: EdgeInsets.all(8),
      child: Text(
        "Strawberry Pavlova",
        style: TextStyle(
          fontWeight: FontWeight.w200,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

    final subTitle = Text(
      '''Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova.''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    final ratingBar = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.black54,
              ),
              Icon(
                Icons.star,
                color: Colors.black54,
              ),
              Icon(
                Icons.star,
                color: Colors.black54,
              ),
              Icon(
                Icons.star,
                color: Colors.black54,
              ),
              Icon(
                Icons.star,
                color: Colors.black54,
              )
            ],
          ),
          Expanded(
              child: Center(
            child: Text(
              "170 Reviews",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                letterSpacing: 0.5,
                fontFamily: "Roboto",
              ),
            ),
          ))
        ],
      ),
    );

    final leftContainer = Expanded(
        child: DefaultTextStyle(
      style: defaultStyle,
      child: Column(
        children: <Widget>[
          title,
          subTitle,
          ratingBar,
          RaisedButton(
            padding: EdgeInsets.all(8),
            child: Text("Go Back"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("图片浏览"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(12),
          height: 600,
          child: Card(
            elevation: 8.0,
            //通过shape来设定card的圆角尺寸
            //这个还是一如既往的Google标准，背景由shape提供，可以通过定义shape来改变背景
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Row(
              children: <Widget>[
                leftContainer,
                rightImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
