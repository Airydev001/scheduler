import 'package:exercise_state/widgets/chart/chart.dart';
import 'package:exercise_state/widgets/expenses_list/expenses_list.dart';
import 'package:exercise_state/models/expense.dart';
import 'package:exercise_state/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Flutter Course",
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return NewExpense(onAddexpense: _addExpenses);
        });
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removedExpense(Expense expense) {
    //finding out the iondex of last expense
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted."),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            })));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text("No expenses found.start adding some!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removedExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Expenses tracker"),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
              iconSize: 25,
            )
          ],
        ),
        body: width < 600 ? Column(
          children: [
            Chart(
              expenses: _registeredExpenses,
            ),
            Expanded(
              child: mainContent,
            ),
          ],
        ): Row(children: [
           Expanded(
             child: Chart(
                expenses: _registeredExpenses,
              ),
           ),
            Expanded(
              child: mainContent,
            ),
        ],));
  }
}
