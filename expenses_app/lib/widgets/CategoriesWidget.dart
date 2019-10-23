import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  Map _selectedCategories = {
    1: {'name': 'Shop', 'selected': false},
    2: {'name': 'Delivery', 'selected': false},
    3: {'name': 'Coffe', 'selected': false},
  };

  static const _selectedColor = Colors.amberAccent;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: <Widget>[
          const Center(
            child: Text(
              "Categories",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
          ChoiceChip(
            selected: _selectedCategories[1]['selected'],
            label: Text(
              _selectedCategories[1]['name'],
            ),
            onSelected: (bool selected) {
              var temp = selected == true ? false : true;
              setState(() {
                _selectedCategories[1]['selected'] = temp == true ? false : true;
              });
            },
            backgroundColor: Colors.black12,
            selectedColor: _selectedColor,
          ),
          ChoiceChip(
            selected: _selectedCategories[2]['selected'],
            label: Text(
              _selectedCategories[2]['name'],
            ),
            onSelected: (bool selected) {
              var temp = selected == true ? false : true;
              setState(() {
                _selectedCategories[2]['selected'] = temp == true ? false : true;
              });
            },
            backgroundColor: Colors.black12,
            selectedColor: _selectedColor,
          ),
          ChoiceChip(
            selected: _selectedCategories[3]['selected'],
            label: Text(
              _selectedCategories[3]['name'],
            ),
            onSelected: (bool selected) {
              var temp = selected == true ? false : true;
              setState(() {
                _selectedCategories[3]['selected'] = temp == true ? false : true;
              });
            },
            backgroundColor: Colors.black12,
            selectedColor: _selectedColor,
          ),
        ],
      ),
    );
  }
}
