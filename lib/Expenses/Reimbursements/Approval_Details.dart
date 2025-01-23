import 'package:flutter/material.dart';

class ApprovalDetailsScreen extends StatelessWidget {
  const ApprovalDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for the table
    final approvalData = [
      {
        "sequence": "1",
        "employee": "Zeeshan Ali (80809090)",
        "designation": "Sales Manager",
        "date": "17/Feb/2024 14:28:37",
        "Status": "-",
        "Pending": "Pending"
      },
      {
        "sequence": "2",
        "employee": "Asif Baig (80809090)",
        "designation": "Deputy Sales Manager",
        "date": "17/Feb/2024 14:28:37",
        "Status": "-",
        "Pending": "Pending"
      },
      {
        "sequence": "3",
        "employee": "Ahmed Ali (80809090)",
        "designation": "Hiring Recruiter",
        "date": "17/Feb/2024 14:28:37",
        "Status": "-",
        "Pending": "Pending"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
            Text(
              'Approval Details',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  icon: Icon(Icons.book, color: Colors.blue),
                  onPressed: () {
                    // Add functionality for the icon (e.g., refresh data)
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20,
                  headingRowColor:
                      MaterialStateProperty.all(Colors.blue[50]),
                  border: TableBorder.all(color: Colors.grey.shade300),
                  columns: const [
                    DataColumn(
                      label: Text(
                        "Approval Sequence",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Employee\n(Approval Authority)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Designation",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Received Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Status Update on",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Pending",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: approvalData
                      .map(
                        (data) => DataRow(
                          cells: [
                            DataCell(Text(data["sequence"]!)),
                            DataCell(Text(data["employee"]!)),
                            DataCell(Text(data["designation"]!)),
                            DataCell(Text(data["date"]!)),
                            DataCell(Text(data["Status"]!)),
                            DataCell(
                              Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                data["Pending"]!,
                                style: TextStyle(color: Colors.deepOrange.shade900),
                              ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
