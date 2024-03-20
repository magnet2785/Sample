import 'package:sample/constant/constant.dart';

import 'importer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample App',
      theme: ThemeData.dark(), //ダークテーマ固定
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: views[_selectedIndex],
      endDrawer: Drawer(
        child: ListView.builder(
          itemCount: samples.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(samples[index]),
              onTap: () {
                _onItemTapped(index);
              },
            );
          },
        ),
      ),
    );
  }
}
