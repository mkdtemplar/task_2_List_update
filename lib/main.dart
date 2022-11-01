import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List View',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'List View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _entries = [
    'Flutter',
    'Ionic',
    'PhoneGap',
  ];
  void _rebuildList() {
    setState(() {
      _entries.add('Node.js');
      _entries.add('Xamarian');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _entries.length,
            itemBuilder: (BuildContext context, index) {
              return Center(
                child: Text(
                  _entries[index],
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _rebuildList();
          const snackBar = SnackBar(content: Text('List refreshed'),);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}