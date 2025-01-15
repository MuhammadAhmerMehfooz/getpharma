import 'package:flutter/material.dart';

class DailyCallReports extends StatefulWidget {
  const DailyCallReports({super.key});

  @override
  State<DailyCallReports> createState() => _DailyCallReportsState();
}

class _DailyCallReportsState extends State<DailyCallReports> {
  String selectedButton = "Daily Call Reports";
  final List<String> dropdown1Items = ["Option 1", "Option 2", "Option 3"];
  final List<String> dropdown2Items = ["Choice A", "Choice B", "Choice C"];
  final List<String> dropdown3Items = ["Select X", "Select Y", "Select Z"];
  List<Map<String, String>> DailyCallCards = [
    {
      'name': 'M.Ahsan - TSM',
      'status': 'Morning',
      'visit': 'Joint Visit',
      'doctor': 'Furqan Arif',
      'class': 'A',
      'date': '09 Sep 2024 - 08:25 PM'
    },
    {
      'name': 'Rahil - TSM',
      'status': 'Evening',
      'doctor': 'Abdul Sami',
      'class': 'B',
      'date': '24 Sep 2024 - 08:49 PM'
    },
    {
      'name': 'Najam Jameel - TSM',
      'status': 'Morning',
      'visit': 'Joint Visit',
      'doctor': 'Mehwish',
      'class': 'C',
      'date': '01 Sep 2024 - 08:10 PM'
    },
  ];
  List<Map<String, String>> DailyCallReports = [
    {
      'name': 'M.Ahsan - TSM',
      'location': 'Defense Phase 8',
      'status': 'Morning',
      'date': '09 Sep 2024 - 08:25 PM'
    },
    {
      'name': 'Rahil - TSM',
      'status': 'Evening',
      'location': 'Defense Phase 9',
      'date': '24 Sep 2024 - 08:49 PM'
    },
    {
      'name': 'Najam Jameel - TSM',
      'status': 'Morning',
      'location': 'Defense Phase 2',
      'date': '01 Sep 2024 - 08:10 PM'
    },
  ];

  String? selectedDropdown1;
  String? selectedDropdown2;
  String? selectedDropdown3;
  bool? isJointVisitChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            Text(
              'Daily Call Reports',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      "Date:",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(width: 4),
                    Text(
                      "09 May 2025 - 12 Sep 2025",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildButton("Daily Call Reports",
                      isSelected: selectedButton == "Daily Call Reports"),
                  _buildButton("Call Planning",
                      isSelected: selectedButton == "Call Planning"),
                ],
              ),
              if (selectedButton == "Daily Call Reports") ...[
                _buildDailyCall()
              ],
              if (selectedButton == "Call Planning") ...[_buildCallPlan()],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      hint: Text(
        hint,
        style: TextStyle(color: Colors.black),
      ),
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildButton(String title, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = title; // Update the selected button
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDailyCall() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Team",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Team',
            value: selectedDropdown1,
            items: dropdown1Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown1 = value;
              });
            },
          ),
          SizedBox(height: 8),
          Text(
            "Role",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Role',
            value: selectedDropdown2,
            items: dropdown2Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown2 = value;
              });
            },
          ),
          SizedBox(height: 8),
          Text(
            "Employee",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Employee',
            value: selectedDropdown3,
            items: dropdown3Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown3 = value;
              });
            },
          ),
          Row(
            children: [
              Checkbox(
                activeColor: Colors.blue,
                value: isJointVisitChecked,
                onChanged: (value) {
                  setState(() {
                    isJointVisitChecked = value;
                  });
                },
              ),
              Text(
                "Joint Visit",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SingleChildScrollView(
              child: Column(children: [
            ListView.builder(
              itemCount: DailyCallCards.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DailyCallCards[index]['name']!,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                if (DailyCallCards[index].containsKey('visit'))
                                  Chip(
                                    label: Text(
                                      DailyCallCards[index]['visit']!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                    backgroundColor: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 1, vertical: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                  ),
                                SizedBox(width: 1),
                                Chip(
                                  label: Text(
                                    DailyCallCards[index]['status']!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Doctor: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DailyCallCards[index]['doctor']!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "Class: ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DailyCallCards[index]['class']!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              DailyCallCards[index]['date']!,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ])),
        ],
      ),
    );
  }

  Widget _buildCallPlan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Team",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Team',
            value: selectedDropdown1,
            items: dropdown1Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown1 = value;
              });
            },
          ),
          SizedBox(height: 8),
          Text(
            "Role",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Role',
            value: selectedDropdown2,
            items: dropdown2Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown2 = value;
              });
            },
          ),
          SizedBox(height: 8),
          Text(
            "Employee",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          _buildDropdown(
            hint: 'Employee',
            value: selectedDropdown3,
            items: dropdown3Items,
            onChanged: (value) {
              setState(() {
                selectedDropdown3 = value;
              });
            },
          ),
          SizedBox(
            height: 18,
          ),
          SingleChildScrollView(
              child: Column(children: [
            ListView.builder(
              itemCount: DailyCallReports.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              DailyCallReports[index]['name']!,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            Row(
                              children: [
                                Chip(
                                  label: Text(
                                    DailyCallReports[index]['status']!,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1, vertical: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              DailyCallReports[index]['location']!,
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.blueGrey,
                            ),
                            SizedBox(width: 4),
                            Text(
                              DailyCallReports[index]['date']!,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ])),
        ],
      ),
    );
  }
}
