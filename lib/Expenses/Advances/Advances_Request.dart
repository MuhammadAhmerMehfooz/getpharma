import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:getpharma/Expenses/custom_alert.dart';
import 'package:image_picker/image_picker.dart';

class AdvancesRequest extends StatefulWidget {
  const AdvancesRequest({super.key});

  @override
  State<AdvancesRequest> createState() => _AdvancesRequestState();
}

class _AdvancesRequestState extends State<AdvancesRequest> {
  String? selectedGender;
  final TextEditingController _dateController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  List<Map<String, dynamic>> _Advancespic = [];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.toLocal()}".split(' ')[0]; // Format date
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickMultiImage();
    if (pickedFile.isNotEmpty) {
      for (var pickedFile in pickedFile) {
        File file = File(pickedFile.path);
        setState(() {
          _Advancespic.add({
            'file': file,
            'name': pickedFile.name,
            'size': file.lengthSync() / (1024 * 1024),
          });
        });
      }
    }
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
              'Advances Request',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12,
              ),
              Text(
                'Expense Head',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Expense Head',
                  labelStyle: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 28),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Balance Amount
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Activity Planned From',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    '05/10/2025',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),

                  // Capped Amount
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Activity Planned To',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Row(
                                children: [
                                  Text(
                                    '07/10/2025',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                'Advance Amount',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 8,
              ),

              
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Rs:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Attachment',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: _pickImage,
                child: DottedBorder(
                  color: Colors.blue,
                  strokeWidth: 2,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [6, 3],
                  child: Container(
                    width: 400,
                    height: 150,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                            size: 40,
                          ),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          ' Capture or Upload File',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 1),
                        const Text(
                          'Max file size: 25MB',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // Uploaded File Card
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: _Advancespic.length,
                itemBuilder: (context, index) {
                  final fileData = _Advancespic[index];
                  return Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          fileData['file'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(fileData['name'] ?? 'Uploaded File'),
                      subtitle:
                          Text('${fileData['size']?.toStringAsFixed(1)} MB'),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _Advancespic.removeAt(
                                index); // Remove the selected file
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.blue,
                maxLines: 5,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignLabelWithHint: true,
                  hintText: 'Enter a detailed description...',
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AllCustomers()),
                    // );
                     showDialog(
                      context: context,
                      builder: (context) => CustomAlert(
                        text:
                            "Advance request has been approved & forwarded to DSM for approval",
                        type: "success",
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
