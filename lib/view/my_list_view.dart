import 'package:sample/importer.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  MyListViewState createState() => MyListViewState();
}

class MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: samples.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(samples[index]),
            onTap: () {
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
