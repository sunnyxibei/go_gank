import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("账号模块"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("点击登陆"),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => LoginPage())),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> _onWillPop() async {
    final maybePop = await _navigatorKey.currentState.maybePop();
    return Future.value(!maybePop);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Navigator(
        key: _navigatorKey,
        initialRoute: "account/username",
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case 'account/username':
              builder = (context) => UsernamePage();
              break;
            case 'account/password':
              builder = (context) => PasswordPage();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Username"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("请输入用户名"),
            FlatButton(
                child: Text("Back"),
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop()),
            FlatButton(
              child: Text("Back"),
              onPressed: () =>
                  Navigator.of(context).pushNamed('account/password'),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PasswordPage"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("请输入密码"),
            FlatButton(
              child: Text("返回"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("完成"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            )
          ],
        ),
      ),
    );
  }
}
