import 'package:expense_tracker/expense_tracker_class.dart';
import 'package:expense_tracker/expense_tracker_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTrackerAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  late ValueChanged<Expense> functionAdd;
  @override
  Size get preferredSize => Size.fromHeight(100);
  ExpenseTrackerAppbar({super.key, required this.functionAdd});

  @override
  State<ExpenseTrackerAppbar> createState() => _ExpenseTrackerAppbarState();
}

class _ExpenseTrackerAppbarState extends State<ExpenseTrackerAppbar> {
  String titleChoice = '';

  double amountChoice = 0.00;

  bool amountError = false;

  Category categroyChoice = Category.food;

  String dropdown = 'Food';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      actions: [
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (
                    BuildContext context,
                    void Function(void Function()) setState,
                  ) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Add An Expense',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (st) {
                                setState(() {
                                  titleChoice = st;
                                });
                              },
                              decoration: InputDecoration(
                                label: Text('Enter The Expense Title'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (st) {
                                setState(() {
                                  final value = double.tryParse(st);
                                  if (value == null) {
                                    amountError = true;
                                  } else {
                                    amountChoice = double.parse(st);
                                    amountError = false;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                label: Text('Enter The Expense Amount'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownButton(
                              isExpanded: true,
                              value: dropdown,
                              items: [
                                DropdownMenuItem(
                                  value: 'Work',
                                  child: Text('Work'),
                                ),
                                DropdownMenuItem(
                                  value: 'Food',
                                  child: Text('Food'),
                                ),
                                DropdownMenuItem(
                                  value: 'Travel',
                                  child: Text('Travel'),
                                ),
                                DropdownMenuItem(
                                  value: 'Leisure',
                                  child: Text('Leisure'),
                                ),
                              ],
                              onChanged: (st) {
                                setState(() {
                                  dropdown = st.toString();
                                  if (st == 'Work') {
                                    categroyChoice = Category.work;
                                  } else if (st == 'Food') {
                                    categroyChoice = Category.food;
                                  } else if (st == 'Leisure') {
                                    categroyChoice = Category.leisure;
                                  } else if (st == 'Travel') {
                                    categroyChoice = Category.travel;
                                  }
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (titleChoice == '' || amountError == true) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return Card(
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              softWrap: true,
                                              'All Input Feilds Should Be Filled And Amount Should Be Strictly Integer Or Decimal Format',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  await Future.delayed(
                                    const Duration(seconds: 1),
                                  );
                                  setState(() {
                                    amountError = false;
                                  });
                                  Navigator.pop(context);
                                } else {
                                  Expense e = Expense(
                                    amount: amountChoice,
                                    title: titleChoice,
                                    category: categroyChoice,
                                  );
                                  widget.functionAdd(e);
                                  Navigator.pop(context);
                                  setState(() {
                                    titleChoice = '';
                                    amountChoice = 0.00;
                                    amountError = false;
                                    categroyChoice = Category.food;
                                    dropdown = 'Food';
                                  });
                                }
                              },
                              child: Text(
                                'Create Expense',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          icon: Icon(Icons.add_box, size: 50, color: Colors.white),
        ),
      ],
      title: Text(
        'Moneto',
        style: GoogleFonts.oswald(
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 45,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBackgroundTheme),
        ),
      ),
    );
  }
}
