import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Work%20Plan/Work_Plan.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  final dynamic selectedDate;
  const AddEvent({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  @override
  Widget build(BuildContext context) {
    String? _selectedTime = "Morning";
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
                    ],
                    onChanged: (value) {},
                  ),
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
                    onChanged: (value) {},
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
                                  ? Colors.orangeAccent
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: _selectedTime == "Morning"
                                  ? Border.all(color: Colors.orange)
                                  : Border.all(color: Colors.white),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_sunny_outlined,
                                  size: 18,
                                  color: _selectedTime == "Morning"
                                      ? Colors.deepOrange.shade900
                                      : Colors.black,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Morning',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _selectedTime == "Morning"
                                        ? Colors.deepOrange.shade900
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
                              border: Border.all(color: Colors.grey.shade300),
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
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          10), // Match TextField border radius
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
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkPlan(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade500,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Add Event',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
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
      elevation: 4.0,
    );
  }
}
