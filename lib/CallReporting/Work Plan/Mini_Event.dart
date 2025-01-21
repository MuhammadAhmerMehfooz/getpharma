import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Event.dart';
import 'package:intl/intl.dart';

class MiniEvent extends StatefulWidget {
  final DateTime selectedDate;

  MiniEvent({required this.selectedDate});

  @override
  State<MiniEvent> createState() => _MiniEventState();
}

class _MiniEventState extends State<MiniEvent> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late DateTime _firstDayOfWeek;
  late DateTime _lastDayOfWeek;

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
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Work Plan',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.copy_rounded, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Month Header with Navigation
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

          // Weekday Labels
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

          // Week View (Dates)
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
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 50,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Schedule your event for today ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Event(selectedDate: _selectedDay),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.blue),
                    child: Text(
                      'Add Event',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
