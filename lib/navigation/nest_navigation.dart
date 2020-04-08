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

  ///WillPopScope用于处理返回事件的响应，类似于Android的onBackPressed
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
          //这里可以hook一下，挂一个勾子，如果token没有的话，直接跳转登陆页面
          //当然这样做也不太好，最好的是我们在Focus Course中的实践，在接收到token过期的事件后才处理事件，满足less is best
          //简单且够用，这点特别重要，简单且够用
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
              child: Text("下一步"),
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
