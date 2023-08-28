import 'dart:convert';

import 'package:expense_tracker/Widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/Widgets/new_expense.dart';
import 'package:expense_tracker/charts/charts.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _registeredExpenses = [];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadExpenses();
  }


  Category mapStringToCategory(String categoryString) {
  switch (categoryString) {
    case 'food':
      return Category.food;
    case 'leisure':
      return Category.leisure;
    case 'travel':
      return Category.travel;
    case 'work':
      return Category.work;
    case 'finance':
      return Category.finance;
    case 'health':
      return Category.health;
    default:
      // Handle the case where the category string is unknown
      // You might want to throw an error or provide a default category
      throw ArgumentError('Unknown category: $categoryString');
  }
}

  

  void _loadExpenses() async {
    final url = Uri.https(
        'expense-tracker-app-a22c8-default-rtdb.firebaseio.com', 'expenses.json');
    final response = await http.get(url);

    final Map<String, dynamic> expensesData = json.decode(response.body);

    final List<Expense> loadedExpenses = [];

    for (final expense in expensesData.entries) {


     

      loadedExpenses.add(Expense(
          title: expense.value['title'],
          amount: expense.value['amount'],
          date: DateTime.parse(expense.value['date']),
          category:  mapStringToCategory(expense.value['category'])  ));
    }

    setState(() {
      _registeredExpenses = loadedExpenses;
    });
  }

  void _addExpense(Expense expense) async {
    setState(() {
      _loadExpenses();
    });
  }

  void _removeExpense(Expense expense) async {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    final url = Uri.https(
        'expense-tracker-app-a22c8-default-rtdb.firebaseio.com', 'expenses.json');

    final response = await http.delete(url);

    if(response.statusCode >= 400){
      setState(() {
        _registeredExpenses.insert(expenseIndex, expense);
      });
    }

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
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     setState(() {
      //       _registeredExpenses.insert(expenseIndex, expense);
      //     });
      //   },
      // ),
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
                  onPressed: _openAddExpenseOverlay,
                  icon: const Icon(Icons.add))
            ]),
        body: width < 600
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Charts(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ])
            : Row(children: [
                Expanded(child: Charts(expenses: _registeredExpenses)),
                Expanded(child: mainContent),
              ]));
  }
}
