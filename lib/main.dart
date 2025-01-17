import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Work_Plan.dart';
import 'package:getpharma/Expenses/Advances/Advances.dart';
import 'package:getpharma/Expenses/Reimbursements/Reimbursements.dart';
import 'package:getpharma/Expenses/Settlements/Settlements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: WorkPlan(),
    );
  }
}
