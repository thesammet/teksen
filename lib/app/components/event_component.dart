import 'package:flutter/material.dart';

class EventComponent extends StatefulWidget {
  @override
  _EventComponentState createState() => _EventComponentState();
}

class _EventComponentState extends State<EventComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("event card pushed.");
        },
        child: Card(child: Text("event card")));
  }
}
