import 'dart:math';

typedef int getNumber();

typedef bool callback();

class DartSyntax {
  DartSyntax();

  void testVariable() {
    //var 可以接收任何类型的变量，但一旦在赋值后类型确定下来，就不再可变
    var age = 33;
    age = 22;
//    age = "Lalaland"; //error

    //Object是Dart所有类型的根基类
    //dynamic和var一样可以声明变量
    //以上两种声明，在赋值后，依然可以改变类型
    dynamic dy;
    dy = 1;
    dy = false;
    dy = "Hello dynamic";
    Object obj;
    obj = null;
    obj = true;
    obj = "Hello Dart";
    print("dy.length = ${dy.length}");
//    print("obj.length = ${obj.length}"); //报错，意即是Object声明的变量，只能使用Object的方法，而dynamic比较自由，可以使用子类的方法
    //所以，在需要动态改变变量类型的场景，推荐使用dynamic？

    //所有类型都是对象，没有java和kotlin的基础类型，所以int的默认值也是null
    var type;
    print("type is ${type.runtimeType}");

    //常量 注意，这两个只是修饰符，不是类型
    //const 编译时常量
    //final 在第一次使用的时候初始化
    const String leijun = "Leijun";
    final String lesson = "How are you ? ";
    print("$lesson$leijun");

    print("testFunction = ${testFunction(49)}");

    print("getNumber = ${getNumber()}");

    print("validAge = ${validAge(21)}");

    sayWords("Hello world");

    testCallback(() => true);

    print("getFullStudentInfo = ${getFullStudentInfo("xiaoming", 12)}");
    print("getFullStudentInfo = ${getFullStudentInfo("daming", 12, 1)}");

    print(
        "getFullTeacherInfo = ${getFullTeacherInfo(name: "dayao", subject: "语文", age: 22)}");
    print(
        "getFullTeacherInfo = ${getFullTeacherInfo(name: "dayao", subject: "语文", age: 22)}");
  }

  //不指定返回类型，此时默认为dynamic，不是bool
  testFunction(int i) {
    return i > 50;
  }

  getNumber() {
    return Random.secure().nextInt(100);
  }

  //对于只含有一个表达式的函数，可以简写, return 也可以省略
  void testCallback(callback cb) => print("callback = $cb");

  //函数作为变量
  //todo 这里的提示的意思是？
  var validAge = (int) => int > 0 && int < 150;

  var sayWords = (str) => print(str);

  //可选的位置参数,使用中括号标定
  String getFullStudentInfo(String name, int age, [int gender]) {
    return "$name-$age-$gender";
  }

  //命名参数，或者说是具名参数，这个在kotlin中默认是自带的，在dart中要使用花括号
  String getFullTeacherInfo({String name, String subject, int age}) {
    return "$name-$subject-$age";
  }
//注意，命名参数和可选参数，都必须放到参数列表的最后
//就目前来看，命名参数在调用时，必须具名调用
}
