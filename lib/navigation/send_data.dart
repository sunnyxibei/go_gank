import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Todo {
  final String title;
  final String description;
  final String author;

  _Todo({this.title, this.description, this.author});
}

class OriginalPage extends StatelessWidget {
  final todoList = List.generate(
      30,
      (index) => _Todo(
          title: "这是第$index个todo的标题",
          description: "这是第$index个todo的副标题",
          author: "这是第$index个todo的作者"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            var todo = todoList[index];
            return ListTile(
              title: Text(todo.title),
              subtitle: Text(todo.description),
              onTap: () async {
                var result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DestinationPage(
                      todo: todo,
                    ),
                  ),
                );
                Scaffold.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.teal,
                  action: SnackBarAction(
                    label: "$result",
                    onPressed: () {},
                  ),
                  content: Text("$result"),
                ));
              },
            );
          }),
    );
  }
}

class DestinationPage extends StatelessWidget {
  final _Todo todo;

  DestinationPage({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.author),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.teal,
              child: Text("Yes!"),
              onPressed: () => Navigator.of(context).pop("Yes!"),
            ),
            FlatButton(
              color: Colors.teal,
              child: Text("No!"),
              onPressed: () => Navigator.of(context).pop("No!"),
            )
          ],
        ),
      ),
    );
  }
}
