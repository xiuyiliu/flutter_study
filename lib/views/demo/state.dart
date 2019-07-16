import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();


  TextEditingController _unameController;
  TextEditingController _pwdController;

  @override
  void initState() {
    super.initState();
    _unameController = new TextEditingController();
    _pwdController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('state explore'),
      ),
      body: Column(
        children: <Widget>[
          /// 通过key去访问ScaffoldState
          InkWell(
            child: Container(
              constraints: BoxConstraints.expand(
                  height: 50.0
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Center(
                child: Text('Show SnackBar'),
              ),
            ),
            onTap: () {
              scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text('this is this SnackBar...'),
                )
              );
            },
          ),
          /// 通过key去访问FormState
          Form(
            key: formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)
                  ),
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "用户名不能为空";
                  }
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
                ),
                /// 通过key去访问FormState
                InkWell(
                  child: Container(
                    constraints: BoxConstraints.expand(
                        height: 50.0
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(5.0)
                    ),
                    child: Center(
                      child: Text('登录'),
                    ),
                  ),
                  onTap: () {
                    /// 此处不可以通过context去获取FormState,因为此时的context对应的widget是StatePage;
                    if (formKey.currentState.validate()) {
                      print('验证通过提交数据');
                      print(context.widget);
                    }
                  },
                ),
                /// 通过context去访问FormState
                Builder(
                  builder: (context) {
                    return InkWell(
                      child: Container(
                        constraints: BoxConstraints.expand(
                            height: 50.0
                        ),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Center(
                          child: Text('登录'),
                        ),
                      ),
                      onTap: () {
                        if (Form.of(context).validate()) {
                          print('验证通过提交数据');
                          print(context.widget);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Scaffold, Form 是StatefulWidget, 当需要父Widget直接操作子Widget的state时候，可以使用widget的唯一标识key来访问
 * 从state对象中，可以获取widget,context,mounted,及生命周期函数，特定的statefulWidget还有别的属性，如Scaffold的state
 * state 中创建的属性一般都是私有属性 _, 当需要暴露某些属性给外部时，使用getter，
 */
