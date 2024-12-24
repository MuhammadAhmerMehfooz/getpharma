import 'package:flutter/material.dart';
import 'package:getpharma/CustomerList/My%20Doctors/Remove_Doctor.dart';
import 'package:getpharma/CustomerList/My%20Doctors/Search_Doctor.dart';

class MyDoctors extends StatefulWidget {
  const MyDoctors({super.key});

  @override
  State<MyDoctors> createState() => _MyDoctorsState();
}

class _MyDoctorsState extends State<MyDoctors> {
  TextEditingController _searchController = TextEditingController();
  String _selectedTab = "My List";
  bool _isRequestSelected = false;
  bool _isPendingApproval = false;

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
      "name": "Abdullah",
      "specialty": "Physician - MBBS",
      "id": "1230135-D",
      "contact": "12432-897900-4",
      "additionalInfo": "9876543210",
    },
  ];

  /////////////////////////////////////////// UI //////////////////////////////////////////////////////

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
      body: SingleChildScrollView(
        child: Column(
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
                        hintText: 'Search Here',
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
                      _buildTab(
                        "My List",
                        _selectedTab == "My List"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "My List" ? Colors.white : Colors.black,
                        () {
                          setState(() {
                            _selectedTab = "My List";
                            _isRequestSelected = false;
                            _isPendingApproval = false;
                          });
                        },
                      ),
                      SizedBox(width: 20),
                      _buildTab(
                        "My Requests",
                        _selectedTab == "My Requests"
                            ? Colors.blue
                            : Colors.grey[200]!,
                        _selectedTab == "My Requests"
                            ? Colors.white
                            : Colors.black,
                        () {
                          setState(() {
                            _selectedTab = "My Requests";
                            _isRequestSelected = true;
                            _isPendingApproval = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            _buildTab(
              "Pending For My Approval",
              _selectedTab == "Pending For My Approval"
                  ? Colors.blue
                  : Colors.grey[200]!,
              _selectedTab == "Pending For My Approval"
                  ? Colors.white
                  : Colors.black,
              () {
                setState(() {
                  _selectedTab = "Pending For My Approval";
                  _isRequestSelected = false;
                  _isPendingApproval = true;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            if (_isRequestSelected) ...[
              // Additional tabs shown only when "My Requests" is selected
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(width: 20),
                  _buildTab_for_request(
                    "All",
                    _selectedTab == "All" ? Colors.blue : Colors.grey[200]!,
                    _selectedTab == "All" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "All";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_request(
                    "Pending",
                    _selectedTab == "Pending" ? Colors.blue : Colors.grey[200]!,
                    _selectedTab == "Pending" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Pending";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_request(
                    "Approved",
                    _selectedTab == "Approved"
                        ? Colors.blue
                        : Colors.grey[200]!,
                    _selectedTab == "Approved" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Approved";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_request(
                    "Rejected",
                    _selectedTab == "Rejected"
                        ? Colors.blue
                        : Colors.grey[200]!,
                    _selectedTab == "Rejected" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Rejected";
                      });
                    },
                  ),
                ],
              ),
            ],
            SizedBox(
              height: 10,
            ),
            if (_isPendingApproval) ...[
              SizedBox(height: 12),
              Row(
                children: [
                  SizedBox(width: 20),
                  _buildTab_for_pending_approval(
                    "All",
                    _selectedTab == "All" ? Colors.blue : Colors.grey[200]!,
                    _selectedTab == "All" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "All";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_pending_approval(
                    "Pending",
                    _selectedTab == "Pending" ? Colors.blue : Colors.grey[200]!,
                    _selectedTab == "Pending" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Pending";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_pending_approval(
                    "Approved",
                    _selectedTab == "Approved"
                        ? Colors.blue
                        : Colors.grey[200]!,
                    _selectedTab == "Approved" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Approved";
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  _buildTab_for_pending_approval(
                    "Rejected",
                    _selectedTab == "Rejected"
                        ? Colors.blue
                        : Colors.grey[200]!,
                    _selectedTab == "Rejected" ? Colors.white : Colors.black,
                    () {
                      setState(() {
                        _selectedTab = "Rejected";
                      });
                    },
                  ),
                ],
              ),
            ],
            if (_selectedTab == "All" && _isPendingApproval == false) ...[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildCardForRequests(doctors[index], index + 1);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12);
                },
              ),
            ] else if (_selectedTab == "Pending")
              ...[
            ] else if (_selectedTab == "Approved")
              ...[
            ] else if (_selectedTab == "Rejected")
              ...[],

            if (_selectedTab == "All" && _isPendingApproval == true) ...[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildCardForApprovals(doctors[index], index + 1);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12);
                },
              ),
            ] else if (_selectedTab == "Pending")
              ...[
            ] else if (_selectedTab == "Approved")
              ...[
            ] else if (_selectedTab == "Rejected")
              ...[],

            SizedBox(height: 10),
            if (_selectedTab == "My List") ...[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildDoctorCard(doctors[index], index + 1);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
              SizedBox(
                height: 24,
              ),
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
            ] else if (_selectedTab == "My Requests") ...[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildCardForRequests(doctors[index], index + 1);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            ] else if (_selectedTab == "Pending For My Approval") ...[
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return _buildCardForApprovals(doctors[index], index + 1);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
              ),
            ],
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  /////////////////////////////////////// BUILDS CARDS /////////////////////////////////////////////////////////////

  Widget _buildTab(
      String title, Color bgColor, Color textColor, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
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

  Widget _buildTab_for_request(
      String title, Color bgColor, Color textColor, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

  Widget _buildTab_for_pending_approval(
      String title, Color bgColor, Color textColor, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

  // Helper method to build a doctor card
  Widget _buildDoctorCard(Map<String, String> doctor, int index) {
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
                      MaterialPageRoute(builder: (context) => RemoveDoctor()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove, // Icon for the "Remove" button
                        color: Colors.white,
                      ),
                      SizedBox(
                          width: 8), // Spacing between the icon and the text
                      Text(
                        "Remove",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.black, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_location,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Add Location",
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

  Widget _buildCardForRequests(Map<String, String> doctor, int index) {
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
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(
                                  30), // Circular background
                            ),
                            child: Text(
                              'Pending', // Handle null value
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors
                                    .orange[900], // You can change the color
                              ),
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
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pending Approval:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Last Approval:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SFE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'SM - Asad Baig',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '09 Sep 2024 - 08:25 Pm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardForApprovals(Map<String, String> doctor, int index) {
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
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(
                                      30), // Circular background
                                ),
                                child: Text(
                                  'Pending', // Handle null value
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.orange[
                                        900], // You can change the color
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  'Read',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[900],
                                  ),
                                ),
                              ),
                            ],
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
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pending Approval:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Last Approval:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SFE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                Text(
                  'SM - Asad Baig',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '09 Sep 2024 - 08:25 Pm',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
