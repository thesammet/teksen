import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/components/event_component.dart';

class EventsView extends StatefulWidget {
  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return EventComponent();
            }),
      ),
    );
  }
}
