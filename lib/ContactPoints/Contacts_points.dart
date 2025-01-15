import 'package:flutter/material.dart';
import 'package:getpharma/ContactPoints/Add_Contact_Points.dart';
import 'package:getpharma/ContactPoints/Contact_Point_Details.dart';
import 'package:intl/intl.dart';

class ContactsPoints extends StatefulWidget {
  const ContactsPoints({super.key});

  @override
  State<ContactsPoints> createState() => _ContactsPointsState();
}

class _ContactsPointsState extends State<ContactsPoints> {
  String? selectedRegion;
  String? selectedDistrict;
  String? selectedTerritory;
  int _selectedTab = 0;
  int _selectedIndex = 0;
  DateTime _focusedDay = DateTime.now();
  List<Map<String, String>> assignedData = [
    {
      'name': 'Disko Bakery - Gulshan',
      'team': 'Legend',
      'region': 'Gulshan e iqbal',
      'territory': 'Karachi Central',
      'Status': 'Assingned'
    },
    {
      'name': 'Sugar Shack - Saddar',
      'team': 'Heroes',
      'region': 'Saddar',
      'territory': 'Karachi East',
      'Status': 'Assingned'
    },
    {
      'name': 'Pizza Hut - Korangi',
      'team': 'Warriors',
      'region': 'Korangi',
      'territory': 'Karachi South',
      'Status': 'Assingned'
    },
  ];
  List<Map<String, String>> ContactPointsRequest = [
    {
      'name': 'Disko Bakery - Gulshan',
      'team': 'Legend',
      'region': 'Gulshan e iqbal',
      'territory': 'Karachi Central',
      'Status': 'Pending',
      'approver': 'TFE',
      'Approvalname': 'SM - Asim Ali',
      'Date': '13 Sep 2024 - 10:15AM'
    },
    {
      'name': 'Sugar Shack - Saddar',
      'team': 'Heroes',
      'region': 'Saddar',
      'territory': 'Karachi East',
      'Status': 'Pending',
      'approver': 'SFE',
      'Approvalname': 'SM - Adeel Khan',
      'Date': '12 Sep 2024 - 09:30AM'
    },
    {
      'name': 'Pizza Hut - Korangi',
      'team': 'Warriors',
      'region': 'Korangi',
      'territory': 'Karachi South',
      'Status': 'Pending',
      'approver': 'OFE',
      'Approvalname': 'SM - Asad Baig',
      'Date': '09 Sep 2024 - 08:25PM'
    },
    // Add more entries as needed
  ];
  List<Map<String, String>> dataforpending = [
    {
      'team': 'Leopard Team',
      'role': 'TSM',
      'employee': 'M.Ahsan',
      'date': '07-10-2025',
      'Status': 'Pending',
      'time': 'On-Time',
      'location': 'Off-Location',
    },
    {
      'team': 'heroes Team',
      'role': 'TSM',
      'employee': 'Ali',
      'date': '08-10-2025',
      'Status': 'Pending',
      'time': 'On-Time',
      'location': 'Off-Location',
    },
    {
      'team': 'Legend Team',
      'role': 'TSM',
      'employee': 'Asad',
      'date': '07-10-2025',
      'Status': 'Pending',
      'time': 'On-Time',
      'location': 'Off-Location',
    },
    // Add more entries as needed
  ];
  final contacttrackerdata = [
    {
      "Team": "Leopard",
      "employee": "Zeeshan Ali (80809090)",
      "Role": "Sales Manager",
      "Shift": 'Moring',
      "date": "17/Feb/2024",
      "time": "14:28:37",
      "map": 'Link',
      "value": "On-time\n On-Location"
    },
    {
      "Team": "Leopard",
      "employee": "Zeeshan Ali (80809090)",
      "Role": "Sales Manager",
      "Shift": 'Moring',
      "date": "17/Feb/2024",
      "time": "14:28:37",
      "map": 'Link',
      "value": "On-time\n On-Location"
    },
    {
      "Team": "Leopard",
      "employee": "Zeeshan Ali (80809090)",
      "Role": "Sales Manager",
      "Shift": 'Moring',
      "date": "17/Feb/2024",
      "time": "14:28:37",
      "map": 'Link',
      "value": "On-time\n On-Location"
    },
  ];

  // Track the selected button
  String selectedButton = 'Contact Point Locations';
  void _updateMonth(DateTime newMonth) {
    setState(() {
      _focusedDay = newMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            const Text(
              'Contact Points',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid of Buttons
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3,
              children: [
                _buildButton('Contact Point Locations', '1',
                    isSelected: selectedButton == 'Contact Point Locations'),
                _buildButton('New Contact Point Requests', '3',
                    isSelected: selectedButton == 'New Contact Point Requests'),
                _buildButton('Pending For My Approval', '4',
                    isSelected: selectedButton == 'Pending For My Approval'),
                _buildButton('Contact Point Tracker', '',
                    isSelected: selectedButton == 'Contact Point Tracker'),
              ],
            ),
            const SizedBox(height: 24),

            // Show dynamic content based on the selected button
            _buildDynamicContent(),
          ],
        ),
      ),
      floatingActionButton: selectedButton == 'Contact Point Locations'
          ? FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddContactPoints(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            )
          : null, // No floating button for other selections
    );
  }

  Widget _buildButton(String title, String count, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = title; // Update the selected button
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (count.isNotEmpty)
              CircleAvatar(
                radius: 12,
                backgroundColor: isSelected ? Colors.white : Colors.blue,
                child: Text(
                  count,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(width: 8),
            Expanded(
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
          ],
        ),
      ),
    );
  }

  Widget _buildDynamicContent() {
    switch (selectedButton) {
      case 'Contact Point Locations':
        return _contactPointLocationsUI();
      case 'New Contact Point Requests':
        return _newContactPointRequestsUI();
      case 'Pending For My Approval':
        return _pendingApprovalUI();
      case 'Contact Point Tracker':
        return _contactPointTrackerUI();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildAssignedTab();
      case 1:
        return _buildTabContentUI("Under Review Content Here");
      case 2:
        return _buildTabContentUI("Rejected Content Here");
      default:
        return Container();
    }
  }

  Widget _buildTabContentforpproval() {
    switch (_selectedTab) {
      case 0:
        return _buildPendingThird();
      case 1:
        return _buildTabContentUI("Approved Content Here");
      case 2:
        return _buildTabContentUI("Rejected Content Here");
      default:
        return Container();
    }
  }

  Widget _buildTabContentUI(String content) {
    return Center(
      child: Text(content),
    );
  }

  Widget _contactPointLocationsUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Region',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Region',
            value: selectedRegion,
            items: ['Region 1', 'Region 2', 'Region 3'],
            onChanged: (value) => setState(() => selectedRegion = value),
          ),
          const SizedBox(height: 16),
          const Text(
            'District',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Select District',
            value: selectedDistrict,
            items: ['District 1', 'District 2', 'District 3'],
            onChanged: (value) => setState(() => selectedDistrict = value),
          ),
          const SizedBox(height: 16),
          const Text(
            'Territory',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Territory',
            value: selectedTerritory,
            items: ['Territory 1', 'Territory 2', 'Territory 3'],
            onChanged: (value) => setState(() => selectedTerritory = value),
          ),
          const SizedBox(height: 24),
          TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              hintText: 'Search Here',
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: _buildTab("Assigned", _selectedTab == 0),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: _buildTab("Under Review", _selectedTab == 1),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 2;
                  });
                },
                child: _buildTab("Rejected", _selectedTab == 2),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _newContactPointRequestsUI() {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Ensures Column shrinks to fit its content
      children: [
        // Tab Row with no Expanded here, as it's directly in Column
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: _buildTab('Pending', _selectedIndex == 0),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: _buildTab('Approved', _selectedIndex == 1),
            ),
            SizedBox(width: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: _buildTab('Rejected', _selectedIndex == 2),
            ),
          ],
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show content based on the selected tab
                if (_selectedIndex == 0) // Pending Tab
                  ListView.builder(
                    shrinkWrap: true, // Keeps the ListView size to its content
                    physics:
                        NeverScrollableScrollPhysics(), // Disable inner scroll, rely on parent scroll
                    itemCount: ContactPointsRequest.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigate to another screen with Navigator.push
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewContactPointDetails(),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          margin:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 1),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Name on the left
                                    Text(
                                      ContactPointsRequest[index]['name'] ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    // Positioned Chip on the right (next to the name)
                                    Chip(
                                      label: Text(
                                        ContactPointsRequest[index]['Status'] ??
                                            '',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                      backgroundColor: Colors.orangeAccent[200],
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 2),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Team: ${ContactPointsRequest[index]['team'] ?? ''}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'Region: ${ContactPointsRequest[index]['region'] ?? ''}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  'Territory: ${ContactPointsRequest[index]['territory'] ?? ''}',
                                  style: TextStyle(fontSize: 14),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.location_on,
                                      size: 18,
                                      color: Colors.blue,
                                    ),
                                    label: Text(
                                      'Show on Maps',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.blue,
                                      textStyle: TextStyle(fontSize: 14),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Last Approval',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      'Pending Approval',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ContactPointsRequest[index]['approver'] ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.red),
                                    ),
                                    Text(
                                      ContactPointsRequest[index]
                                              ['Approvalname'] ??
                                          '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      ContactPointsRequest[index]['Date'] ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.blue),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                if (_selectedIndex == 1) // Approved Tab
                  Center(child: Text('Approved content here')),
                if (_selectedIndex == 2) // Rejected Tab
                  Center(child: Text('Rejected content here')),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _pendingApprovalUI() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal Card
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Running Payroll Period:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '20th Sep - 19th Oct',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Text(
            'Team',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Team',
            value: selectedRegion,
            items: ['Team 1', 'Team 2', 'Team 3'],
            onChanged: (value) => setState(() => selectedRegion = value),
          ),
          const SizedBox(height: 16),
          const Text(
            'Role',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Select Role',
            value: selectedDistrict,
            items: ['Role 1', 'Role 2', 'Role 3'],
            onChanged: (value) => setState(() => selectedDistrict = value),
          ),
          const SizedBox(height: 16),
          const Text(
            'Employee',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildDropdown(
            hint: 'Employee',
            value: selectedTerritory,
            items: ['Employee 1', 'Employee 2', 'Employee 3'],
            onChanged: (value) => setState(() => selectedTerritory = value),
          ),
          const SizedBox(height: 24),
          TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              hintText: 'Search Here',
              hintStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 0;
                  });
                },
                child: _buildTab("Pending", _selectedTab == 0),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 1;
                  });
                },
                child: _buildTab("Approved", _selectedTab == 1),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTab = 2;
                  });
                },
                child: _buildTab("Employee", _selectedTab == 2),
              ),
            ],
          ),
          SizedBox(height: 10),
          _buildTabContentforpproval(),
        ],
      ),
    );
  }

  Widget _contactPointTrackerUI() {
    String? selectedOption1;
    String? selectedOption2;
    String? selectedOption3;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Team',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              hint: 'Team',
              value: selectedOption1,
              items: ['Team 1', 'Team 2', 'Team 3'],
              onChanged: (value) {
                selectedOption1 = value;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Role',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              hint: 'Role',
              value: selectedOption2,
              items: ['Role A', 'Role B', 'Role C'],
              onChanged: (value) {
                selectedOption2 = value;
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Employee',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildDropdown(
              hint: 'Employee',
              value: selectedOption3,
              items: ['Employee X', 'Employee Y', 'Employee Z'],
              onChanged: (value) {
                selectedOption3 = value;
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _updateMonth(
                          DateTime(_focusedDay.year, _focusedDay.month - 1));
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(12, (index) {
                          DateTime month = DateTime(
                              _focusedDay.year, _focusedDay.month + index);
                          String monthAbbreviation =
                              DateFormat('MMM').format(month);

                          bool isSelected = _focusedDay.month == month.month;

                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 60,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blueAccent
                                    : Colors
                                        .transparent, // Blue background if selected
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color:
                                        isSelected ? Colors.blue : Colors.white,
                                    width: 1),
                              ),
                              child: Center(
                                child: Text(
                                  monthAbbreviation,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _updateMonth(
                          DateTime(_focusedDay.year, _focusedDay.month + 1));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                headingRowColor: WidgetStateProperty.all(Colors.deepPurple[50]),
                border: TableBorder.all(color: Colors.grey.shade300),
                columns: const [
                  DataColumn(
                    label: Text(
                      "Team",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Employee\nName",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Role",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Shift",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Time",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Map",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Value",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: contacttrackerdata
                    .map(
                      (data) => DataRow(
                        cells: [
                          DataCell(Text(data["Team"]!)),
                          DataCell(Text(data["employee"]!)),
                          DataCell(Text(data["Role"]!)),
                          DataCell(Text(data["Shift"]!)),
                          DataCell(Text(data["date"]!)),
                          DataCell(Text(data["time"]!)),
                          DataCell(Text(data["map"]!)),
                          DataCell(Text(data["value"]!)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignedTab() {
    return SingleChildScrollView(
      // Allow for scrollable content
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true, // Keeps the ListView size to its content
            physics:
                NeverScrollableScrollPhysics(), // Disable inner scroll, rely on parent scroll
            itemCount: assignedData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPointDetails(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Name on the left
                            Text(
                              assignedData[index]['name'] ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            // Positioned Chip on the right (next to the name)
                            Chip(
                              label: Text(
                                assignedData[index]['Status'] ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              backgroundColor: Colors.green,
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 2),
                            ),
                          ],
                        ),
                        Text(
                          'Team: ${assignedData[index]['team'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Region: ${assignedData[index]['region'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Territory: ${assignedData[index]['territory'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on,
                              size: 18,
                              color: Colors.blue,
                            ),
                            label: Text(
                              'Show on Maps',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              textStyle: TextStyle(fontSize: 14),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPendingThird() {
    return SingleChildScrollView(
      // Allow for scrollable content
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true, // Keeps the ListView size to its content
            physics:
                NeverScrollableScrollPhysics(), // Disable inner scroll, rely on parent scroll
            itemCount: dataforpending.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactPointDetailsApproval(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Name on the left
                            Text(
                              dataforpending[index]['team'] ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            // Positioned Chip on the right (next to the name)
                            Chip(
                              label: Text(
                                dataforpending[index]['Status'] ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              backgroundColor: Colors.orangeAccent[200],
                              padding: EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 4),
                            ),
                          ],
                        ),
                        Text(
                          'Role: ${dataforpending[index]['role'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Employee: ${dataforpending[index]['employee'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Date: ${dataforpending[index]['date'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on,
                              size: 18,
                              color: Colors.blue,
                            ),
                            label: Text(
                              'Show on Maps',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                              textStyle: TextStyle(fontSize: 14),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 0,
                          children: [
                            Chip(
                              label: Text(
                                dataforpending[index]['time'] ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              backgroundColor: Colors.blueGrey[100],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: BorderSide(
                                color: Colors.blueGrey,
                                width: 2,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Chip(
                              label: Text(
                                dataforpending[index]['location'] ?? '',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              backgroundColor: Colors.lightGreen[100],
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 2,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
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
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      items: items
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.blue,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
