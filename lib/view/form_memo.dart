import 'package:sample/importer.dart';
import 'package:intl/intl.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  FormViewState createState() => FormViewState();
}

class FormViewState extends State<FormView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      // 2023年から365日後までの期間で選択可能
      firstDate: DateTime(2023),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
            TextButton(
              onPressed: () => _selectDate(context),
              child: Text(DateFormat('yyyy/MM/dd').format(_selectedDate)),
            ),
            ElevatedButton(
              onPressed: () {
                final memo = Memo(
                  id: 0,
                  title: _titleController.text,
                  content: _contentController.text,
                  date: _selectedDate,
                );
                insertMemo(memo);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
