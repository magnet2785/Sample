import 'package:sample/importer.dart';

class MyDatabaseView extends StatefulWidget {
  const MyDatabaseView({super.key});

  @override
  MyDatabaseViewState createState() => MyDatabaseViewState();
}

class MyDatabaseViewState extends State<MyDatabaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("これはサイドバーのテストです"),
      ),
    );
  }
}
