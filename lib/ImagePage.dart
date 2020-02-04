import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainImage = Expanded(child: Image.asset('image/demo/pavlova.jpg'));

    final title = Container(
      padding: EdgeInsets.all(5),
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
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova.
''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25,
      ),
    );

    final ratingBar = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              ),
              Icon(
                Icons.star,
                color: Colors.black,
              )
            ],
          ),
          Text(
            "170 Reviews",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
              letterSpacing: 0.5,
              fontFamily: "Roboto",
            ),
          )
        ],
      ),
    );

    final leftContainer = Expanded(
        child: Column(
      children: <Widget>[
        title,
        subTitle,
        ratingBar,
        RaisedButton(
          child: Text("Go Back"),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    ));
    return Scaffold(
      appBar: AppBar(
        title: Text("图片浏览"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(5),
          height: 600,
          child: Card(
            child: Row(
              children: <Widget>[
                leftContainer,
                mainImage,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
