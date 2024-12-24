import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:getpharma/CustomerList/All%20Customers/All_Customers.dart';
import 'package:image_picker/image_picker.dart';

class AddDoctor extends StatefulWidget {
  const AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  final ImagePicker _picker = ImagePicker();
  String? selectedGender;
  String? selectedclass;
  String? selectedfrequency;
  List<Map<String, dynamic>> _buisnesscard = [];
  List<Map<String, dynamic>> _clinicpic = [];

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickMultiImage();
    if (pickedFile != null && pickedFile.isNotEmpty) {
      for (var pickedFile in pickedFile) {
        File file = File(pickedFile.path);
        setState(() {
          _buisnesscard.add({
            'file': file,
            'name': pickedFile.name,
            'size': file.lengthSync() / (1024 * 1024),
          });
        });
      }
    }
  }

  Future<void> _pickImageforclinic() async {
    final imagepicked = await _picker.pickMultiImage();
    if (imagepicked != null && imagepicked.isNotEmpty) {
      for (var imagepicked in imagepicked) {
        File file = File(imagepicked.path);
        setState(() {
          _clinicpic.add({
            'file': file,
            'name': imagepicked.name,
            'size': file.lengthSync() / (1024 * 1024), // Size in MB
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
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Add new Doctor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding for alignment
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'CNIC Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Gender',
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
                items: ['Male', 'Female']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value; // Dropdown value update
                  });
                },
              ),
              SizedBox(height: 25),
              const Text(
                'Professional Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 25),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'PMDC Number',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Designation',
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
                items: ['Conultant', 'Professor Doctor', 'Department head']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value; // Dropdown value update
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Qualification',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Speciality',
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
                items: ['Endocrinologist', 'Oncologist', 'Neurologist']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value; // Dropdown value update
                  });
                },
              ),
              SizedBox(height: 25),
              const Text(
                'Location Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'Brick',
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
                items: ['Clifton', 'Defense', 'Malir']
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value; // Dropdown value update
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  labelText: 'Set up Location on Map',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedGender,
                decoration: InputDecoration(
                  labelText: 'City',
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
                  'Karachi',
                  'Lahore',
                  'Islamabad',
                  'Quetta',
                  'Multan',
                  'Peshawar'
                ]
                    .map((gender) => DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value; // Dropdown value update
                  });
                },
              ),
              SizedBox(height: 25),
              const Text(
                'Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedclass,
                decoration: InputDecoration(
                  labelText: 'Class',
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
                    .map((classtype) => DropdownMenuItem<String>(
                          value: classtype,
                          child: Text(classtype),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedclass = value; // Dropdown value update
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedfrequency,
                decoration: InputDecoration(
                  labelText: 'Frequency',
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
                    selectedfrequency = value; // Dropdown value update
                  });
                },
              ),
              SizedBox(height: 25),
              const Text(
                'Buisness Card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 25),
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
                          'Upload File',
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
                itemCount: _buisnesscard.length,
                itemBuilder: (context, index) {
                  final fileData = _buisnesscard[index];
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
                            _buisnesscard
                                .removeAt(index); // Remove the selected file
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 25),
              const Text(
                'Clinic',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: _pickImageforclinic,
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
                          'Upload File',
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
                itemCount: _clinicpic.length,
                itemBuilder: (context, index) {
                  final fileData = _clinicpic[index];
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
                            _clinicpic
                                .removeAt(index); // Remove the selected file
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AllCustomers()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 130, vertical: 10), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'Add Doctor',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Text color
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
