import 'package:flutter/material.dart';

class SettingsSubPage extends StatefulWidget {
  const SettingsSubPage({Key key}) : super(key: key);

  @override
  _SettingsSubPageState createState() => _SettingsSubPageState();
}

class _SettingsSubPageState extends State<SettingsSubPage> {
  String _text;
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    _text = 'Click me';
    super.initState();
  }

  void _testChanging() {
    setState(() => _text = 'Clicked');
    print(_formKey.currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Sub Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              _testChanging();
            },
            child: Text(_text),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter Text'),
                  onChanged: (newValue) => print(newValue),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
