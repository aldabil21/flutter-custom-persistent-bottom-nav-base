import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/bottomNavController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  // implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('Home Page');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  final bottomNav =
                      Provider.of<BottomNavController>(context, listen: false);
                  bottomNav.setShowable(false);
                  return Navigator.of(context).pushNamed('/subhome').then(
                    (value) {
                      bottomNav.setShowable(true);
                    },
                  );
                },
                child: Text('Open Sub-Page'),
              ),
              Text(
                  'Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n Line \n ')
            ],
          ),
        ),
      ),
    );
  }
}
