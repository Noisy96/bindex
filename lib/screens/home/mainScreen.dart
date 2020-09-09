import 'package:flutter/material.dart';
import 'FABBottomAppBar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTabIndex = 0;

  void setSelectedTabIndex(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          elevation: 2.0,
          tooltip: 'Add a book',
        ),
        bottomNavigationBar: FABBottomAppBar(
            selectedTabIndex: selectedTabIndex,
            setSelectedTabIndex: setSelectedTabIndex),
        body: Center(
          // TODO : replace this little display of conditional rendering with real screens
          child: Text(
            'TAB: ${selectedTabIndex+1}',
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
        ),
        
        );
        
  }
}