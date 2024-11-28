import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/Uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Catergory { food, leisure, travel, work }

const catergoryIcons = {
  Catergory.food: Icons.lunch_dining_rounded,
  Catergory.travel: Icons.flight_takeoff,
  Catergory.work: Icons.work,
  Catergory.leisure: Icons.movie,
};

class Expense {
  Expense(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Catergory category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket(this.catergory, this.expense);

  ExpenseBucket.forCategory(List<Expense> allexpenses, this.catergory)
      : expense = allexpenses
            .where((expense) => expense.category == catergory)
            .toList();

  final Catergory catergory;
  final List<Expense> expense;

  double get totalExpense {
    double sum = 0;

    for (final Expense in expense) {
      sum = sum + Expense.amount;
    }

    return sum;
  }
}
