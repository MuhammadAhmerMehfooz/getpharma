import 'package:flutter/material.dart';

class ContactPointMap extends StatefulWidget {
  const ContactPointMap({super.key});

  @override
  State<ContactPointMap> createState() => _ContactPointMapState();
}

class _ContactPointMapState extends State<ContactPointMap> {
  String? _selectedButton;

  List<Map<String, String>> locations = [
    {'name': 'Al-Asif Square', 'contactPoint': 'Contact Point No.1'},
    {'name': 'Empress Market', 'contactPoint': 'Contact Point No.2'},
    {'name': 'Do Darya', 'contactPoint': 'Contact Point No.3'},
    {'name': 'Taj COmplex', 'contactPoint': 'Contact Point No.4'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // title: Text('Morning Contact Point'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200], // Placeholder for map
              child: Center(
                child: Text(
                  'Map Placeholder',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    // Icon(
                    //   Icons.linear_scale,
                    //   color: Colors.grey,
                    //   size: 40,
                    // ),
                    // SizedBox(height: 8),
                    Text(
                      'Morning Contact Point',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  onTap: () {
                    _showBottomSheet(context, locations);
                  },
                  decoration: InputDecoration(
                    labelText: 'Location',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        _showManualDialog(context);
                        setState(() {
                          _selectedButton = 'Set Manually';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _selectedButton == 'Set Manually'
                            ? Colors.blue
                            : Colors.white,
                        side: BorderSide(
                            color: _selectedButton == 'Set Manually'
                                ? Colors.blue
                                : Colors.black,
                            width: 2),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Set Manually',
                        style: TextStyle(
                          color: _selectedButton == 'Set Manually'
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
                          _selectedButton = 'Confirm';
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: _selectedButton == 'Confirm'
                            ? Colors.blue
                            : Colors.white,
                        side: BorderSide(
                            color: _selectedButton == 'Confirm'
                                ? Colors.blue
                                : Colors.black,
                            width: 2),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: _selectedButton == 'Confirm'
                              ? Colors.white
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
      BuildContext context, List<Map<String, String>> locations) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true, // Allows the modal to resize dynamically
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align items to the start
              children: [
                Center(
                  child: Text(
                    'Morning Contact Point',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 12),
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    hintText: 'Search location',
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onTap: () {
                    // This ensures modal adjusts upward on keyboard appearance
                    Future.delayed(Duration(milliseconds: 100), () {
                      setState(() {});
                    });
                  },
                ),
                SizedBox(height: 12),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.location_on, color: Colors.blue),
                  label: Text(
                    'Set on Maps',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Divider(),
                // Add multiple items dynamically
                ListView.builder(
                  shrinkWrap:
                      true, // Ensures proper sizing inside the bottom sheet
                  itemCount: locations.length,
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents extra scrolling
                  itemBuilder: (context, index) {
                    final location = locations[index];
                    return ListTile(
                      leading: Icon(Icons.access_time, color: Colors.grey),
                      title: Text(
                        location['name'] ?? 'Unknown Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle:
                          Text(location['contactPoint'] ?? 'No Contact Info'),
                      onTap: () {},
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showManualDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Center(
            child: Text(
              'Out of Range',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          content: SingleChildScrollView(
            // Wrap the content in a scroll view
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.track_changes),
                    labelText: 'Enter Location',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Pin Location',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Time',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.timelapse),
                    labelText: 'Enter Time',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Comments',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  cursorColor: Colors.blue,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Enter a description',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    ' Submit Request for approval',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
