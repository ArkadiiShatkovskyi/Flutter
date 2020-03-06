import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  TextEditingController _nameConroller = TextEditingController();
  bool isCoffee = false;
  bool isRestaurant = false;
  bool isShop = false;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add expenses"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: media.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(
              left: media.width * 0.05,
              right: media.width * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => saveData,
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: EdgeInsets.only(
          left: media.width * .1,
          right: media.width * .1,
          top: media.height * .05,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Name"),
                SizedBox(
                  height: media.height * 0.15,
                  width: media.width * 0.35,
                  child: TextFormField(
                    controller: _nameConroller,
                    maxLines: 1,
                    maxLength: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: media.width * .8,
              height: media.height * .1,
              child: SwitchListTile(
                title: const Text("Coffee"),
                value: isCoffee,
                onChanged: (bool v) {
                  setState(() {
                    this.isCoffee = v;
                  });
                },
                secondary: const Icon(
                  Icons.fastfood,
                ),
              ),
            ),
            SizedBox(
              width: media.width * .8,
              height: media.height * .1,
              child: SwitchListTile(
                title: const Text("Restaurant"),
                value: isRestaurant,
                onChanged: (bool v) {
                  setState(() {
                    this.isRestaurant = v;
                  });
                },
                secondary: const Icon(
                  Icons.fastfood,
                ),
              ),
            ),
            SizedBox(
              width: media.width * .8,
              height: media.height * .1,
              child: SwitchListTile(
                title: const Text("Shop"),
                value: isShop,
                onChanged: (bool v) {
                  setState(() {
                    this.isShop = v;
                  });
                },
                secondary: const Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveData(){

  }
}
