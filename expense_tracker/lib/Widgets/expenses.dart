import 'package:expense_tracker/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/Widgets/new_expense.dart';
import 'package:expense_tracker/charts/charts.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
} 

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 20,
        date: DateTime.now(),
        category: Category.finance),
    Expense(
        title: 'Shopping',
        amount: 30,
        date: DateTime.now(),
        category: Category.health),
    Expense(
        title: 'Flutter Course',
        amount: 20,
        date: DateTime.now(),
        category: Category.finance)
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    // Snack Bars
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
        'Expense Deleted!',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.bold,
        ),
      ),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(context) {

    final width = MediaQuery.of(context).size.width;


    Widget mainContent =
        const Center(child: Text('No expenses added. Add them to see here!'));

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text(
            'Expense Tracker',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ]),
      body:  width < 600 
      ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Charts(expenses : _registeredExpenses),
        Expanded(child: mainContent),]) 
      : Row(
        children: [
        Expanded(child: Charts(expenses : _registeredExpenses)),
        Expanded(child: mainContent),
      ]
      )
    );
  }
}
