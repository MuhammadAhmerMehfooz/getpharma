import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  int selectedIndex = 0;
  int quarterlyIndex = 0;
  int valueorunit = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          // Wrap the Column in SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Team',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        icon: const SizedBox.shrink(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        hint: const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text('Leopard'),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: 'Leopard',
                            child: Text('Leopard'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        padding: const EdgeInsets.all(6),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const SizedBox(
                        width: 20,
                        child: Icon(Icons.filter_alt, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Period',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        _buildToggleButton("Monthly", 0),
                        SizedBox(
                          width: 10,
                        ),
                        _buildToggleButton("Quarterly", 1),
                        SizedBox(
                          width: 10,
                        ),
                        _buildToggleButton("Yearly", 2),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buildPeriodWidget(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Last Sales Updated on:',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '09 Sept 2024',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              valueorunit = 0;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedIndex == 0
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                            child: Text(
                              'Value',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == 0
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              valueorunit = 1;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 16),
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? Colors.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedIndex == 1
                                    ? Colors.blue
                                    : Colors.white,
                              ),
                            ),
                            child: Text(
                              'Units',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: selectedIndex == 1
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSalesCard(
                        Icons.bar_chart, "150K", "Sales", Colors.blue),
                    _buildSalesCard(Icons.supervised_user_circle_outlined,
                        "100K", "Target", Colors.orange),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: double.infinity,
                  height: 320,
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        children: [
                          const Text(
                            'Target Vs Achievement',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8), // Space between texts
                          const Text(
                            'Monthly',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Colors.blueGrey, // Customize color as needed
                            ),
                          ),
                          const SizedBox(
                              height:
                                  16), // Space between the text and the circle
                          Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius: 80.0,
                                  lineWidth: 10.0,
                                  percent: 0.7,
                                  startAngle: 0.0,
                                  progressColor: Colors.blue,
                                  backgroundColor: Colors.grey.shade200,
                                ),
                                Transform.rotate(
                                  angle: -3.1416 / 1,
                                  child: CircularPercentIndicator(
                                    radius: 80.0,
                                    lineWidth: 12.0,
                                    percent: 0.7, // 70% completion
                                    progressColor: Colors
                                        .blue, // Color of the progress line
                                    backgroundColor: Colors.grey
                                        .shade200, // Background color of the circle
                                    startAngle:
                                        0.0, // Start from the top (default)
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "70%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            2), // Space between percentage and "Achievement"
                                    Text(
                                      'Achievement',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(
                                  width: 8), // Space between dots and text
                              const Text(
                                'Achievement',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      14), // Space between target text and grey dot
                              // Grey dot
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Target',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 400,
                  width: 350, // Reduced width
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      // Your LineChart here
                      Expanded(
                        child: LineChart(
                          LineChartData(
                            backgroundColor: Colors.white,
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  reservedSize: 35,
                                  interval: 20,
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  interval: 1,
                                  getTitlesWidget: (value, meta) {
                                    const months = [
                                      'Jan',
                                      'Feb',
                                      'Mar',
                                      'Apr',
                                      'May',
                                      'Jun',
                                      'Jul',
                                      'Aug',
                                      'Sep',
                                      'Oct',
                                      'Nov',
                                      'Dec',
                                    ];
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        left: 8,
                                        right: 45,
                                      ),
                                      child: Text(
                                        months[value.toInt() % 12],
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(
                              show: false,
                              border: Border.all(color: Colors.white),
                            ),
                            minX: 0,
                            maxX: 11,
                            minY: 0,
                            maxY: 100,
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 40),
                                  FlSpot(1, 50),
                                  FlSpot(2, 60),
                                  FlSpot(3, 55),
                                  FlSpot(4, 45),
                                  FlSpot(5, 60),
                                  FlSpot(6, 65),
                                  FlSpot(7, 70),
                                  FlSpot(8, 75),
                                  FlSpot(9, 60),
                                  FlSpot(10, 50),
                                  FlSpot(11, 55),
                                ],
                                isCurved: true,
                                color: Colors.black,
                                barWidth: 2,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                                dotData: FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 50),
                                  FlSpot(1, 55),
                                  FlSpot(2, 65),
                                  FlSpot(3, 60),
                                  FlSpot(4, 55),
                                  FlSpot(5, 70),
                                  FlSpot(6, 75),
                                  FlSpot(7, 80),
                                  FlSpot(8, 85),
                                  FlSpot(9, 70),
                                  FlSpot(10, 60),
                                  FlSpot(11, 65),
                                ],
                                isCurved: true,
                                color: Colors.red,
                                barWidth: 2,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                                dotData: FlDotData(show: false),
                              ),
                              LineChartBarData(
                                spots: [
                                  FlSpot(0, 60),
                                  FlSpot(1, 65),
                                  FlSpot(2, 75),
                                  FlSpot(3, 70),
                                  FlSpot(4, 65),
                                  FlSpot(5, 80),
                                  FlSpot(6, 85),
                                  FlSpot(7, 90),
                                  FlSpot(8, 95),
                                  FlSpot(9, 80),
                                  FlSpot(10, 70),
                                  FlSpot(11, 75),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 2,
                                isStrokeCapRound: true,
                                belowBarData: BarAreaData(show: false),
                                dotData: FlDotData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '2024 - 2025', // Text you want to add
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LegendItem(color: Colors.black, text: "Sales"),
                          LegendItem(color: Colors.red, text: "Target"),
                          LegendItem(
                              color: Colors.blue, text: "Last Year Sales"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 170,
                    padding:
                        const EdgeInsets.all(12), // Padding inside the card
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Growth over last period same year',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue
                                    .withOpacity(0.1), // Light background color
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.bar_chart, // Icon
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+20%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Rs 5,000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Last 12 Months',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 180,
                    height: 170,
                    padding:
                        const EdgeInsets.all(12), // Padding inside the card
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Growth over same period last year',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue
                                    .withOpacity(0.1), // Light background color
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.bar_chart, // Icon
                                color: Colors.blue,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '+20%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Rs 5,000',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Last 12 Months',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Card(
                  elevation: 4, // Shadow elevation for the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  child: Container(
                    height: 400,
                    width: 350, // Reduced width to make it smaller
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align content to the start
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, top: 8.0), // Add some left padding
                          child: Text(
                            'Moving Annual Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign:
                                TextAlign.start, // Ensure text is left-aligned
                          ),
                        ),
                        SizedBox(height: 18), // Add spacing below the title
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              backgroundColor: Colors.white,
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 35,
                                    interval: 20,
                                  ),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    interval: 1,
                                    getTitlesWidget: (value, meta) {
                                      const months = [
                                        'Jan',
                                        'Feb',
                                        'Mar',
                                        'Apr',
                                        'May',
                                        'Jun',
                                        'Jul',
                                        'Aug',
                                        'Sep',
                                        'Oct',
                                        'Nov',
                                        'Dec'
                                      ];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10.0,
                                          left: 8,
                                          right: 45,
                                        ),
                                        child: Text(
                                          months[value.toInt() % 12],
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              gridData: FlGridData(show: false),
                              borderData: FlBorderData(
                                show: false,
                                border: Border.all(color: Colors.white),
                              ),
                              minX: 0,
                              maxX: 11,
                              minY: 0,
                              maxY: 100,
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    FlSpot(0, 60),
                                    FlSpot(1, 65),
                                    FlSpot(2, 75),
                                    FlSpot(3, 70),
                                    FlSpot(4, 65),
                                    FlSpot(5, 80),
                                    FlSpot(6, 85),
                                    FlSpot(7, 90),
                                    FlSpot(8, 95),
                                    FlSpot(9, 80),
                                    FlSpot(10, 70),
                                    FlSpot(11, 75),
                                  ],
                                  isCurved: true,
                                  color: Colors.blue,
                                  barWidth: 2,
                                  isStrokeCapRound: true,
                                  belowBarData: BarAreaData(show: false),
                                  dotData: FlDotData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            '2023 - 2024',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LegendItem(color: Colors.blue, text: "Sales"),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPeriodWidget() {
    if (selectedIndex == 0) {
      return MonthSelector(
        initialDate: DateTime.now(),
        onMonthSelected: (selectedDate) {
          print(
              'Selected Month: ${selectedDate.month}, Year: ${selectedDate.year}');
        },
      );
    } else if (selectedIndex == 1) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 4; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      quarterlyIndex = i;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: quarterlyIndex == i
                          ? Colors.blue
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        'Quarter ${i + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: quarterlyIndex == i
                              ? Colors.white
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    } else if (selectedIndex == 2) {
      return Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'July 2024 - June 2025',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildToggleButton(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selectedIndex == index ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSalesCard(
      IconData icon, String value, String label, Color color) {
    return Container(
      width: 160,
      height: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade500,
      title: const Text(
        'Sales Performance - Sales',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        tooltip: 'Menu',
        onPressed: () {},
        padding: EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(),
        color: Colors.white,
      ),
      leadingWidth: 32,
      elevation: 4.0,
    );
  }
}

class MonthSelector extends StatefulWidget {
  final DateTime initialDate;
  final Function(DateTime) onMonthSelected;

  const MonthSelector({
    Key? key,
    required this.initialDate,
    required this.onMonthSelected,
  }) : super(key: key);

  @override
  State<MonthSelector> createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  void _selectMonth(int month) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, month);
    });
    widget.onMonthSelected(_selectedDate);
  }

  void _resetToToday() {
    setState(() {
      _selectedDate = DateTime.now();
    });
    widget.onMonthSelected(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: _resetToToday,
            child: Text(
              "Back to Today",
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(12, (index) {
                int month = index + 1;
                bool isSelected = _selectedDate.month == month;

                return GestureDetector(
                  onTap: () => _selectMonth(month),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      _getMonthName(month),
                      style: TextStyle(
                        fontSize: 16,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

class SalesChart extends StatelessWidget {
  final int k = 6; // Number of right labels to remove

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200], // Background color for the card
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              height: 380, // Increased height
              width: double.infinity, // Keeps it fully stretched
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  // Chart itself
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        backgroundColor:
                            Colors.white, // Matches container's background
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 40,
                              interval: 20,
                              getTitlesWidget: (value, meta) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0), // Adjusted left margin
                                  child: Text(
                                    '${value.toInt()}-', // Add '-' after each number
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                );
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, meta) {
                                const months = [
                                  'Jan',
                                  'Feb',
                                  'Mar',
                                  'Apr',
                                  'May',
                                  'Jun',
                                  'Jul',
                                  'Aug',
                                  'Sep',
                                  'Oct',
                                  'Nov',
                                  'Dec'
                                ];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 1, right: 28, bottom: 2),
                                  child: Text(
                                    months[value.toInt() % 12],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: FlGridData(
                          show: false,
                          drawHorizontalLine: true,
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: Colors.white,
                            strokeWidth: 1,
                          ),
                        ),
                        borderData: FlBorderData(
                          show: false,
                          border: Border.all(color: Colors.white),
                        ),
                        minX: 0,
                        maxX: 11,
                        minY: 0,
                        maxY: 100,
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 40),
                              FlSpot(1, 50),
                              FlSpot(2, 60),
                              FlSpot(3, 55),
                              FlSpot(4, 45),
                              FlSpot(5, 60),
                              FlSpot(6, 65),
                              FlSpot(7, 70),
                              FlSpot(8, 75),
                              FlSpot(9, 60),
                              FlSpot(10, 50),
                              FlSpot(11, 55),
                            ],
                            isCurved: true,
                            color: Colors.black,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 50),
                              FlSpot(1, 55),
                              FlSpot(2, 65),
                              FlSpot(3, 60),
                              FlSpot(4, 55),
                              FlSpot(5, 70),
                              FlSpot(6, 75),
                              FlSpot(7, 80),
                              FlSpot(8, 85),
                              FlSpot(9, 70),
                              FlSpot(10, 60),
                              FlSpot(11, 65),
                            ],
                            isCurved: true,
                            color: Colors.red,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: false),
                          ),
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 60),
                              FlSpot(1, 65),
                              FlSpot(2, 75),
                              FlSpot(3, 70),
                              FlSpot(4, 65),
                              FlSpot(5, 80),
                              FlSpot(6, 85),
                              FlSpot(7, 90),
                              FlSpot(8, 95),
                              FlSpot(9, 80),
                              FlSpot(10, 70),
                              FlSpot(11, 75),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 3,
                            isStrokeCapRound: true,
                            belowBarData: BarAreaData(show: false),
                            dotData: FlDotData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2024 - 2025',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LegendItem(color: Colors.black, text: "Sales"),
                      LegendItem(color: Colors.red, text: "Target"),
                      LegendItem(color: Colors.blue, text: "Last Year Sales"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 18,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
