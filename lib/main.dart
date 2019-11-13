import 'package:flutter/material.dart';
import 'package:lobevent/Presentation/Content/Eventpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lobevent',

        home: EventList()
      );
  }
}

