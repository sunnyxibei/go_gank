class AsyncTest {
  // dart 的异步方式，和JavaScript有点类似
  void delaySay() {
    //异常抛出时，then不再被回调，而是catch被回调
    //从本质上讲，异步的思想是一致的，无论时JavaScript，Java，Kotlin，Dart，都是一致的
    //只是语言和API不同罢了
    Future.delayed(
      new Duration(seconds: 5),
      () => throw AssertionError("Nan"),
    ).then((data) {
      print(data);
    }).catchError((error) {
      print(error);
    }).whenComplete(() {
      print("future complete");
    });
  }
}
