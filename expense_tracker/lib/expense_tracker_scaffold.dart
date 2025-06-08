import 'package:expense_tracker/expense_tracker_appbar.dart';
import 'package:expense_tracker/expense_tracker_body.dart';
import 'package:expense_tracker/expense_tracker_class.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerScaffold extends StatefulWidget {
  late ValueChanged<Expense> functionAdd;
  late ValueChanged<Map<Expense, int>> functionDelete;
  late int countFood;
  late int countWork;
  late int countTravel;
  late int countLeisure;
  late List<Expense> exp;
  ExpenseTrackerScaffold({
    super.key,
    required this.functionAdd,
    required this.functionDelete,
    required this.exp,
    required this.countFood,
    required this.countWork,
    required this.countTravel,
    required this.countLeisure,
  });
  @override
  State<ExpenseTrackerScaffold> createState() => _ExpenseTrackerScaffoldState();
}

class _ExpenseTrackerScaffoldState extends State<ExpenseTrackerScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ExpenseTrackerAppbar(functionAdd: widget.functionAdd),
      body: ExpenseTrackerBody(
        functionDelete: widget.functionDelete,
        exp: widget.exp,
        countFood: widget.countFood,
        countLeisure: widget.countLeisure,
        countTravel: widget.countTravel,
        countWork: widget.countWork,
      ),
    );
  }
}
