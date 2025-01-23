import 'package:flutter/material.dart';
import 'package:getpharma/CustomerList/All%20Customers/Details.dart';
import 'package:getpharma/CustomerList/All%20Customers/Edit_doctor_details.dart';

class AllCustomers extends StatefulWidget {
  const AllCustomers({super.key});

  @override
  State<AllCustomers> createState() => _AllCustomersState();
}

class _AllCustomersState extends State<AllCustomers> {
  String _selectedTab = "Chemists";

  List<Map<String, String>> doctors = [
    {
      "name": "Abdul Rauf",
      "specialty": "Physician - MBBS",
      "id": "1230135-D",
      "contact": "12432-897900-4",
      "additionalInfo": "9876543210",
    },
    {
      "name": "Abdullah",
      "specialty": "Physician - MBBS",
      "id": "1230135-D",
      "contact": "12432-897900-4",
      "additionalInfo": "9876543210",
    },
    {
      "name": "Abdullah",
      "specialty": "Physician - MBBS",
      "id": "1230135-D",
      "contact": "12432-897900-4",
      "additionalInfo": "9876543210",
    },
  ];

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
              'All Customers',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextField(
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        hintText: 'Search Here',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 3,
                      ),
                      _buildTab(
                        "Chemists",
                        _selectedTab == "Chemists"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Chemists" ? Colors.white : Colors.grey,
                        () {
                          setState(() {
                            _selectedTab = "Chemists";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      _buildTab(
                        "Doctors",
                        _selectedTab == "Doctors"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Doctors" ? Colors.white : Colors.grey,
                        () {
                          setState(() {
                            _selectedTab = "Doctors";
                          });
                        },
                      ),
                      SizedBox(width: 12),
                      _buildTab(
                        "Distributers",
                        _selectedTab == "Distributers"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Distributers"
                            ? Colors.white
                            : Colors.grey,
                        () {
                          setState(() {
                            _selectedTab = "Distributers";
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            if (_selectedTab == "Doctors") ...[
              _buildDoctorFields(),
              ...doctors
                  .map((doctor) => _DoctorCard(doctor, doctors.indexOf(doctor)))
                  .toList(),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildTab(
      String title, Color bgColor, Color textColor, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDoctorFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'City',
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Qualification',
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'PMDC No',
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Designation',
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Reset All',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _DoctorCard(Map<String, String> doctor, int index) {
    return Card(
      elevation: 6,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Picture
                Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12), // Rounded square
                    image: DecorationImage(
                      image: AssetImage('assets/images/square.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10), // Space between image and details
                // Doctor Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "No. $index",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100, // Background color
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              doctor['additionalInfo'] ??
                                  'N/A', // Default value
                              style: TextStyle(
                                backgroundColor: Colors.orange.shade100,
                                fontSize: 12,
                                color: Colors.orange.shade900, // Text color
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        doctor['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        doctor['specialty']!,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      Text(
                        doctor['contact']!,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Divider spanning the full width
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 10),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Details()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.grey, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Details",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditDoctorDetails()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_square,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Edit Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
