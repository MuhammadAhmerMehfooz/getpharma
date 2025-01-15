import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Activity_Event.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Add_Event.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Event.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Mini_Event.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Work_Plan.dart';
import 'package:intl/intl.dart';

class VisitDetails extends StatefulWidget {
  final DateTime selectedDate;
  const VisitDetails({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<VisitDetails> createState() => _VisitDetailsState();
}

class _VisitDetailsState extends State<VisitDetails> {
  int selectedIndex = 0;
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _firstDayOfWeek;
  late DateTime _lastDayOfWeek;

  final List<Map<String, dynamic>> morningActivities = [
    {
      "title": "Field Visit",
      "subtitle": "Abdul Sami Memon",
      "color": const Color.fromARGB(255, 228, 248, 229)
    },
    {
      "title": "Field Visit",
      "subtitle": "Abdul Rauf",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
    {
      "title": "Field Visit",
      "subtitle": "Farzana Shah",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
    {
      "title": "Marketing Activity",
      "subtitle": "Hospital",
      "color": const Color.fromARGB(255, 210, 217, 224)
    },
    {
      "title": "Field Visit",
      "subtitle": "Zubair Ahmed",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
    {
      "title": "Camp",
      "subtitle": "Hospital",
      "color": const Color.fromARGB(255, 243, 223, 225)
    },
    {
      "title": "Field Visit",
      "subtitle": "Saira",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
    {
      "title": "Field Visit",
      "subtitle": "Obaid Ullah",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
  ];

  final List<Map<String, dynamic>> eveningActivities = [
    {
      "title": "Camp",
      "subtitle": "Hospital",
      "color": const Color.fromARGB(255, 247, 217, 220)
    },
    {
      "title": "Field Visit",
      "subtitle": "Zainab Ahmed",
      "color": Color.fromARGB(255, 228, 248, 229)
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.selectedDate;
    _focusedDay = widget.selectedDate;

    // Calculate the first and last day of the week
    _firstDayOfWeek = _getFirstDayOfWeek(_focusedDay);
    _lastDayOfWeek = _getLastDayOfWeek(_focusedDay);
  }

  DateTime _getFirstDayOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  DateTime _getLastDayOfWeek(DateTime date) {
    return date.add(Duration(days: 7 - date.weekday));
  }

  void _updateWeek(DateTime newDate) {
    setState(() {
      _focusedDay = newDate;
      _firstDayOfWeek = _getFirstDayOfWeek(newDate);
      _lastDayOfWeek = _getLastDayOfWeek(newDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEvent(
                selectedDate: widget.selectedDate,
              ), // Replace `NextScreen` with the actual screen
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
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
                    _updateWeek(
                      DateTime(
                        _focusedDay.year,
                        _focusedDay.month - 1,
                      ),
                    );
                  },
                ),
                Text(
                  '${DateFormat.yMMMM().format(_focusedDay)}', // Month Name and Year
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _updateWeek(
                      DateTime(
                        _focusedDay.year,
                        _focusedDay.month + 1,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map((day) => Text(
                        day,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ))
                  .toList(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(7, (index) {
                DateTime dayOfWeek = _firstDayOfWeek.add(Duration(days: index));
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = dayOfWeek;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: isSameDay(_selectedDay, dayOfWeek)
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${dayOfWeek.day}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSameDay(_selectedDay, dayOfWeek)
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.grey.shade200,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildToggleButton("Morning", 0),
                      _buildToggleButton("Evening", 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedIndex == 0
                  ? morningActivities.length
                  : eveningActivities.length,
              itemBuilder: (context, index) {
                final activity = selectedIndex == 0
                    ? morningActivities[index]
                    : eveningActivities[index];
                return _buildActivityCard(
                  index: index + 1,
                  title: activity["title"],
                  subtitle: activity["subtitle"],
                  color: activity["color"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Widget _buildToggleButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        width: 150.0,
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.all(
            const Radius.circular(8.0),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required int index,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ActivityEvent(
              selectedDate: widget.selectedDate,
            ),
          ),
        );
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Adjust padding for overall alignment
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 8.0), // Move the text slightly to the right
          child: SizedBox(
            width: 75, // Adjust width as needed
            child: Text(
              "Activity No.$index",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11, // Maintain readable font size
              ),
              softWrap: true,
              overflow: TextOverflow.ellipsis, // Handle text overflow
            ),
          ),
        ),
        title: Container(
          margin: const EdgeInsets.only(right: 0.0),
          padding: const EdgeInsets.only(left: 12.0, top: 6.0, right: 8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Container(
          margin: const EdgeInsets.only(right: 0.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
          padding: const EdgeInsets.only(left: 12.0, bottom: 6.0, right: 8.0),
          child: Text(
            subtitle,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12),
          ),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.blue,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          Text(
            'Work Plan',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
