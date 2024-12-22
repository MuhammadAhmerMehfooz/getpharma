import 'package:flutter/material.dart';
import 'package:getpharma/CustomerList/My%20Doctors/Search_Doctor.dart';

class MyDoctors extends StatefulWidget {
  const MyDoctors({super.key});

  @override
  State<MyDoctors> createState() => _MyDoctorsState();
}

class _MyDoctorsState extends State<MyDoctors> {
  TextEditingController _searchController = TextEditingController();

  // Sample data for doctors
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
      "name": "No. 2 Abdullah",
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
              'My Doctor List',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    cursorColor: Colors.blue,
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Doctors...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
          // Tabs for "My List" and "My Requests"
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    _buildTab("My List", Colors.blue, Colors.white),
                    SizedBox(width: 20),
                    _buildTab("My Requests", Colors.grey[200]!, Colors.black),
                  ],
                ),
                SizedBox(height: 12),
                _buildTab(
                    "Pending For My Approval", Colors.grey[200]!, Colors.black),
              ],
            ),
          ),
          SizedBox(height: 10),
          // Doctor Cards
          Expanded(
            child: ListView.separated(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                return _buildDoctorCard(doctors[index], index + 1);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 16); // Adds space between each item
              },
            ),
          ),

          // Floating Action Button
          Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchDoctor()),
                  );
                },
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a tab
  Widget _buildTab(String title, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  // Helper method to build a doctor card
  Widget _buildDoctorCard(Map<String, String> doctor, int index) {
    print("Doctor $index Additional Info: ${doctor['additionalInfo']}");
    print(doctor);
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Smaller border radius
                    ),
                    side: BorderSide(
                        color: Colors.red, width: 2), // Outline color and width
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove, // Icon for the "Remove" button
                        color: Colors.red,
                      ),
                      SizedBox(
                          width: 8), // Spacing between the icon and the text
                      Text(
                        "Remove",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green[100],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Smaller border radius
                    ),
                    side: BorderSide(
                        color: Colors.green,
                        width: 2), // Outline color and width
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons
                            .add_location, // Icon for the "Add Location" button
                        color: Colors.green,
                      ),
                      SizedBox(
                          width: 8), // Spacing between the icon and the text
                      Text(
                        "Add Location",
                        style: TextStyle(color: Colors.green),
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
