import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Notification',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              // Today's Notification
              const Card(
                elevation: 8,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        'Shipment received',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'A new shipment with Tracking ID: 456890 has been received and is pending your review. Please take the necessary action.',
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '2 hours ago',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              const Text(
                'Yesterday',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),

              const SizedBox(height: 20.0),

              // Yesterday's Notification
              const Card(
                elevation: 8,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.0),
                      Text(
                        'Outstanding Advance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'An outstanding request has been received from Admin and requires your immediate attention. Please review and proceed with the necessary steps.',
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        "26 Sep 2024",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Other Notifications
              _buildNotificationCard(
                '26 Sep 2024',
                'Selling & Marketing Expenses',
                'Expense claim has been submitted by DSM Kashif Afridi for approval.',
              ),
              const SizedBox(height: 10.0),
              _buildNotificationCard(
                '25 Sep 2024',
                'Doctor\'s Approval Request',
                'You have received a request for doctor\'s approval. Please review and take the necessary action.',
              ),
              const SizedBox(height: 10.0),
              _buildNotificationCard(
                '09 Sep 2024',
                'Doctor\'s Approval Request',
                'You have received a request for doctor\'s approval. Please review and take the necessary action.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(String date, String title, String description) {
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(description),
            const SizedBox(height: 5.0),
            Text(
              date,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
