import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/ExpensesProvider.dart';

enum Category {
  none,
  coffee,
  restaurant,
  shop,
}

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  TextEditingController _nameTextFieldConroller = TextEditingController();
  TextEditingController _amountTextFieldController = TextEditingController();
  bool isCoffee = false;
  bool isRestaurant = false;
  bool isShop = false;
  Category _category = Category.none;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final expensesDB = Provider.of<ExpensesProvider>(context);
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
        onPressed: () => _saveData(expensesDB),
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Padding(
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
                  Text("Title"),
                  SizedBox(
                    height: media.height * 0.1,
                    width: media.width * 0.35,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _nameTextFieldConroller,
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Amount"),
                  SizedBox(
                    height: media.height * 0.1,
                    width: media.width * 0.35,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _amountTextFieldController,
                      maxLines: 1,
                      maxLength: 30,
                    ),
                  ),
                ],
              ),
              _radioButtonWidget(
                media: media,
                icon: Icons.fastfood,
                radioButtonText: "Coffee",
                value: Category.coffee,
              ),
              _radioButtonWidget(
                media: media,
                icon: Icons.fastfood,
                radioButtonText: "Restaurant",
                value: Category.restaurant,
              ),
              _radioButtonWidget(
                media: media,
                icon: Icons.shopping_cart,
                radioButtonText: "Shop",
                value: Category.shop,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveData(ExpensesProvider dbProvider) {
    dbProvider.addExpense(
      date: DateTime.now(),
      title: _nameTextFieldConroller.text,
      amount: double.parse(_amountTextFieldController.text),
      category: _category.toString(),
    );
  }

  Widget _radioButtonWidget({
    Size media,
    Category value,
    IconData icon,
    String radioButtonText,
  }) {
    return SizedBox(
      width: media.width * .8,
      height: media.height * .1,
      child: ListTile(
        leading: Radio(
          value: value,
          groupValue: _category,
          onChanged: (Category value) {
            setState(() {
              _category = value;
            });
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: media.width * .25,
              child: Icon(
                icon,
              ),
            ),
            SizedBox(width: media.width * .25, child: Text(radioButtonText)),
          ],
        ),
      ),
    );
  }
}
