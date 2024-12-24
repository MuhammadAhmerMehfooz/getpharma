import 'package:flutter/material.dart';

class AddToMylistDr extends StatefulWidget {
  const AddToMylistDr({super.key});

  @override
  State<AddToMylistDr> createState() => _AddToMylistDrState();
}

class _AddToMylistDrState extends State<AddToMylistDr> {
  String? drclass;
  String? drfrequency;

  List<String> BuisnessCards = [
    'assets/images/buisnesscard1.jpg',
    'assets/images/buisnesscard2.jpg',
    'assets/images/buisnesscard3.jpg',
    'assets/images/buisnesscard4.jpg',
  ];
  List<String> Clinicpics = [
    'assets/images/clicnic1.jpg',
    'assets/images/clicnic2.jpg',
    'assets/images/clicnic3.jpg',
    'assets/images/clicnic4.jpg',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Doctor Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Personal Details'),
            SizedBox(
              height: 8,
            ),
            buildDetailCard([
              {'Name': 'Abdul Sami Memon'},
              {'Phone Number': '0332 6667885'},
              {'CNIC Number': '12432-897900-4'},
              {'Gender': 'Male'},
            ]),
            const SizedBox(height: 16.0),
            buildSectionTitle('Professional Details'),
            SizedBox(
              height: 8,
            ),
            buildDetailCard([
              {'PMDC No.': '1235894-D'},
              {'Designation': 'Consultant'},
              {'Qualification': 'MBBS, MD'},
              {'Specialty': 'Cardiology'},
            ]),
            const SizedBox(height: 16.0),
            buildSectionTitle('Location Details'),
            SizedBox(
              height: 2,
            ),
            const SizedBox(height: 16.0),
            buildSectionTitle('Address 1'),
            SizedBox(
              height: 8,
            ),
            buildAddressCard({
              'Address': 'Bhitaye Medical Centre',
              'Brick': 'Nazimabad No.4',
              'City': 'Karachi'
            }),
            const SizedBox(height: 32.0),
            Center(
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.orange, width: 2),
                  padding: EdgeInsets.symmetric(vertical: 18, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Reduced border radius
                  ),
                ),
                onPressed: () {
                  // Add action for the button here
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.orange,
                  size: 20, // Adjust size as needed
                ),
                label: const Text(
                  'Add New Location',
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle('Class'),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: drclass,
              decoration: InputDecoration(
                labelText: 'Select Class',
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: [
                'A',
                'B',
                'C',
                'D',
              ]
                  .map((drclasstyoe) => DropdownMenuItem<String>(
                        value: drclasstyoe,
                        child: Text(drclasstyoe),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  drclass = value; // Dropdown value update
                });
              },
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle('Frequency'),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: drfrequency,
              decoration: InputDecoration(
                labelText: 'Select Frequency',
                labelStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: [
                '1',
                '2',
                '3',
                '4',
              ]
                  .map((Frequency) => DropdownMenuItem<String>(
                        value: Frequency,
                        child: Text(Frequency),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  drfrequency = value; // Dropdown value update
                });
              },
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle('Buisness Card Pictures'),
            const SizedBox(height: 16),
            Container(
              height: 150, // Container height for the images
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: BuisnessCards
                    .length, // This will be based on your asset list
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 300, // Width of each image container

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        BuisnessCards[index], // Image path from the assets
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),
            buildSectionTitle('Clinic Pictures'),
            const SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Clinicpics.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        Clinicpics[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cancel Button
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.black, width: 2),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Add to List Button
                OutlinedButton(
                  onPressed: () {
                    // Add action for add to list here
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    side: BorderSide(color: Colors.black, width: 2),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Add to My List',
                    style: TextStyle(
                      color: Colors.white,
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
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildDetailCard(List<Map<String, String>> details) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: details.map((detail) {
            final key = detail.keys.first;
            final value = detail.values.first;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    key,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget buildAddressCard(Map<String, String> address) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.blue, width: 2),
      ),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address['Address'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: const Text(
                    'Default',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Brick: ${address['Brick']}',
              style: const TextStyle(fontSize: 14.0),
            ),
            Text(
              'City: ${address['City']}',
              style: const TextStyle(fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue, size: 20.0),
                const SizedBox(width: 1.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove default padding
                    minimumSize: const Size(0, 0), // Shrink button size
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Show on Maps',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.0,
                    ),
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
