import 'package:flutter/material.dart';
import 'package:go_gank/BrowserPage.dart';

import 'ImagePage.dart';

bool topLevel = true;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Go Gank',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //首页路由
        home: MyHomePage(title: 'gank.io'),
      );
}

///title 可以理解为Java｜Kotlin中的构造方法的参数
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  ///简单地说，setState方法的作用是，属性改变时，可以回调build方法。
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Center 一个布局控件，有唯一的一个子控件，且居中对齐
      body: Center(
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline,
            ),
            FlatButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BrowserPage())),
                textColor: Colors.deepOrangeAccent,
                child: Text("Trigger Browser Page ! $_counter")),
            RaisedButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => ImagePage())),
                textColor: Colors.blue[200],
                child: Text("打开图片浏览页面")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _counter++),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
