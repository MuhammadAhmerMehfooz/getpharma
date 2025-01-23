import 'package:flutter/material.dart';
import 'package:getpharma/CustomerList/My%20Doctors/Add_Doctor.dart';
import 'package:getpharma/CustomerList/My%20Doctors/Add_to_MyList_dr.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  // Controllers for each text field
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController pmdcController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();

  bool isSpecialPrescriber = false;
  List<Map<String, String>> doctorList = [];
  bool _isScrolled = false;

  void _searchDoctor() {
    // Dummy data for demonstration
    setState(() {
      doctorList = [
        {
          'name': 'Dr. John Doe',
          'specialty': 'Cardiologist',
          'contact': '123-456-7890',
          'id': '39409304-D'
        },
        {
          'name': 'Dr. Jane Smith',
          'specialty': 'Dermatologist',
          'contact': '987-654-3210',
          'id': '394055704-D'
        },
        {
          'name': 'Dr. Alice Johnson',
          'specialty': 'Pediatrician',
          'contact': '555-123-4567',
          'id': '3940788-D'
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Search Doctor",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            setState(() {
              _isScrolled = scrollNotification.metrics.pixels > 0;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                // Name field
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 320,
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2),

                // Special Prescriber Checkbox
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8, // Reducing the size of the checkbox
                      child: Checkbox(
                        value: isSpecialPrescriber,
                        onChanged: (bool? value) {
                          setState(() {
                            isSpecialPrescriber = value ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                    const Text(
                      'Special Prescriber',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'CNIC Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 320,
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: cnicController,
                      decoration: InputDecoration(
                        labelText: 'CNIC Number',
                        labelStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'PMDC Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 320,
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: pmdcController,
                      decoration: InputDecoration(
                        labelText: 'PMDC Number',
                        labelStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: SizedBox(
                    width: 320,
                    child: TextField(
                      cursorColor: Colors.blue,
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _searchDoctor,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                                color: Colors.lightGreen.shade900, width: 2)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Search",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: doctorList.length,
                  itemBuilder: (context, index) {
                    return _buildDoctorCard(
                        doctorList[index], index + 1, context);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _isScrolled
          ? Align(
              alignment: Alignment.bottomCenter, // Center the button
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  width: 250, // Increase the width as per your requirement
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddDoctor()),
                      );
                    },
                    backgroundColor: Colors.orange.shade400,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add New Doctor',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}

// Helper method to build a doctor card
Widget _buildDoctorCard(Map<String, String> doctorList, int index, context) {
  return Card(
    elevation: 8,
    color: Colors.white,
    margin: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/images/square.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          doctorList['id']!,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      doctorList['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      doctorList['specialty']!,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(doctorList['contact']!),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddToMylistDr()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.grey, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.details, color: Colors.grey),
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
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  side: BorderSide(color: Colors.blue, width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Add to my list",
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
