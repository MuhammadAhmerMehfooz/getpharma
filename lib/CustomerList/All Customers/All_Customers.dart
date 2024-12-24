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
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        prefixIcon: Icon(Icons.search, color: Colors.blue),
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
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildTab(
                        "Chemists",
                        _selectedTab == "Chemists"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Chemists"
                            ? Colors.white
                            : Colors.black,
                        () {
                          setState(() {
                            _selectedTab = "Chemists";
                          });
                        },
                      ),
                      SizedBox(width: 12),
                      _buildTab(
                        "Doctors",
                        _selectedTab == "Doctors"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Doctors" ? Colors.white : Colors.black,
                        () {
                          setState(() {
                            _selectedTab = "Doctors";
                          });
                        },
                      ),
                      SizedBox(width: 14),
                      _buildTab(
                        "Distributers",
                        _selectedTab == "Distributers"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "Distributers"
                            ? Colors.white
                            : Colors.black,
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
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildDoctorFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'City',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Qualification',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'PMDC No',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              labelText: 'Designation',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
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
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            doctor['additionalInfo'] ??
                                'N/A', // Handle null value
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange, // You can change the color
                            ),
                          ),
                        ],
                      ),
                      Text(
                        doctor['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Text(doctor['specialty']!),
                      Text(doctor['contact']!),
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.black, width: 2),
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.black, width: 2),
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
