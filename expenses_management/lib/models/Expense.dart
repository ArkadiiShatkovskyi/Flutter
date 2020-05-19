import 'dart:convert';

Expense expenseFromJson(String str){
  final jsonData = json.decode(str);
  return Expense.fromMap(jsonData);
}

String expenseToJson(Expense data){
  final dyn = data.toMap();
  return json.encode(dyn);
}


class Expense{
  final int id;
  final String title;
  final String category;
  final int dateDay;
  final int dateMonth;
  final int dateYear;
  final double amount;

  Expense({this.id, this.title, this.category, this.dateDay, this.dateMonth, this.dateYear, this.amount});

  Map<String, dynamic> toMap(){
    return  {
      'id' : id,
      'title' : title,
      'dateDay' : dateDay,
      'dateMonth' : dateMonth,
      'dateYear' : dateYear,
      'category' : category,
      'amount' : amount, 
    };
  }

  factory Expense.fromMap(Map<String, dynamic> json){
    return Expense(
      id: json['id'], 
      title: json['title'], 
      dateDay: json['dateDay'],
      dateMonth: json['dateMonth'],
      dateYear: json['dateYear'], 
      category: json['category'],
      amount: json['amount']
    );
  }

  @override
  String toString() {
    return "Expense:[Id: $id, title: $title, category: $category, amount: $amount, date: $dateDay:$dateMonth:$dateYear]";
  }
}