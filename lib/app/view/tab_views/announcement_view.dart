import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/components/announcement_component.dart';

class AnnouncementsView extends StatefulWidget {
  @override
  _AnnouncementsViewState createState() => _AnnouncementsViewState();
}

class _AnnouncementsViewState extends State<AnnouncementsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return AnnouncementComponent();
              })),
    );
  }
}
