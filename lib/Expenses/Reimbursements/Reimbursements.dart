import 'package:flutter/material.dart';
import 'package:getpharma/Expenses/Reimbursements/Approval_Details.dart';
import 'package:getpharma/Expenses/Reimbursements/Reimbursements_Request.dart';

class Reimbursements extends StatefulWidget {
  const Reimbursements({super.key});

  @override
  State<Reimbursements> createState() => _ReimbursementsState();
}

class _ReimbursementsState extends State<Reimbursements> {
  String _selectedTab = "Reimbursements Request";
  bool _isReimbursements = false;

  List<Map<String, String>> data = [
    {
      'title': 'Selling Expenses',
      'status': 'Pending',
      'update': 'Read',
      'name': 'Kashif Afridi - DSM',
      'date': '04-Sep-2024',
      'amount': 'Rs. 4,000',
      'approver': 'SFE',
      'lastApproval': 'SM - Asad Baig',
      'approvalDate': '09 Sep 2024 - 08:25PM'
    },
    {
      'title': 'Travel Expenses',
      'status': 'Pending',
      'update': 'Unread',
      'name': 'Ali Zaman - Senior Manager',
      'date': '10-Sep-2024',
      'amount': 'Rs. 5,500',
      'approver': 'TFE',
      'lastApproval': 'SM - Adeel Khan',
      'approvalDate': '12 Sep 2024 - 09:30AM'
    },
    {
      'title': 'Office Supplies',
      'status': 'Pending',
      'update': 'Read',
      'name': 'Sara Ahmed - Admin',
      'date': '11-Sep-2024',
      'amount': 'Rs. 1,200',
      'approver': 'OFE',
      'lastApproval': 'SM - Asim Ali',
      'approvalDate': '13 Sep 2024 - 10:15AM'
    },
    {
      'title': 'Office Supplies',
      'status': 'Pending',
      'update': 'Read',
      'name': 'Sara Ahmed - Admin',
      'date': '11-Sep-2024',
      'amount': 'Rs. 1,200',
      'approver': 'OFE',
      'lastApproval': 'SM - Asim Ali',
      'approvalDate': '13 Sep 2024 - 10:15AM'
    },
    // Add more cards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Reimbursements',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 14),
            // Main Tabs
            _buildMainTabs(),
            const SizedBox(height: 20),
            if (_isReimbursements) _buildReimbursementTabs(),
            const SizedBox(height: 20),
            _buildReimbursementCards(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => (ReimbursementsRequest())),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                hintText: 'Search Here',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blueGrey[50],
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMainTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          _buildTab(
            "Reimbursements Request",
            _selectedTab == "Reimbursements Request"
                ? Colors.blue
                : Colors.grey[200]!,
            _selectedTab == "Reimbursements Request"
                ? Colors.white
                : Colors.black,
            () {
              setState(() {
                _selectedTab = "Reimbursements Request";
                _isReimbursements = true;
              });
            },
            badgeCount: 4, // Example badgeCount
            isSelected:
                _selectedTab == "Reimbursements Request", // Pass isSelected
          ),
          const SizedBox(width: 15),
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
                _isReimbursements = false;
              });
            },
            badgeCount: 12, // Example badgeCount
            isSelected:
                _selectedTab == "Pending For My Approval", // Pass isSelected
          ),
        ],
      ),
    );
  }

  Widget _buildReimbursementCards() {
    if (_selectedTab == "Pending For My Approval") {
      return Column(
        children:
            data.map((item) => _buildPendingCardforapproval(item)).toList(),
      );
    }
    if (!_isReimbursements) {
      return SizedBox.shrink();
    }

    return Column(
      children: data.map((item) => _buildPendingCard(item)).toList(),
    );
  }

  Widget _buildReimbursementTabs() {
    return Row(
      children: [
        const SizedBox(width: 30),
        _buildTabForReimbursements(
          "Pending",
          _selectedTab == "Pending" ? Colors.blue : Colors.grey[200]!,
          _selectedTab == "Pending" ? Colors.white : Colors.black,
          () {
            setState(() {
              _selectedTab = "Pending";
            });
          },
        ),
        const SizedBox(width: 30),
        _buildTabForReimbursements(
          "Approved",
          _selectedTab == "Approved" ? Colors.blue : Colors.grey[200]!,
          _selectedTab == "Approved" ? Colors.white : Colors.black,
          () {
            setState(() {
              _selectedTab = "Approved";
            });
          },
        ),
        const SizedBox(width: 30),
        _buildTabForReimbursements(
          "Rejected",
          _selectedTab == "Rejected" ? Colors.blue : Colors.grey[200]!,
          _selectedTab == "Rejected" ? Colors.white : Colors.black,
          () {
            setState(() {
              _selectedTab = "Rejected";
            });
          },
        ),
      ],
    );
  }

  Widget _buildPendingCard(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['title'] ?? 'Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100, // Background color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item['status'] ?? 'Status',
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
                item['name'] ?? 'Name',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Submission Date:\n04-Sep-2024"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Amount Claimed:",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[900]),
                      ),
                      Text(
                        item['amount'] ?? 'Amount',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pending Approval",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[900])),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApprovalDetailsScreen(),
                        ),
                      );
                    },
                    child: Text("Last Approval",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['approver'] ?? 'Approver',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApprovalDetailsScreen(),
                        ),
                      );
                    },
                    child: Text(item['lastApproval'] ?? 'Last Approval',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.blue)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApprovalDetailsScreen(),
                        ),
                      );
                    },
                    child: Text(item['approvalDate'] ?? 'approvalDate',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingCardforapproval(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['title'] ?? 'Title',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100, // Background color
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['status'] ?? 'Pending',
                          style: TextStyle(
                            backgroundColor: Colors.orange.shade100,
                            fontSize: 12,
                            color: Colors.orange.shade900, // Text color
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100, // Background color
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item['update'] ?? 'Read',
                          style: TextStyle(
                            backgroundColor: Colors.green.shade100,
                            fontSize: 12,
                            color: Colors.green.shade800, // Text color
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 1),
              Text(
                item['name'] ?? 'Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Submission Date:\n04-Sep-2024",
                    style: TextStyle(fontSize: 12),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Amount Claimed:",
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.grey[900]),
                      ),
                      Text(
                        item['amount'] ?? 'Amount',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(
    String title,
    Color bgColor,
    Color textColor,
    Function() onTap, {
    int? badgeCount,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: () {
        onTap(); // Call the onTap function passed to the widget
      },
      child: Container(
        width: 172, // Set a fixed width for the container
        height: 65, // Set the same height for the container
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.blue
              : bgColor, // Use bgColor passed to the widget
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badgeCount != null)
              CircleAvatar(
                radius: 20, // Size of the avatar
                backgroundColor: isSelected
                    ? Colors.blue.shade700
                    : Colors.blue.shade50, // Background color of the avatar
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            if (badgeCount != null) const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: textColor, // Use the passed textColor
                  fontSize: 13,
                ),
                overflow: TextOverflow.visible, // Allow text to wrap
                softWrap: true, // Enable wrapping
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabForReimbursements(
      String title, Color bgColor, Color textColor, Function onTap) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
