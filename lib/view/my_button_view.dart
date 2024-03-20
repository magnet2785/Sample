import 'package:sample/importer.dart';

class MyButtonView extends StatefulWidget {
  const MyButtonView({super.key});

  @override
  MyButtonViewState createState() => MyButtonViewState();
}

class MyButtonViewState extends State<MyButtonView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('ElevatedButton'),
            ),
            TextButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('TextButton'),
            ),
            OutlinedButton(
              onPressed: () {
                // Respond to button press
              },
              child: Text('OutlinedButton'),
            ),
          ],
        ),
      ),
    );
  }
}
