import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Call%20Execution/Call_Execution.dart';
import 'package:getpharma/CallReporting/Call%20Execution/Metrics.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Work_Plan.dart';
import 'package:getpharma/ContactPoints/Contact_Point_Details.dart';
import 'package:getpharma/ContactPoints/Contact_Point_Map.dart';
import 'package:getpharma/ContactPoints/Contacts_points.dart';
import 'package:getpharma/CustomerList/My%20Doctors/My_Doctors.dart';
import 'package:getpharma/DailyCall%20Reports/Daily_Call_Reports.dart';
import 'package:getpharma/Expenses/Advances/Advances.dart';
import 'package:getpharma/Expenses/Reimbursements/Reimbursements.dart';
import 'package:getpharma/Expenses/Settlements/Settlements.dart';
import 'package:getpharma/Login/login.dart';
import 'package:getpharma/Notification/Notification_Screen.dart';
import 'package:getpharma/Sale%20Performance/Sales.dart';
import 'package:getpharma/Sampling%20And%20Promo/Sampling_and_Promo.dart';
import 'package:getpharma/Setting/Reset_Password.dart';

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
