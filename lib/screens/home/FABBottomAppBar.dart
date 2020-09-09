import 'package:flutter/material.dart';

class FABBottomAppBarItem extends StatelessWidget {
  final IconData iconWidget;
  final String text;
  final int index;
  final int selectedIndex;
  final Function change;

  FABBottomAppBarItem(
      {this.iconWidget,
      this.text,
      this.index,
      this.selectedIndex,
      this.change});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(35.0),
        onTap: () {
          change(index);
        },
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconWidget,
                  color:
                      index == selectedIndex ? Colors.black : Colors.black38),
              Text(text,
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: index == selectedIndex
                          ? Colors.black
                          : Colors.black38))
            ],
          ),
        ),
      ),
    );
  }
}

class FABBottomAppBar extends StatefulWidget {
  final int selectedTabIndex;
  final Function setSelectedTabIndex;

  FABBottomAppBar({this.selectedTabIndex, this.setSelectedTabIndex});

  @override
  _FABBottomAppBarState createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      // shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FABBottomAppBarItem(
              iconWidget: Icons.search,
              text: 'Search',
              index: 0,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          FABBottomAppBarItem(
              iconWidget: Icons.map,
              text: 'Explore',
              index: 1,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          SizedBox(width: 40.0),
          FABBottomAppBarItem(
              iconWidget: Icons.question_answer,
              text: 'Messages',
              index: 2,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
          FABBottomAppBarItem(
              iconWidget: Icons.person_outline,
              text: 'Profile',
              index: 3,
              selectedIndex: widget.selectedTabIndex,
              change: widget.setSelectedTabIndex),
        ],
      ),
    );
  }
}
