import 'package:exercise_state/layouts/home.dart';
import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Column and Rows"),
        ),
        backgroundColor: Colors.indigo[100],
        body: const Home());
  }

  
}
