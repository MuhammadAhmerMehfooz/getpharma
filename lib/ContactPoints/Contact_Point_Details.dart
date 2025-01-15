import 'package:flutter/material.dart';

class ContactPointDetails extends StatelessWidget {
  const ContactPointDetails({super.key});

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
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Contact Points Details',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Point Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildDetailRow("Team", "Leopard"),
                    _buildDivider(),
                    _buildDetailRow("Brick", "Gulshan"),
                    _buildDivider(),
                    _buildDetailRow("Region", "Gulshan-e-Iqbal"),
                    _buildDivider(),
                    _buildDetailRow("District", "Gulshan-e-Iqbal"),
                    _buildDivider(),
                    _buildDetailRow("Territory", "Karachi Central"),
                    _buildDivider(),
                    _buildDetailRow("Contact Point", "Disco Bakery - Gulshan"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
    );
  }
}

class NewContactPointDetails extends StatefulWidget {
  const NewContactPointDetails({super.key});

  @override
  _NewContactPointDetailsState createState() => _NewContactPointDetailsState();
}

class _NewContactPointDetailsState extends State<NewContactPointDetails> {
  String _selectedButton = '';

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
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'New Contact Points Request',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Contact Point Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    _buildDetailRow("Name", "M.Ahsan"),
                    _buildDivider(),
                    _buildDetailRow("Team", "Leopard - Malir"),
                    _buildDivider(),
                    _buildDetailRow("Role", "TSM"),
                    _buildDivider(),
                    _buildDetailRow("Employee", "Onsite"),
                    _buildDivider(),
                    _buildDetailRow("Date", "20-10-2025"),
                    _buildDivider(),
                    _buildDetailRow("Contact Point", "Bhitayi Medical Centre"),
                    _buildDivider(),
                    _buildDetailRow("City", "Karachi"),
                    _buildDivider(),
                    _buildDetailRow("Country", "Pakistan"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 'Reject';
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    _selectedButton == 'Reject' ? Colors.red : Colors.white,
                side: BorderSide(
                    color:
                        _selectedButton == 'Reject' ? Colors.red : Colors.black,
                    width: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Reject',
                style: TextStyle(
                  color:
                      _selectedButton == 'Reject' ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 'Approve';
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    _selectedButton == 'Approve' ? Colors.blue : Colors.white,
                side: BorderSide(
                    color: _selectedButton == 'Approve'
                        ? Colors.blue
                        : Colors.black,
                    width: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Approve',
                style: TextStyle(
                  color: _selectedButton == 'Approve'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
    );
  }
}

class ContactPointDetailsApproval extends StatefulWidget {
  const ContactPointDetailsApproval({super.key});

  @override
  _ContactPointDetailsApprovalState createState() =>
      _ContactPointDetailsApprovalState();
}

class _ContactPointDetailsApprovalState
    extends State<ContactPointDetailsApproval> {
  String _selectedButton = '';

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
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Contact Points Request',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Point Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    _buildDetailRow("Team", "Leopard - Malir"),
                    _buildDivider(),
                    _buildDetailRow("Role", "TSM"),
                    _buildDivider(),
                    _buildDetailRow("Employee", "Onsite"),
                    _buildDivider(),
                    _buildDetailRow("Date", "20-10-2025"),
                    _buildDivider(),
                    _buildDetailRow("Time", "On-Time"),
                    _buildDivider(),
                    _buildDetailRow("Location", "Off-Location"),
                    _buildDivider(),
                    _buildDetailRow("Contact Point", "Bhitayi Medical Centre"),
                    _buildDivider(),
                    _buildDetailRow("City", "Karachi"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 'Reject';
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    _selectedButton == 'Reject' ? Colors.red : Colors.white,
                side: BorderSide(
                    color:
                        _selectedButton == 'Reject' ? Colors.red : Colors.black,
                    width: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Reject',
                style: TextStyle(
                  color:
                      _selectedButton == 'Reject' ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  _selectedButton = 'Approve';
                });
              },
              style: OutlinedButton.styleFrom(
                backgroundColor:
                    _selectedButton == 'Approve' ? Colors.blue : Colors.white,
                side: BorderSide(
                    color: _selectedButton == 'Approve'
                        ? Colors.blue
                        : Colors.black,
                    width: 2),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Approve',
                style: TextStyle(
                  color: _selectedButton == 'Approve'
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1,
    );
  }
}
