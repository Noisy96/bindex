import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // State values
  String _searchTextFieldValue;
  double _distanceSliderValue = 10.0;
  var _operationsChipsList = ['Sell'];

  // State changers
  void setDistanceSliderValue(double value) {
    setState(() {
      _distanceSliderValue = value;
    });
  }

  void setOperationsChipsList(String option, bool addOrRemove) {
    /// addOrRemove values:
    /// * true = add
    /// * false = remove
    setState(() {
      addOrRemove
          ? _operationsChipsList.add(option)
          : _operationsChipsList.remove(option);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 15.0),
                color: Colors.white,
                child: TextField(
                  onChanged: (value) {
                    _searchTextFieldValue = value;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(0xBA2981).withOpacity(1),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title, Author, Owner...',
                    hintStyle: TextStyle(color: Colors.black26),
                    suffixIconConstraints:
                        BoxConstraints(maxHeight: 20.0, maxWidth: 20.0),
                    suffixIcon: Icon(Icons.search, color: Colors.black26),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'More Options',
                        style: TextStyle(color: Colors.black45, fontSize: 16.0),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Distance',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('10km',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12.0)),
                          Text('200 - ∞ km',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12.0))
                        ],
                      ),
                    ),
                    MySlider(setDistanceSliderValue),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Operations',
                        style: TextStyle(color: Colors.black38),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyChoiceChips(
                            'Sell',
                            _operationsChipsList.contains('Sell'),
                            setOperationsChipsList),
                        SizedBox(width: 5.0),
                        MyChoiceChips(
                            'Trade',
                            _operationsChipsList.contains('Trade'),
                            setOperationsChipsList),
                        SizedBox(width: 5.0),
                        MyChoiceChips(
                            'Lend',
                            _operationsChipsList.contains('Lend'),
                            setOperationsChipsList),
                        SizedBox(width: 5.0),
                        MyChoiceChips(
                            'Donate',
                            _operationsChipsList.contains('Donate'),
                            setOperationsChipsList),
                      ],
                    ),
                    SizedBox(height: 5.0)
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              RaisedButton(
                // This is experimental
                onPressed: () {
                  print(_searchTextFieldValue);
                  print(_distanceSliderValue);
                  print(_operationsChipsList);
                },
                color: Color(0xBA2981).withOpacity(1),
                textColor: Colors.white,
                child: Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MySlider extends StatefulWidget {
  final Function _changeValue;

  MySlider(this._changeValue);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      min: 10.0,
      max: 210.0,
      activeColor: Color(0xBA2981).withOpacity(1),
      divisions: 10,
      label: _value < 200.0 ? _value.round().toString() : '∞',
      onChanged: (newValue) {
        setState(() {
          _value = newValue;
        });
      },
      onChangeEnd: (newValue) {
        widget._changeValue(newValue);
      },
    );
  }
}

class MyChoiceChips extends StatelessWidget {
  final String _text;
  final bool _selected;
  final Function _changeStatus;

  MyChoiceChips(this._text, this._selected, this._changeStatus);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(_text),
      labelStyle: TextStyle(
          color: _selected ? Colors.white : Colors.black,
          fontSize: 12.0,
          fontWeight: _selected ? FontWeight.bold : null),
      selected: _selected,
      backgroundColor: Colors.black12,
      selectedColor: Color(0xBA2981).withOpacity(1),
      onSelected: (selected) {
        _changeStatus(_text, selected);
      },
    );
  }
}

// My Behavior class is used to hide the scroll glow effect
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
