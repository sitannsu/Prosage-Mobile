import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _selectedDate = DateTime.now();

  final List<Map<String, dynamic>> _students = [
    {'name': 'Rohan Kumar', 'roll': '101', 'isPresent': true},
    {'name': 'Sanya Gupta', 'roll': '102', 'isPresent': false},
    {'name': 'Amit Patel', 'roll': '103', 'isPresent': true},
    {'name': 'Priya Singh', 'roll': '104', 'isPresent': true},
    {'name': 'Vikram Mehra', 'roll': '105', 'isPresent': true},
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Change Date'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _students[index]['isPresent'] ? Colors.green[100] : Colors.red[100],
                      child: Icon(
                        _students[index]['isPresent'] ? Icons.check : Icons.close,
                        color: _students[index]['isPresent'] ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(_students[index]['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Roll No: ${_students[index]['roll']}'),
                    trailing: Switch(
                      value: _students[index]['isPresent'],
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          _students[index]['isPresent'] = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Attendance Saved Successfully!')),
                  );
                },
                child: const Text('Save Attendance'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
