import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Metrics extends StatefulWidget {
  const Metrics({super.key});

  @override
  State<Metrics> createState() => _MetricsState();
}

class _MetricsState extends State<Metrics> {
  final List<String> teams = ['Leopard', 'Tiger', 'Lion'];
  final List<String> roles = ['TSM', 'ASM', 'RSM'];
  final List<String> employees = ['M. Ahsan', 'Ali Khan', 'John Doe'];

  String? selectedTeam;
  String? selectedRole;
  String? selectedEmployee;

  @override
  void initState() {
    selectedTeam = teams[0];
    selectedRole = roles[0];
    selectedEmployee = employees[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Metrics",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentDate,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "$currentDate | $currentTime",
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Team',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5),

            DropdownButtonFormField<String>(
              value: selectedTeam,
              items: teams.map((String activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person_2,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedTeam = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Role',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5),

            DropdownButtonFormField<String>(
              value: selectedRole,
              items: roles.map((String activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.grade,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Employee',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5),

            DropdownButtonFormField<String>(
              value: selectedEmployee,
              items: employees.map((String activity) {
                return DropdownMenuItem<String>(
                  value: activity,
                  child: Text(activity),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.person_3_rounded,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  selectedEmployee = value;
                });
              },
            ),

            const SizedBox(
              height: 50,
            ),

            // First Row: Executed Calls and No. of Calls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularIndicator(
                  title: "Executed Calls",
                  subtitle: "Monthly",
                  percent: 25 / 30,
                  value: "25 / 30",
                  type: "Calls",
                  color: Colors.blue,
                  text1: "Executed",
                  color1: Colors.blue,
                  text2: "Not Executed",
                  color2: Colors.grey,
                ),
                _buildCircularIndicator(
                  title: "No. of Calls",
                  subtitle: "Today",
                  percent: 18 / 30, // Adjusted value
                  value: "18",
                  type: "Calls",
                  color: Colors.green,
                  text1: "Executed",
                  color1: Colors.green,
                  text2: "Remaining",
                  color2: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Second Row: Unvisited Doctors and MTD Coverage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularIndicator(
                  title: "Unvisited Doctors",
                  subtitle: "Monthly",
                  percent: 40 / 600,
                  value: "40 / 600",
                  type: 'Doctors',
                  color: Colors.red,
                  text1: "Visited",
                  color1: Colors.red,
                  text2: "Unvisited",
                  color2: Colors.grey,
                ),
                _buildCircularIndicator(
                  title: "MTD Coverage",
                  subtitle: "Monthly",
                  percent: 0.4,
                  value: "40%",
                  type: 'Coverage',
                  color: Colors.blue,
                  text1: "Month Coverage",
                  color1: Colors.blue,
                  text2: "Remain",
                  color2: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Third Row: Unplanned Calls and Avg Calls Per Day
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircularIndicator(
                  title: "Unplanned Calls",
                  subtitle: "Monthly",
                  percent: 100 / 416,
                  value: "100 / 416",
                  type: "Calls",
                  color: Colors.blue,
                  text1: "Unplanned",
                  color1: Colors.blue,
                  text2: "Planned",
                  color2: Colors.grey,
                ),
                _buildCircularIndicator(
                  title: "Avg. Calls Per Day",
                  subtitle: "Monthly",
                  percent: 0.8,
                  value: "80%",
                  type: "Calls",
                  color: Colors.blue,
                  text1: "Executed",
                  color1: Colors.blue,
                  text2: "Remaining",
                  color2: Colors.grey,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCardWithLongBars(
                  title: "Sales vs.Target",
                  subtitle: "MTD",
                  percent1: 0.90, // First bar (sales progress)
                  percent2: 0.75, // Second bar (another metric)
                  value1: "90%",
                  value2: "75%",
                  color1: Colors.teal,
                  color2: Colors.blue,
                  text1: "Sales",
                  text2: "Target",
                ),
                _buildCircularIndicator(
                  title: "Sales vs.Target",
                  subtitle: "Monthly",
                  percent: 0.8,
                  value: "70%",
                  type: "Sales",
                  color: Colors.blue,
                  text1: "Sales",
                  color1: Colors.blue,
                  text2: "Target",
                  color2: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Circular Percent Indicator
  Widget _buildCircularIndicator({
    required String title,
    required String subtitle,
    required double percent,
    required String value,
    required String type,
    required Color color,
    required String text1, // First text
    required Color color1, // First dot color
    required String text2, // Second text
    required Color color2, // Second dot color
  }) {
    return SizedBox(
      width: 170, // Adjust the width for a more horizontal look
      height: 220, // Increased height to accommodate new content
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with more_vert icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              // Subtitle
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),

              // Circular Indicator Centered
              Center(
                child: CircularPercentIndicator(
                  radius: 50.0,
                  lineWidth: 8.0,
                  percent: percent,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        type,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  progressColor: color,
                  backgroundColor: Colors.grey.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              const SizedBox(height: 15),

              // Row for Dots and Text BELOW the Circle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Dot and Text
                  Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: color1,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6), // Space between dots and text
                  // Second Dot and Text
                  Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: color2,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        text2,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardWithLongBars({
    required String title,
    required String subtitle,
    required double percent1, // First bar percent
    required double percent2, // Second bar percent
    required String value1,
    required String value2,
    required Color color1,
    required Color color2,
    required String text1,
    required String text2,
  }) {
    return SizedBox(
      width: 170, // Adjust width to fit the vertical layout
      height: 250, // Increased height to accommodate the taller vertical bars
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Subtitle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const Icon(
                    Icons.more_vert,
                    size: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 6),

              // Row to hold both vertical progress bars side by side
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        value1,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 1),
                      SizedBox(
                        width: 20,
                        height: 130.0,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: LinearPercentIndicator(
                            lineHeight: 30.0,
                            percent: percent1,
                            progressColor: color1,
                            backgroundColor: Colors.grey.shade200,
                            barRadius: const Radius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Second Vertical Percent Indicator (Standing up)
                  Column(
                    children: [
                      Text(
                        value2,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      SizedBox(
                        width: 20,
                        height: 100.0,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: LinearPercentIndicator(
                            lineHeight: 30.0,
                            percent: percent2,
                            progressColor: color2,
                            backgroundColor: Colors.grey.shade200,
                            barRadius: const Radius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Dot and Text
                  Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: color1,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12), // Space between dots and text
                  // Second Dot and Text
                  Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: color2,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        text2,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
