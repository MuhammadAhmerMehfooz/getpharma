import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Mini_Event.dart';
import 'package:getpharma/Expenses/custom_alert.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkPlan extends StatefulWidget {
  final bool fromButton;

  const WorkPlan({super.key, required this.fromButton});

  @override
  State<WorkPlan> createState() => _WorkPlanState();
}

class _WorkPlanState extends State<WorkPlan> {
  int selectedIndex = 0;
  bool isTsmLogin = false; // Hardcoded for demo; set it to false for DSM login
  late DateTime selectedDay;
  late DateTime focusedDay;
  String? selectedButton;
  int _selectedSubTabIndex = 0; // Default to first tab
  bool isFirstCardTapped = false;
  bool isSecondCardTapped = false;
  bool isThirdCardTapped = false;
  bool isFourthCardTapped = false;

  final List<String> _tabTitles = [
    'All',
    'Pending',
    'Reworked',
    'Approved by me'
  ];

  @override
  void initState() {
    super.initState();
    selectedDay = DateTime.now();
    focusedDay = DateTime.now();
  }

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
              'Work Plan',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.share, color: Colors.white),
          //   onPressed: () {},
          // ),
          // IconButton(
          //   icon: Icon(Icons.notifications, color: Colors.white),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          // Primary Tabs (Always visible)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _buildPrimaryTabs(),
              ),
            ),
          ),

          // Additional Tabs (Only for DSM login)
          if (!isTsmLogin)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: _buildAdditionalTabs(),
              ),
            ),
          SizedBox(
            height: 20,
          ),
          if (selectedIndex == 0 || selectedIndex == 1) ...[
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                    ),
                    child: Text(
                      "Draft",
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Saved:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "January 2, 2025", // Example date, you can replace it with dynamic data
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (selectedIndex == 0) _MyWorkplan(),
            if (selectedIndex == 1) _Rework_Required(),
          ],
          if (selectedIndex == 2) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildForPending("All"),
                    SizedBox(width: 4),
                    _buildForPending("Pending"),
                    SizedBox(width: 4),
                    _buildForPending("Reworked"),
                    SizedBox(width: 4),
                    _buildForPending("Approved by me"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            // Display content based on _selectedSubTabIndex
            if (_selectedSubTabIndex == 0) _buildAllContent(),
            if (_selectedSubTabIndex == 1) _buildPendingContent(),
            if (_selectedSubTabIndex == 2) _buildReworkedContent(),
            if (_selectedSubTabIndex == 3) _buildApprovedByMeContent(),
          ],
          if (selectedIndex == 3) _build_For_My_Team(),
        ]),
      ),
      bottomNavigationBar: selectedIndex == 3
          ? null
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (selectedIndex == 2) ...[
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Rework';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedButton == 'Rework'
                            ? Colors.blue
                            : Colors.white70,
                        side: BorderSide(color: Colors.black, width: 2),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Rework',
                        style: TextStyle(
                          color: selectedButton == 'Rework'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Approve';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedButton == 'Approve'
                            ? Colors.blue
                            : Colors.white70,
                        side: BorderSide(color: Colors.black, width: 2),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Approve',
                        style: TextStyle(
                          color: selectedButton == 'Approve'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ] else ...[
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Save Plan';
                        });
                        showDialog(
                          context: context,
                          builder: (context) => CustomAlert(
                            text: 'Your plan has been saved',
                            type: 'success',
                          ),
                        ).then((_) {});
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Save Plan',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = selectedIndex == 1
                              ? 'Resubmit Plan'
                              : 'Submit Plan';
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomAlert(
                              text:
                                  'Your plan for January has been submitted to the assigned DSM Kashif Afridi',
                              type:
                                  'success', // You can set 'success' or 'error' based on your logic
                            );
                          },
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        selectedIndex == 1 ? 'Resubmit Plan' : 'Submit Plan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }

  ////////////////////////////////////////// Build Tabs and cards ////////////////////////////////////////////////

  List<Widget> _buildPrimaryTabs() {
    return [
      Expanded(child: _buildTab(0, "My Work Plan")),
      const SizedBox(width: 10),
      Expanded(child: _buildTab(1, "Rework Required", badgeCount: 3)),
    ];
  }

  List<Widget> _buildAdditionalTabs() {
    return [
      Expanded(
          child: _buildMoreTabs(2, "Pending For My Approval", badgeCount: 4)),
      const SizedBox(width: 10),
      Expanded(child: _buildMoreTabs(3, "My Teams Work Plan", badgeCount: 12)),
    ];
  }

  Widget _buildDateTab(String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        date,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildTab(int index, String title, {int? badgeCount}) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 170, // Set a fixed width for the container
        height: 60, // Set the same height for the container
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badgeCount != null)
              CircleAvatar(
                radius: 20, // Size of the avatar
                backgroundColor: isSelected
                    ? Colors.blue.shade700
                    : Colors.blue.shade50, // Background color of the avatar
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors
                            .black, // Matches the background color of the tab
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            if (badgeCount != null) const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
                overflow: TextOverflow.visible, // Allow text to wrap
                softWrap: true, // Enable wrapping
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoreTabs(int index, String title, {int? badgeCount}) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 60, // Set the same height for the container
        width: 170,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badgeCount != null)
              CircleAvatar(
                radius: 20, // Size of the avatar
                backgroundColor: isSelected
                    ? Colors.blue.shade700
                    : Colors.blue.shade50, // Background color of the avatar
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : Colors
                            .black, // Matches the background color of the tab
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            if (badgeCount != null) const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 13,
                ),
                overflow: TextOverflow.visible, // Allow text to wrap
                softWrap: true, // Enable wrapping
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String name, String plannedVisits, String frequency) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: 150, // Adjust this to control the width
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
              color: Colors.red[500],
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              plannedVisits,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            frequency,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRowForPending(
      String name, String plannedVisits, String frequency) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              plannedVisits,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            frequency,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ],
    );
  }

  TableRow _buildTableRowForMyTeam(
      String name, String plannedVisits, String frequency) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              plannedVisits,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            frequency,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildForPending(String title) {
    final isSelected = _selectedSubTabIndex == _tabTitles.indexOf(title);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSubTabIndex = _tabTitles.indexOf(title);
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.white : Colors.grey.shade700,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAllContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Showing all items",
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildPendingContent() {
    String? selectedOption1;
    String? selectedOption2;
    String? selectedOption3;

    List<String> options = ['Option 1', 'Option 2', 'Option 3'];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Teams",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption1,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption1 = value;
                      });
                    },
                    hint: Text(
                      "Select Team",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Role",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption2,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption2 = value;
                      });
                    },
                    hint: Text(
                      "Select Role",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Employee",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption3,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption3 = value;
                      });
                    },
                    hint: Text(
                      "Select Employee",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                    ),
                    child: Text(
                      "Draft",
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Saved:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "January 2, 2025", // Example date, you can replace it with dynamic data
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              color: Colors.white,
              child: TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.black),
                  defaultTextStyle: TextStyle(color: Colors.black),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.black),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  weekdayStyle:
                      TextStyle(color: Colors.white), // Text color for weekdays
                  weekendStyle: TextStyle(
                      color: Colors.white), // Text color for weekend days
                ),
                daysOfWeekHeight: 30,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Plan Calibration",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.orangeAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Unplanned Doctor",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Space between cards
                  Expanded(
                    child: Card(
                      color: Colors.blue[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Above Frequency",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Evenly space cards
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.green[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "As per frequency",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "12", // Example count
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Space between cards
                  Expanded(
                    child: Card(
                      color: Colors.red[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Below Frequency",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "12", // Example count
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(0.6),
                        2: FlexColumnWidth(1),
                      },
                      border: TableBorder.all(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 1),
                              child: Text(
                                "Planned Visits",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Frequency",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        _buildTableRowForPending("Alam Laghari", "3", "4"),
                        _buildTableRowForPending("Abbas", "2", "3"),
                        _buildTableRowForPending(
                            "Abdul Malik Shaikh", "1", "3"),
                        _buildTableRowForPending("A M Abdullah", "2", "4"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReworkedContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Showing reworked items",
        style: TextStyle(fontSize: 16, color: Colors.blue),
      ),
    );
  }

  Widget _buildApprovedByMeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "Showing items approved by me",
        style: TextStyle(fontSize: 16, color: Colors.green),
      ),
    );
  }

  Widget _MyWorkplan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (day) {
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              this.selectedDay = selectedDay;
              this.focusedDay = focusedDay;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MiniEvent(selectedDate: selectedDay),
              ),
            );
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            weekendTextStyle: TextStyle(color: Colors.black),
            defaultTextStyle: TextStyle(color: Colors.black),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            formatButtonTextStyle: TextStyle(color: Colors.black),
            formatButtonDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            formatButtonVisible: false,
            titleCentered: true,
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            weekdayStyle:
                TextStyle(color: Colors.white), // Text color for weekdays
            weekendStyle:
                TextStyle(color: Colors.white), // Text color for weekend days
          ),
          daysOfWeekHeight: 30,
        ),
        const SizedBox(height: 16.0),
        if (isTsmLogin)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Plan Calibration",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        if (isTsmLogin) const SizedBox(height: 16.0),
        if (isTsmLogin)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.orangeAccent[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: Container(
                      height: 60, // Fixed height for cards
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Unplanned Doctor",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            "12", // Example count
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Space between cards
                Expanded(
                  child: Card(
                    color: Colors.blue[100], // Card background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: Container(
                      height: 60, // Fixed height for cards
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Above Frequency",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "12", // Example count
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 10.0),
        if (isTsmLogin)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Evenly space cards
              children: [
                Expanded(
                  child: Card(
                    color: Colors.green[100], // Card background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: Container(
                      height: 60, // Fixed height for cards
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "As per frequency",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0), // Space between cards
                Expanded(
                  child: Card(
                    color: Colors.red[100], // Card background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: Container(
                      height: 60, // Fixed height for cards
                      width: 100,
                      alignment: Alignment.center,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Below Frequency",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (widget.fromButton && isTsmLogin == true)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(0.6),
                      2: FlexColumnWidth(1),
                    },
                    border: TableBorder.all(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors
                              .blue[100], // Light blue background for header
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 1.0),
                            child: Text(
                              "Planned Visits",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Frequency",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildTableRow("Alam Laghari", "3", "4"),
                      _buildTableRow("Abbas", "2", "3"),
                      _buildTableRow("Abdul Malik Shaikh", "1", "3"),
                      _buildTableRow("A M Abdullah", "2", "4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (widget.fromButton)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Comments",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        if (widget.fromButton)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 100,
                width: 500,
                child: Text(
                  'These are the remarks from DSM. Please address the highlighted issues before the next review.',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _Rework_Required() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 14.0, top: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rework Dates",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
          child: Row(
            children: [
              Expanded(
                child: _buildDateTab("4 Sep 2024"),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _buildDateTab("6 Sep 2024"),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _buildDateTab("8 Sep 2024"),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 14.0, top: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "DSM Remarks",
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
          child: Card(
            color: Colors.amber[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 100,
              child: Text(
                'These are the remarks from DSM. Please address the highlighted issues before the next review.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2020, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    this.selectedDay = selectedDay;
                    this.focusedDay = focusedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(color: Colors.black),
                  defaultTextStyle: TextStyle(color: Colors.black),
                ),
                headerStyle: HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonTextStyle: TextStyle(color: Colors.black),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  weekdayStyle:
                      TextStyle(color: Colors.white), // Text color for weekdays
                  weekendStyle: TextStyle(
                      color: Colors.white), // Text color for weekend days
                ),
                daysOfWeekHeight: 30,
              ),
              const SizedBox(height: 16.0), // Spacing between calendar and text
              if (isTsmLogin)
                Text(
                  "Plan Calibration",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              if (isTsmLogin)
                const SizedBox(height: 16.0), // Spacing between text and cards
              if (isTsmLogin)
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly space cards
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFirstCardTapped =
                                !isFirstCardTapped; // Toggle first card tap state
                          });
                        },
                        child: Card(
                          color:
                              Colors.orangeAccent[100], // Card background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              color: isFirstCardTapped
                                  ? Colors.orangeAccent.shade200
                                  : Colors
                                      .transparent, // Border color when tapped
                              width: 2.0, // Border width
                            ),
                          ),
                          elevation: 4.0,
                          child: Container(
                            height: 60, // Fixed height for cards
                            width: 100,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Unplanned Doctor",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        4.0), // Space between text and count
                                Text(
                                  "12", // Example count
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0), // Space between cards
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isSecondCardTapped =
                                !isSecondCardTapped; // Toggle second card tap state
                          });
                        },
                        child: Card(
                          color: Colors.blue[100], // Card background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              color: isSecondCardTapped
                                  ? Colors.blue
                                  : Colors
                                      .transparent, // Border color when tapped
                              width: 2.0, // Border width
                            ),
                          ),
                          elevation: 4.0,
                          child: Container(
                            height: 60, // Fixed height for cards
                            width: 100,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Above Frequency",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "12", // Example count
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 10.0),
              if (isTsmLogin)
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Evenly space cards
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isThirdCardTapped =
                                !isThirdCardTapped; // Toggle first card tap state
                          });
                        },
                        child: Card(
                          color: Colors.green[100], // Card background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              color: isThirdCardTapped
                                  ? Colors.green
                                  : Colors
                                      .transparent, // Border color when tapped
                              width: 2.0, // Border width
                            ),
                          ),
                          elevation: 4.0,
                          child: Container(
                            height: 60, // Fixed height for cards
                            width: 100,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "As per frequency",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "12", // Example count
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0), // Space between cards
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isFourthCardTapped =
                                !isFourthCardTapped; // Toggle second card tap state
                          });
                        },
                        child: Card(
                          color: Colors.red[100], // Card background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(
                              color: isFourthCardTapped
                                  ? Colors.red
                                  : Colors
                                      .transparent, // Border color when tapped
                              width: 2.0, // Border width
                            ),
                          ),
                          elevation: 4.0,
                          child: Container(
                            height: 60, // Fixed height for cards
                            width: 100,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Below Frequency",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "12", // Example count
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (isTsmLogin)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(0.6),
                      2: FlexColumnWidth(1),
                    },
                    border: TableBorder.all(
                      color: Colors.transparent,
                      style: BorderStyle.none,
                    ),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors
                              .blue[100], // Light blue background for header
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 1.0),
                            child: Text(
                              "Planned Visits",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Frequency",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      _buildTableRow("Alam Laghari", "3", "4"),
                      _buildTableRow("Abbas", "2", "3"),
                      _buildTableRow("Abdul Malik Shaikh", "1", "3"),
                      _buildTableRow("A M Abdullah", "2", "4"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: const Text(
            "Comments",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              height: 100,
              width: 500,
              child: Text(
                'These are the remarks from DSM. Please address the highlighted issues before the next review.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _build_For_My_Team() {
    String? selectedOption1;
    String? selectedOption2;
    String? selectedOption3;

    List<String> options = ['Option 1', 'Option 2', 'Option 3'];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Teams",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption1,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption1 = value;
                      });
                    },
                    hint: Text(
                      "Select Team",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Role",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption2,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption2 = value;
                      });
                    },
                    hint: Text(
                      "Select Role",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Employee",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    value: selectedOption3,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    items: options.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedOption3 = value;
                      });
                    },
                    hint: Text(
                      "Select Employee",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                    ),
                    child: Text(
                      "Draft",
                      style: TextStyle(
                        color: Colors.orange.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Last Saved:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "January 2, 2025", // Example date, you can replace it with dynamic data
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            TableCalendar(
              focusedDay: focusedDay,
              firstDay: DateTime.utc(2020, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              selectedDayPredicate: (day) {
                return isSameDay(selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  this.selectedDay = selectedDay;
                  this.focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.black),
                defaultTextStyle: TextStyle(color: Colors.black),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                formatButtonTextStyle: TextStyle(color: Colors.black),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                weekdayStyle:
                    TextStyle(color: Colors.white), // Text color for weekdays
                weekendStyle: TextStyle(
                    color: Colors.white), // Text color for weekend days
              ),
              daysOfWeekHeight: 30,
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Plan Calibration",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.orangeAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Unplanned Doctor",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Space between cards
                  Expanded(
                    child: Card(
                      color: Colors.blue[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Above Frequency",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "12", // Example count
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Evenly space cards
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.green[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "As per frequency",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "12", // Example count
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0), // Space between cards
                  Expanded(
                    child: Card(
                      color: Colors.red[100], // Card background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: Container(
                        height: 60, // Fixed height for cards
                        width: 100,
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Below Frequency",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "12", // Example count
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(0.6),
                        2: FlexColumnWidth(1),
                      },
                      border: TableBorder.all(
                        color: Colors.transparent,
                        style: BorderStyle.none,
                      ),
                      children: [
                        TableRow(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 0),
                              child: Text(
                                "Planned Visits",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Frequency",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        _buildTableRowForMyTeam("Alam Laghari", "3", "4"),
                        _buildTableRowForMyTeam("Abbas", "2", "3"),
                        _buildTableRowForMyTeam("Abdul Malik Shaikh", "1", "3"),
                        _buildTableRowForMyTeam("A M Abdullah", "2", "4"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
