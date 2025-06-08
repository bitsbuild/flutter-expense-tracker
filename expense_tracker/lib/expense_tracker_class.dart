import 'package:uuid/uuid.dart';

enum Category { food, work, leisure, travel, empty }

class Expense {
  late String title;
  late double amount;
  late Category category;
  late String id;
  late String date;
  Expense({required this.title, required this.category, required this.amount})
    : id = Uuid().v4(),
      date = DateTime.now().toString().split(' ')[0];
}
