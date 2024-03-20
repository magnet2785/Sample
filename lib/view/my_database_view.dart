import 'package:sample/importer.dart';
import 'package:intl/intl.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  MyDatabaseViewState createState() => MyDatabaseViewState();
}

class MyDatabaseViewState extends State<MyDatabaseView> {
  bool _isLoading = true;
  List<Memo> _memos = [];

  void _loadMemo() async {
    _memos = await memos();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMemo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _memos.isEmpty
                ? const Center(child: Text('No memo'))
                : ListView.builder(
                    itemCount: _memos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.note),
                        title: Text(_memos[index].title),
                        subtitle: Text(_memos[index].content),
                        trailing: Text(DateFormat('yyyy/MM/dd')
                            .format(_memos[index].date)),
                      );
                    },
                  ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormView()),
            ).then((value) => _loadMemo());
          },
          child: const Icon(Icons.add),
        ));
  }
}
