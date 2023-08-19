import 'package:expense_tracker/Widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        // Don't get confused. singleExpense holds the index value
        itemBuilder: (ctx, singleExpense) => Dismissible(
            key: ValueKey(expenses[singleExpense]),
            background: Container(
              
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[singleExpense]);
            },
            child: ExpenseItem(expenses[singleExpense])));
  }
}
