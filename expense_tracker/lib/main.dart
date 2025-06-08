import 'package:expense_tracker/expense_tracker_class.dart';
import 'package:expense_tracker/expense_tracker_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExpenseTracker());
}

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  late Widget wid;
  int countFood = 0;
  int countWork = 0;
  int countTravel = 0;
  int countLeisure = 0;
  List<Expense> expenses = [];
  void listAdd(Expense e) {
    setState(() {
      expenses.add(e);
      if (e.category == Category.food) {
        countFood = countFood + 1;
      } else if (e.category == Category.travel) {
        countTravel = countTravel + 1;
      } else if (e.category == Category.work) {
        countWork = countWork + 1;
      } else if (e.category == Category.leisure) {
        countLeisure = countLeisure + 1;
      }

      wid = ExpenseTrackerScaffold(
        functionAdd: listAdd,
        functionDelete: listDelete,
        exp: expenses,
        countFood: countFood,
        countLeisure: countLeisure,
        countTravel: countTravel,
        countWork: countWork,
      );
    });
  }

  void listDelete(Map<Expense, int> i) async {
    setState(() {
      int indexToRemove = i.values.first;
      expenses.removeAt(indexToRemove);
      wid = ExpenseTrackerScaffold(
        functionAdd: listAdd,
        functionDelete: listDelete,
        exp: expenses,
        countFood: countFood,
        countLeisure: countLeisure,
        countTravel: countTravel,
        countWork: countWork,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    wid = ExpenseTrackerScaffold(
      functionAdd: listAdd,
      functionDelete: listDelete,
      exp: expenses,
      countFood: countFood,
      countLeisure: countLeisure,
      countTravel: countTravel,
      countWork: countWork,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: wid,
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
    );
  }
}
