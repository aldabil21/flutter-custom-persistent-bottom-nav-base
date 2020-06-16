import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSubSubPage extends StatefulWidget {
  const HomeSubSubPage({Key key}) : super(key: key);

  @override
  _HomeSubPageState createState() => _HomeSubPageState();
}

class _HomeSubPageState extends State<HomeSubSubPage> {
  String _text;

  @override
  void initState() {
    _text = 'Click me';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Home Sub Sub Page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sub Sub Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => setState(() => _text = 'Clicked'),
          child: Text(_text),
        ),
      ),
    );
  }
}
