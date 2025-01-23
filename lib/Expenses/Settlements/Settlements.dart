import 'package:flutter/material.dart';
import 'package:getpharma/Expenses/Reimbursements/Approval_Details.dart';
import 'package:getpharma/Expenses/custom_alert.dart';

class Settlements extends StatefulWidget {
  const Settlements({super.key});

  @override
  State<Settlements> createState() => _SettlementsState();
}

class _SettlementsState extends State<Settlements> {
  String _selectedTab = "My Settlements";
  bool _isSettlements = true;
  String _selectedsubTabs = 'Pending';
  bool showCheckBox = false;
  bool isAllSelected = false;
  Map<int, bool> selectedItems = {};

  void _showRejectAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _buildRejectAlert(context);
      },
    );
  }

  Widget _buildRejectAlert(BuildContext context) {
    return _RejectAlert(
      onReject: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (context) => CustomAlert(
            text: "Settlement case has been rejected",
            type: "success",
          ),
        );
      },
      onCancel: () {
        Navigator.of(context).pop();
      },
    );
  }

  List<Map<String, String>> data = [
    {
      'id': '1',
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
      'id': '2',
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
      'id': '3',
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
      'id': '4',
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
  ];

  void initializeSelectedItems() {
    print("initializeSelectedItems");
    for (var item in data) {
      if (item['id'] != null) {
        selectedItems[int.parse(item['id']!)] = false;
      }
    }
  }

  void toggleAllSelection(bool? value) {
    setState(() {
      isAllSelected = value ?? false;
      for (var item in data) {
        selectedItems[int.parse(item['id']!)] = isAllSelected;
      }
    });
  }

  void toggleCardSelection(int id, bool? value) {
    print('toggle card hoa hai !!!!!!!!!!!!!!!!!!!!!!!!!!');
    setState(() {
      selectedItems[id] = value ?? false;
      isAllSelected = selectedItems.length == data.length &&
          selectedItems.values.every((isSelected) => isSelected);
    });
  }

  int _getSelectedItemsCount() {
    return selectedItems.values.where((isSelected) => isSelected).length;
  }

  @override
  void initState() {
    super.initState();
    initializeSelectedItems();
  }

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
              'Settlements',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
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
            if (_isSettlements) _buildReimbursementTabs(),
            const SizedBox(height: 20),
            _buildReimbursementCards(),
          ],
        ),
      ),
      bottomNavigationBar: showCheckBox
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: OutlinedButton(
                        onPressed: () {
                          if (_getSelectedItemsCount() > 1) {
                            showDialog(
                              context: context,
                              builder: (context) => CustomAlert(
                                text:
                                    "Multiple Requests cannot be rejected simultaneously",
                                type: "error",
                              ),
                            );
                          } else {
                            _showRejectAlert();
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white70,
                          side: const BorderSide(color: Colors.black, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Reject',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            showCheckBox = false;
                          });
                          showDialog(
                            context: context,
                            builder: (context) => CustomAlert(
                              text:
                                  "Settlement case has been approved & forwarded to DSM for approval",
                              type: "success",
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Approve',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                hintText: 'Search Here',
                hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.blueGrey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
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
          Expanded(
            child: _buildTab(
              "My Settlements",
              _selectedTab == "My Settlements" ? Colors.blue : Colors.white,
              _selectedTab == "My Settlements" ? Colors.white : Colors.black,
              () {
                setState(() {
                  _selectedTab = "My Settlements";
                  _isSettlements = true;
                  showCheckBox = false;
                  selectedItems.clear();
                  isAllSelected = false;
                });
              },
              badgeCount: 4,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildTab(
              "Pending For My Approval",
              _selectedTab == "Pending For My Approval"
                  ? Colors.blue
                  : Colors.white,
              _selectedTab == "Pending For My Approval"
                  ? Colors.white
                  : Colors.black,
              () {
                setState(() {
                  _selectedTab = "Pending For My Approval";
                  _isSettlements = false;
                });
              },
              badgeCount: 12, // Example badgeCount
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReimbursementCards() {
    if (_selectedTab == "Pending For My Approval") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                if (showCheckBox)
                  Checkbox(
                    value: isAllSelected,
                    activeColor: Colors.blue,
                    onChanged: toggleAllSelection,
                  ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCheckBox = !showCheckBox;
                    });
                  },
                  child: Text(
                    "Select",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children:
                data.map((item) => _buildPendingCardforapproval(item)).toList(),
          ),
        ],
      );
    }
    if (!_isSettlements) {
      return SizedBox.shrink();
    }

    return Column(
      children: data.map((item) => _buildPendingCard(item)).toList(),
    );
  }

  Widget _buildReimbursementTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Pending Tab
          Expanded(
            child: _buildTabForReimbursements(
              "Pending",
              _selectedsubTabs == "Pending" ? Colors.blue : Colors.white,
              _selectedsubTabs == "Pending" ? Colors.white : Colors.black,
              () {
                setState(() {
                  _selectedsubTabs = "Pending";
                });
              },
            ),
          ),
          // Approved Tab
          Expanded(
            child: _buildTabForReimbursements(
              "Approved",
              _selectedsubTabs == "Approved" ? Colors.blue : Colors.white,
              _selectedsubTabs == "Approved" ? Colors.white : Colors.black,
              () {
                setState(() {
                  _selectedsubTabs = "Approved";
                });
              },
            ),
          ),
          // Rework Tab
          Expanded(
            child: _buildTabForReimbursements(
              "Rework",
              _selectedsubTabs == "Rework" ? Colors.blue : Colors.white,
              _selectedsubTabs == "Rework" ? Colors.white : Colors.black,
              () {
                setState(() {
                  _selectedsubTabs = "Rework";
                });
              },
            ),
          ),
          // Settled Tab
          Expanded(
            child: _buildTabForReimbursements(
              "Settled",
              _selectedsubTabs == "Settled" ? Colors.blue : Colors.white,
              _selectedsubTabs == "Settled" ? Colors.white : Colors.black,
              () {
                setState(() {
                  _selectedsubTabs = "Settled";
                });
              },
            ),
          ),
        ],
      ),
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      item['status'] ?? 'Status',
                      style: TextStyle(
                        backgroundColor: Colors.orange.shade50,
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
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Submission Date:",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        item['date'] ?? 'Date',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[900]),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Amount Requested:",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        item['amount'] ?? 'Amount',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pending Approval:",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApprovalDetailsScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Last Approved:",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ApprovalDetailsScreen(),
                      //   ),
                      // );
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
          padding: EdgeInsets.only(
              left: showCheckBox ? 0.0 : 8.0,
              top: 10.0,
              bottom: 10.0,
              right: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showCheckBox)
                Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: Colors.blue,
                  visualDensity: VisualDensity.compact,
                  value: (item['id'] != null &&
                          selectedItems[int.parse(item['id']!)] != null)
                      ? selectedItems[int.parse(item['id']!)]
                      : false,
                  onChanged: (bool? value) {
                    if (item['id'] != null) {
                      toggleCardSelection(int.parse(item['id']!), value);
                    }
                  },
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'] ?? 'Title',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    Colors.orange.shade50, // Background color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['status'] ?? 'Pending',
                                style: TextStyle(
                                  backgroundColor: Colors.orange.shade50,
                                  fontSize: 12,
                                  color: Colors.orange.shade900, // Text color
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: item['update'] == 'Read'
                                    ? Colors.blue.shade50
                                    : Colors.green.shade50, // Background color
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                item['update'] ?? 'Read',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: item['update'] == 'Read'
                                      ? Colors.blue.shade900
                                      : Colors.green.shade900, // Text color
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Submission Date:",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              item['date'] ?? 'Date',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[900]),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Amount Requested:",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              item['amount'] ?? 'Amount',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[900]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
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
        onTap();
      },
      child: Container(
        width: 172,
        height: 65,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badgeCount != null)
              CircleAvatar(
                radius: 20,
                backgroundColor: _selectedTab == title
                    ? Colors.blue.shade400
                    : Colors.blue.shade50,
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: _selectedTab == title ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            if (badgeCount != null) const SizedBox(width: 6),
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                ),
                overflow: TextOverflow.visible,
                softWrap: true,
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
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style: TextStyle(color: textColor, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class _RejectAlert extends StatelessWidget {
  final VoidCallback onReject;
  final VoidCallback onCancel;

  const _RejectAlert({
    Key? key,
    required this.onReject,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add remarks for your rejection",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 41, 41, 41),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Write your remarks here...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onCancel();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    onReject();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Reject",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
