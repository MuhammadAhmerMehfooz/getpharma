import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Visit_details.dart';
import 'package:intl/intl.dart';

class ActivityEvent extends StatefulWidget {
  final DateTime selectedDate;
  const ActivityEvent({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<ActivityEvent> createState() => _ActivityEventState();
}

class _ActivityEventState extends State<ActivityEvent> {
  String? selectedActivity;
  String? selectedBrick;
  String? _selectedTime = "Morning";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Text(
                DateFormat('dd MMM yyyy').format(widget.selectedDate),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 6),
                    child: Text(
                      'Add Event',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 8),
                    child: Text(
                      'Activity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    icon: const SizedBox.shrink(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Icon(
                          Icons.work_outline,
                          color: Colors.grey,
                        ),
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    hint: const Text('Select Activity'),
                    items: const [
                      DropdownMenuItem(
                          value: 'Field Visit', child: Text('Field Visit')),
                      DropdownMenuItem(
                          value: 'Meeting', child: Text('Meeting')),
                      DropdownMenuItem(
                          value: ' Marketing Activity',
                          child: Text('Marketing Activity')),
                      DropdownMenuItem(
                          value: ' Mega Camp', child: Text('Mega Camp')),
                      DropdownMenuItem(
                          value: ' Conferences ', child: Text('Conferences')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedActivity = value as String?;
                        if (selectedActivity != 'Field Visit') {
                          selectedBrick =
                              null; // Reset Brick if not Field Visit
                        }
                      });
                    },
                  ),
                  if (selectedActivity == 'Field Visit') ...[
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Brick',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      icon: const SizedBox.shrink(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(
                            Icons.work_outline,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text('Select Brick'),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Field Visit',
                          child: Text('Field Visit'),
                        ),
                        DropdownMenuItem(
                          value: 'Meeting',
                          child: Text('Meeting'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedBrick = value as String?;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Doctor',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      icon: SizedBox.shrink(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(
                            Icons.work_outline,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: const Text('Select Doctor'),
                      items: const [
                        DropdownMenuItem(
                            value: 'Abdul Sami Memon',
                            child: Text('Abdul Sami Memon')),
                        DropdownMenuItem(
                            value: 'Option 2', child: Text('Option 2')),
                      ],
                      onChanged: (value) {},
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Class',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'A',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Doctor\'s Address',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                      icon: SizedBox.shrink(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Icon(
                            Icons.work_outline,
                            color: Colors.grey,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      hint: const Text('Select Adress'),
                      items: const [
                        DropdownMenuItem(
                            value: 'Option 1', child: Text('Option 1')),
                        DropdownMenuItem(
                            value: 'Option 2', child: Text('Option 2')),
                      ],
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'View on Maps',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                  const Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 8),
                    child: Text(
                      'Call Time',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTime = 'Morning';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: _selectedTime == "Morning"
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: _selectedTime == "Morning"
                                  ? Border.all(color: Colors.blue)
                                  : Border.all(color: Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 18,
                                  color: _selectedTime == "Morning"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Morning',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _selectedTime == "Morning"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTime = "Evening";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: _selectedTime == "Evening"
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: _selectedTime == "Evening"
                                  ? Border.all(color: Colors.blue)
                                  : Border.all(color: Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.nights_stay_outlined,
                                  size: 18,
                                  color: _selectedTime == "Evening"
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Evening',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _selectedTime == "Evening"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child: TextField(
                      cursorColor: Colors.blue,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        alignLabelWithHint: true,
                        hintText: 'Enter a description...',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        items: [
          BottomNavigationBarItem(
            icon: Container(
              width: 150, // Makes the button rectangular
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(
                        vertical: 10), // Makes the button taller
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 150, // Makes the button rectangular
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisitDetails(
                        selectedDate: widget.selectedDate,
                      ), // Replace `NextScreen` with the actual screen
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(
                        vertical: 10), // Makes the button taller
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade500,
      title: const Text(
        'Work Plan',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        tooltip: 'Back',
        onPressed: () {},
        padding: EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(),
        color: Colors.white,
      ),
      leadingWidth: 32,
      actions: [
        IconButton(
          icon: const Icon(Icons.local_hospital),
          tooltip: 'Doctor',
          onPressed: () {},
          color: Colors.white,
        ),
      ],
      elevation: 4.0,
    );
  }
}
