//import 'package:exercise_state/expenses.dart';
import 'package:exercise_state/models/expense.dart';
import 'package:exercise_state/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(color:Theme.of(context).colorScheme.error.withOpacity(0.80),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            ) ,
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index])));
  }
}
