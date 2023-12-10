import 'package:envireonments_with_codemagic/main_common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './config_reader.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Provider.of<AppConfig>(context)
          .appTitle!, //'Flutter CI with Codemagic',
      theme: ThemeData(
        primarySwatch: Provider.of<AppConfig>(context).primaryColor,
      ),
      home: MyHomePage(
        title: Provider.of<AppConfig>(context).appTitle!,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += ConfigReader.getIncrementAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Revealed secret:\n${ConfigReader.getSecretKey()}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
