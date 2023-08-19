import 'dart:math';

import 'package:expense_tracker/Widgets/expenses.dart';
import 'package:expense_tracker/Widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, leisure, travel, work, finance, health }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.watch,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.finance: Icons.currency_exchange,
  Category.health: Icons.sports_gymnastics_rounded
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {

  ExpenseBucket({
  required this.category, 
  required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum = 0;


    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;

  }


}
