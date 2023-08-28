import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    super.key,
    required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var _enteredTitle = '';

  // Approach One

  // void _saveTitle(String inputString){
  //   _enteredTitle = inputString;
  // }

  // Approach Two

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? dateSelected;
  Category _selectedCategory = Category.leisure;

  void _selectDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: now,
        lastDate: now);

    setState(() {
      dateSelected = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDialog(){
    if(Platform.isIOS){
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid Input'),
                content: Text(
                    'Please check whether all the details are Entered correctly!',
                    style: GoogleFonts.inter()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        'Try Again',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ))
                ],
              ));
    }
    else{

      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: Text(
                    'Please check whether all the details are Entered correctly!',
                    style: GoogleFonts.inter()),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: Text(
                        'Try Again',
                        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                      ))
                ],
              ));
      
    }
  }

  void _submitDetails() async {
    final amountEntered = double.tryParse(_amountController
        .text); // tryParse('Name') --> null, whereas: tryParse('1.20') --> 1.20

    final amountIsInvalid = amountEntered == null || amountEntered <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectDate == null) {

          _showDialog();
      
      return;
    }
    final url = Uri.https('expense-tracker-app-a22c8-default-rtdb.firebaseio.com', 'expenses.json');

    String category = _selectedCategory.toString().split('.').last;
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': _titleController.text,
        'amount': amountEntered,
        'date': dateSelected!.toString(),
        'category': category
      })
    );

    print(response.body);
    print(response.statusCode);

    
    final Map<String, dynamic> resData = json.decode(response.body);

    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: amountEntered,
        date: dateSelected!,
        category: _selectedCategory));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      // print(constraints.maxWidth);
      // print(constraints.minHeight);
      // print(constraints.maxHeight);

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, keyboardSpace + 20),
            child: Column(children: [
              if (width >= 600)
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        // onChanged: _saveTitle,
                        controller: _titleController,
                        maxLength: 100,
                        decoration: const InputDecoration(label: Text('Title')),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                      child: TextField(
                        controller: _amountController,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixText: '\$ ',
                          label: Text('Enter Amount'),
                        ),
                      ),
                    ),
                  ],
                )
              else
                TextField(
                  // onChanged: _saveTitle,
                  controller: _titleController,
                  maxLength: 100,
                  decoration: const InputDecoration(label: Text('Title')),
                ),
              if (width >= 600)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map((category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return; 
                          }
                          setState(() {
                            _selectedCategory = value;
                            print(_selectedCategory);
                          });
                        }),
                    const SizedBox(width: 25),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(dateSelected == null
                            ? 'No Date Selected'
                            : formatter.format(dateSelected!)),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: _selectDate,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ))
                  ],
                )
              else
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        label: Text('Enter Amount'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(dateSelected == null
                          ? 'No Date Selected'
                          : formatter.format(dateSelected!)),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: _selectDate,
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ))
                ],
              ),
              
              
              const SizedBox(
                height: 20,
              ),

              if(width >= 600)
                Row(children: [
                  const Spacer(),
                  ElevatedButton(
                      onPressed: _submitDetails,
                      child: const Text('Save Expense')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],)
              else
              Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase())))
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedCategory = value;
                          print(_selectedCategory);
                        });
                      }),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: _submitDetails,
                      child: const Text('Save Expense')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'))
                ],
              )
            ]),
          ),
        ),
      );
    });
  }
}
