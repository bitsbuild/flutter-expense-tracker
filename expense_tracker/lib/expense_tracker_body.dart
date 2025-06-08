import 'package:expense_tracker/chart/chart.dart';
import 'package:flutter/material.dart';

import 'expense_tracker_class.dart';

class ExpenseTrackerBody extends StatefulWidget {
  late ValueChanged<Map<Expense, int>> functionDelete;
  List<Expense> exp;
  late int countFood;
  late int countWork;
  late int countTravel;
  late int countLeisure;
  ExpenseTrackerBody({
    super.key,
    required this.functionDelete,
    required this.exp,
    required this.countFood,
    required this.countWork,
    required this.countTravel,
    required this.countLeisure,
  });
  @override
  State<ExpenseTrackerBody> createState() => _ExpenseTrackerBodyState();
}

class _ExpenseTrackerBodyState extends State<ExpenseTrackerBody> {
  var categoryMap = {
    Category.food: Icons.local_pizza,
    Category.work: Icons.laptop,
    Category.travel: Icons.train,
    Category.leisure: Icons.chair,
  };
  late Widget wid;
  @override
  Widget build(BuildContext context) {
    if (widget.exp.isNotEmpty) {
      wid = ListView.builder(
        itemCount: widget.exp.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(widget.exp.length),
            onDismissed: (direction) {
              widget.functionDelete({widget.exp[index]: index});
            },
            child: SizedBox(
              height: 150,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.exp[index].title,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Expense Add Date: ${widget.exp[index].date.toString().split(' ')[0]}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Amount: \$${widget.exp[index].amount}',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Category: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(categoryMap[widget.exp[index].category]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      wid = Center(
        child: Text(
          'No Expenses Exist As Of Now',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Chart(
                countFood: widget.countFood,
                countLeisure: widget.countLeisure,
                countTravel: widget.countTravel,
                countWork: widget.countWork,
              ),
            ),
            Expanded(
              child: Padding(padding: const EdgeInsets.all(15.00), child: wid),
            ),
          ],
        ),
      ),
    );
  }
}
