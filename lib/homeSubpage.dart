import 'package:flutter/material.dart';

class HomeSubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Home Sub Page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Sub Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/subsubhome'),
                child: Text('Go Sub Sub'),
              ),
              Text(
                  'Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n '),
            ],
          ),
        ),
      ),
    );
  }
}
