import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementForm extends StatefulWidget {
  @override
  _AnnouncementFormState createState() => _AnnouncementFormState();
}

class _AnnouncementFormState extends State<AnnouncementForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _announcementController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _announcementController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _announcementController,
            decoration:const InputDecoration(labelText: 'Write the announcement'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Row(
            children: [
              Text('Date: ${DateFormat('dd/MM/yyyy').format(_selectedDate)}'),
              IconButton(
                icon:const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data
                  }
                },
                child:const Text('Done'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the form
                },
                child:const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}