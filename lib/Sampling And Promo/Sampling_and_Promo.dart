import 'package:flutter/material.dart';

class SamplingAndPromo extends StatefulWidget {
  const SamplingAndPromo({super.key});

  @override
  State<SamplingAndPromo> createState() => _SamplingAndPromoState();
}

class _SamplingAndPromoState extends State<SamplingAndPromo> {
  String selectedButton = "To Be Received";

  // Sample data
  final List<Map<String, dynamic>> toBeReceivedData = [
    {
      "trackingId": "456890",
      "quantity": 40,
      "shipmentDate": "18 Sep 2024",
      "lastSavedOn": "09 Sep 2024 - 08:25 PM",
      "status": "Partially Received",
    },
    {
      "trackingId": "456891",
      "quantity": 30,
      "shipmentDate": "20 Sep 2024",
      "lastSavedOn": "10 Sep 2024 - 02:15 PM",
      "status": "Not Received",
    },
  ];
  final List<Map<String, dynamic>> receivedData = [
    {
      "trackingId": "456890",
      "shipmentDate": "18 Sep 2024",
      "receivedDate": "24 Sep 2024",
    },
    // Add more items as needed
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
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
            const Text(
              'Sampling And Promo',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Search Here',
                  hintStyle: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildButton("To Be Received",
                      isSelected: selectedButton == "To Be Received"),
                  _buildButton("Received",
                      isSelected: selectedButton == "Received"),
                ],
              ),
              const SizedBox(height: 20),
              if (selectedButton == "To Be Received") ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: toBeReceivedData.length,
                  itemBuilder: (context, index) {
                    var item = toBeReceivedData[index];
                    return _buildToBeReceivedCard(index, item);
                  },
                ),
              ] else if (selectedButton == "Received") ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: receivedData.length,
                  itemBuilder: (context, index) {
                    var item = receivedData[index];
                    return _buildReceivedCard(index, item);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String title, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = title; // Update the selected button
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToBeReceivedCard(int index, Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tracking ID: ${item["trackingId"]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: item["status"] == "Not Received"
                        ? Colors.red[100]
                        : Colors.orange[100],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(
                    item["status"],
                    style: TextStyle(
                      color: item["status"] == "Not Received"
                          ? Colors.red
                          : Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quantity:',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                Text(
                  'Shipment Date:',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item["quantity"]}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  item["shipmentDate"],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(thickness: 1.0),
            Row(
              children: [
                Text(
                  'Last Saved On:',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                const SizedBox(width: 4.0),
                Text(
                  item["lastSavedOn"],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceivedCard(int index, Map<String, dynamic> item) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tracking ID: ${item["trackingId"]}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipment Date:',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                Text(
                  'Received Date:',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item["shipmentDate"],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  item["receivedDate"],
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }
}
