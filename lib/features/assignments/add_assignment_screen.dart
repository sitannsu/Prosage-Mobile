import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';

class AddAssignmentScreen extends StatefulWidget {
  const AddAssignmentScreen({super.key});

  @override
  State<AddAssignmentScreen> createState() => _AddAssignmentScreenState();
}

class _AddAssignmentScreenState extends State<AddAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _dueDate;
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Assignment')),
      body: Responsive(
        mobile: _buildForm(isTwoColumn: false),
        tablet: Center(child: SizedBox(width: 600, child: Card(child: Padding(padding: const EdgeInsets.all(32), child: _buildForm(isTwoColumn: true))))),
        desktop: Center(child: SizedBox(width: 800, child: Card(child: Padding(padding: const EdgeInsets.all(48), child: _buildForm(isTwoColumn: true))))),
      ),
    );
  }

  Widget _buildForm({required bool isTwoColumn}) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isTwoColumn) ...[
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Assignment Title', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
              ),
              const SizedBox(height: 16),
              _buildDateAndFileRow(isRow: false),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Assignment Title', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Please enter a title' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(flex: 1, child: _buildDatepicker()),
                ],
              ),
              const SizedBox(height: 16),
              _buildFilePicker(),
            ],
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder(), alignLabelWithHint: true),
              maxLines: 6,
              validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_dueDate == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a due date')));
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Assignment Created Successfully!')));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Create Assignment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateAndFileRow({required bool isRow}) {
    if (isRow) return Row(children: [Expanded(child: _buildDatepicker()), const SizedBox(width: 16), Expanded(child: _buildFilePicker())]);
    return Column(children: [_buildDatepicker(), const SizedBox(height: 16), _buildFilePicker()]);
  }

  Widget _buildDatepicker() {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );
        if (picked != null) setState(() => _dueDate = picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_dueDate == null ? 'Select Due Date' : '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'),
            const Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildFilePicker() {
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles();
        if (result != null) setState(() => _fileName = result.files.single.name);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_fileName ?? 'Upload File (Optional)'),
            const Icon(Icons.upload_file),
          ],
        ),
      ),
    );
  }
}
