import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          expense.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Text(
            '\$${expense.amount.toStringAsFixed(2)}',
            style: GoogleFonts.inter(),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(categoryIcons[expense.category]),
              const SizedBox(
                width: 10,
              ),
              Text(expense.formattedDate),
            ],
          )
        ]),
      ]),
    ));
  }
}
