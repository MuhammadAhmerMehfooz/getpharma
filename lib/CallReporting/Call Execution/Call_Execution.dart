import 'package:flutter/material.dart';
import 'package:getpharma/CallReporting/Call%20Execution/Call_Execution_Unplanned.dart';
import 'package:getpharma/ContactPoints/Contact_Point_Map.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Doctor {
  final String name;
  final String specialization;
  final String location;
  final String className;
  final int frequency;
  final int id;

  Doctor({
    required this.name,
    required this.specialization,
    required this.location,
    required this.className,
    required this.frequency,
    required this.id,
  });
}

class CallExecution extends StatefulWidget {
  const CallExecution({super.key});

  @override
  State<CallExecution> createState() => _CallExecutionState();
}

class _CallExecutionState extends State<CallExecution> {
  late final ValueNotifier<DateTime> _selectedDay;
  late final ValueNotifier<DateTime> _focusedDay;

  final List<Doctor> doctors = [
    Doctor(
      name: 'Abdul Sami memon',
      specialization: 'Physician-MBBS',
      location: 'Bhittae Medical Centre Shahdadpur ',
      className: 'Class A',
      frequency: 2,
      id: 168638,
    ),
    Doctor(
      name: 'Abdul Adil',
      specialization: 'Practitioner-MBBS',
      location: 'Bhittae Medical Centre Shahdadpur',
      className: 'Class B',
      frequency: 3,
      id: 168689,
    ),
    Doctor(
      name: 'Abdul Qadir memon',
      specialization: 'General Practioner',
      location: 'Bhittae Medical Centre Shahdadpur',
      className: 'Class A',
      frequency: 5,
      id: 168678,
    ),
    Doctor(
      name: 'Zara Ahmed',
      specialization: 'Physician-MBBS',
      location: 'Bhittae Medical Centre Shahdadpur',
      className: 'Class A',
      frequency: 1,
      id: 168346,
    ),
    // Add more doctors here
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _focusedDay = ValueNotifier(DateTime.now());
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    _focusedDay.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Call Execution',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                    ),
                    SizedBox(width: 16),
                    // Name and Role
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'M. Ahsan',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'TSM - 1228',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Leopard - Malir',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Karachi',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Statistics Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard(
                  'Doctor Coverage',
                  '72%',
                  '18% remaining',
                  0.72, // 72% as a fraction
                  Colors.blue,
                ),
                _buildStatCard(
                  'Calls Coverage',
                  '90%',
                  '10% remaining',
                  0.9, // 90% as a fraction
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Doctors and Unplanned Doctors
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard('200', 'Doctors in my list'),
                _buildInfoCard('30', 'Unplanned Doctors'),
              ],
            ),
            const SizedBox(height: 16),

            // Date and Morning/Evening Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    Text(
                      '04 Sep 2024',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue[50],
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.wb_sunny,
                    size: 20,
                    color: Colors.blue,
                  ),
                  label: const Text('Morning'),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Morning and Evening Cards
            Row(
              children: [
                Expanded(
                  child: _buildCPCard(
                      'Morning CP', '08:30 AM', 'Malir', 'On-Location'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildCPCard(
                      'Evening CP', '07:30 PM', 'Malir', 'On-Location'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(150, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactPointMap()),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text('Contact Point'),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(180, 50),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text('Working'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Back to Today',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Date Selector
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, size: 16),
                            onPressed: () {},
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(7, (index) {
                                  final date = DateTime.now()
                                      .add(Duration(days: index - 3));
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 6),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: index == 3
                                            ? Colors.blue
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            [
                                              'Mon',
                                              'Tue',
                                              'Wed',
                                              'Thu',
                                              'Fri',
                                              'Sat',
                                              'Sun'
                                            ][date.weekday - 1],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: index == 3
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            date.day.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: index == 3
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Day View',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CallExecutionUnplanned()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Unplanned Calls',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 16,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                // Summary Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize
                      .min, // Make Row take only as much space as needed
                  children: [
                    _buildSummaryTile(
                      'Calls Planned',
                      '12',
                      Colors.blue,
                      Icons.call_made,
                      Colors.green.shade50,
                      Colors.green,
                    ),
                    const SizedBox(width: 1), // Space between cards
                    _buildSummaryTile(
                      'Calls Executed',
                      '7',
                      Colors.green,
                      Icons.call_end,
                      Colors.green.shade50,
                      Colors.green,
                    ),
                    const SizedBox(width: 1), // Space between cards
                    _buildSummaryTile(
                      'Calls Remaining',
                      '5',
                      Colors.red,
                      Icons.call_missed,
                      Colors.red.shade50,
                      Colors.red.shade900,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Doctor List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    doctor.specialization,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    doctor.location,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    children: [
                                      _buildTag(doctor.className),
                                      const SizedBox(width: 8),
                                      _buildTag(
                                          'Frequency: ${doctor.frequency}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .orange.shade100, // Background color
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    doctor.id.toString(),
                                    style: TextStyle(
                                      backgroundColor: Colors.orange.shade100,
                                      fontSize: 12,
                                      color:
                                          Colors.orange.shade900, // Text color
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 80),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'See more >',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // const SizedBox(height: 16),

            // // Horizontal Calendar
            // TableCalendar(
            //   focusedDay: _focusedDay.value,
            //   selectedDayPredicate: (day) => isSameDay(_selectedDay.value, day),
            //   onDaySelected: (selectedDay, focusedDay) {
            //     _selectedDay.value = selectedDay;
            //     _focusedDay.value = focusedDay;
            //   },
            //   headerStyle: const HeaderStyle(
            //     formatButtonVisible: false,
            //     titleCentered: true, // Centers the title
            //     leftChevronVisible: true, // Hides the left arrow
            //     rightChevronVisible: true, // Hides the right arrow
            //   ),
            //   calendarStyle: const CalendarStyle(
            //     todayDecoration: BoxDecoration(
            //       color: Colors.blue,
            //       shape: BoxShape.circle,
            //     ),
            //     selectedDecoration: BoxDecoration(
            //       color: Colors.orange,
            //       shape: BoxShape.circle,
            //     ),
            //     weekendTextStyle: TextStyle(color: Colors.red),
            //   ),
            //   daysOfWeekStyle: const DaysOfWeekStyle(
            //     weekendStyle: TextStyle(color: Colors.red),
            //   ),
            //   availableGestures: AvailableGestures.horizontalSwipe,
            //   firstDay:
            //       DateTime.utc(2020, 01, 01), // Start date for the calendar
            //   lastDay: DateTime.utc(2100, 12, 31), // End date for the calendar
            //   enabledDayPredicate: (day) {
            //     return day.isAfter(DateTime.now().subtract(Duration(days: 1)));
            //   },
            //   // Makes the calendar horizontal
            // ),
          ],
        ),
      ),
    );
  }

  // Method to create statistic cards

  Widget _buildStatCard(String title, String value, String subtitle,
      double percent, Color progressColor) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title and subtitle column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: Colors.orange.shade800, fontSize: 11),
                    ),
                  ],
                ),
              ),
              // Circular Percent Indicator
              Align(
                alignment: Alignment.centerRight,
                child: CircularPercentIndicator(
                  radius: 30.0, // Adjust the size of the circle
                  lineWidth: 4.0, // Width of the progress line
                  percent: percent, // Progress percentage (0.0 to 1.0)
                  center: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: progressColor, // Color of the progress line
                  backgroundColor: Colors.grey[200]!, // Background color
                  circularStrokeCap: CircularStrokeCap.round, // Rounded edges
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to create info cards
  Widget _buildInfoCard(String value, String subtitle) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 30,
                color: Colors.blue,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
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

  // Method to create CP cards
  Widget _buildCPCard(
      String title, String time, String location, String locationStatus) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Main Row for Right-Aligned Texts
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Right-Aligned Text Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Reporting\n Time:',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Location:',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Map:',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'On-Time:',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                // Left-Aligned Text Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      location,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'View',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      locationStatus,
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryTile(String title, String count, Color color,
      IconData icon, Color cardBackgroundColor, Color borderColor) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: borderColor, width: 1),
      ),
      elevation: 2,
      color: cardBackgroundColor,
      child: Container(
        width: 108,
        height: 90,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Center the icon
          mainAxisAlignment:
              MainAxisAlignment.start, // Center the content horizontally
          children: [
            // Icon only
            Icon(
              icon,
              color: color,
              size: 20, // Adjust size for better fit without text
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              count,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
