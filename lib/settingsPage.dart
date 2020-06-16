import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('Settings Page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('Settings Page'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/subsetting'),
              child: Text('Click Settings'),
            ),
            Text(
                'Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n ')
          ],
        ),
      ]),
    );
  }
}
