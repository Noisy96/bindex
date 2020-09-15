import 'package:flutter/material.dart';
import 'FABBottomAppBar.dart';
import 'search.dart';

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

  final Widget homeAppBar = AppBar(
    title: Text('Search'),
    backgroundColor: Color(0xBA2981).withOpacity(1),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Icon(Icons.info_outline),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    // This bool value detects whether the keyboard is open, and if so hides the FAB instead of raising it
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    Widget appBar;
    Widget body;

    switch (selectedTabIndex) {
      case 0:
        appBar = homeAppBar;
        body = Search();
        break;
      case 1:
        appBar = null;
        body = PlaceHolderBody(2);
        break;
      case 2:
        appBar = null;
        body = PlaceHolderBody(3);
        break;
      case 3:
        appBar = null;
        body = PlaceHolderBody(4);
        break;
    }

    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: showFab
            ? FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
                elevation: 2.0,
                tooltip: 'Add a book',
              )
            : null,
        bottomNavigationBar: FABBottomAppBar(
            selectedTabIndex: selectedTabIndex,
            setSelectedTabIndex: setSelectedTabIndex),
        appBar: appBar,
        body: body);
  }
}

// Just temporary place holder
class PlaceHolderBody extends StatelessWidget {
  final int index;

  PlaceHolderBody(this.index);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('TAB : $index', style: TextStyle(fontSize: 30.0)));
  }
}
