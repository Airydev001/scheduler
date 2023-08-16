import "package:exercise_state/models/expense.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddexpense, super.key});
  final void Function(Expense expense) onAddexpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /*var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }*/
  final _titleController = TextEditingController();
  final _expenseController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.food;

  @override
  void dispose() {
    _titleController.dispose();
    _expenseController.dispose();
    super.dispose();
  }

  void openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month);
    final lastDate = DateTime(now.year + 5, now.month);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_expenseController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      //showErrorMessage
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure a valid title,amount,date and category was entered."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("okay"))
          ],
        ),
      );
      return; // for invalid data not to be input
    }
    widget.onAddexpense(Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    //To get the amount of space ovelapp by the keyboard
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, constraints) {
      final width = constraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          //margin: const EdgeInsets.all(0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 48, 16, keyboardSpace + 16),
              child: Column(children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration:
                                const InputDecoration(label: Text("Title"))),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: TextField(
                            controller: _expenseController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                label: Text("Amount"), prefixText: " \$ ")),
                      ),
                    ],
                  )
                else
                  TextField(
                      controller: _titleController,
                      maxLength: 50,
                      decoration: const InputDecoration(label: Text("Title"))),
                if (width >= 600)
                  Row(children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _selectedDate == null
                                ? "No date selected yet"
                                : formatter.format(_selectedDate!),
                          ),
                          IconButton(
                              onPressed: () {
                                openDatePicker();
                              },
                              icon: const Icon(Icons.calendar_month))
                        ],
                      ),
                    )
                  ])
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                            controller: _expenseController,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                label: Text("Amount"), prefixText: " \$ ")),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              _selectedDate == null
                                  ? "No date selected yet"
                                  : formatter.format(_selectedDate!),
                            ),
                            IconButton(
                                onPressed: () {
                                  openDatePicker();
                                },
                                icon: const Icon(Icons.calendar_month))
                          ],
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 10),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            _submitExpenseData();
                          },
                          child: const Text("Save Expense")),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"))
                    ],
                  )
                else
                  Row(children: [
                    DropdownButton(
                        value: _selectedCategory,
                        items: Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category.name.toUpperCase(),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null) {
                            return;
                          }
                          setState(() {
                            _selectedCategory = value;
                          });
                        }),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          _submitExpenseData();
                        },
                        child: const Text("Save Expense")),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"))
                  ])
              ])),
        ),
      );
    });
  }
}
