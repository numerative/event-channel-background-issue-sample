import 'package:event_channel_background_issue/event_channel_background_issue.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _data = [];
  String _event = "";

  @override
  void initState() {
    super.initState();
    listenToStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventChannel Background Issue Sample'),
      ),
      body: Center(
        child: Text('Latest Data: $_event'),
      ),
    );
  }

  void listenToStream() {
    EventChannelBackgroundIssue.getData.listen((event) {
      setState(() {
        _event = event;
      });
      print('Data Received: $event '
          'Total Data in List: ${_data.length}');
      _data.add(event);
    });
  }
}
