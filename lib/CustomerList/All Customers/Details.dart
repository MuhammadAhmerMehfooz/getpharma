import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
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
            const SizedBox(height: 16.0),
            buildSectionTitle('Address 2'),
            SizedBox(
              height: 8,
            ),
            buildAddressCard2({
              'Address': 'Agha Khan Hospital',
              'Brick': 'Gulshan e Iqbal',
              'City': 'Karachi'
            }),
            const SizedBox(height: 16),
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
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
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
          children: List.generate(details.length, (index) {
            final detail = details[index];
            final key = detail.keys.first;
            final value = detail.values.first;

            return Column(
              children: [
                Padding(
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
                ),
                // Add a divider only if it's not the last item
                if (index < details.length - 1) Divider(),
              ],
            );
          }),
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

  Widget buildAddressCard2(Map<String, String> address) {
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
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Text(
                    'Not Default',
                    style: TextStyle(
                      color: Colors.blueGrey,
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
