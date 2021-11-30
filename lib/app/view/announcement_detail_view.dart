import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementDetailPage extends StatefulWidget {
  const AnnouncementDetailPage({Key key, @required this.announcementData})
      : super(key: key);
  final QueryDocumentSnapshot announcementData;
  @override
  _AnnouncementDetailPageState createState() => _AnnouncementDetailPageState();
}

class _AnnouncementDetailPageState extends State<AnnouncementDetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var format = DateFormat.yMMMMEEEEd('tr');
    var dateString = format.format(
        DateTime.parse(widget.announcementData["tarih"].toDate().toString()));
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Duyurular",
              style: TextStyle(
                fontFamily: 'Proxima Nova Alt',
                letterSpacing: -0.836,
              ),
            ),
            Text(
              dateString,
              style: TextStyle(
                fontFamily: 'Proxima Nova Alt',
                fontSize: 14,
                letterSpacing: -0.836,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
        backgroundColor: Colors.blue.withOpacity(.3),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.announcementData["başlık"],
              style: TextStyle(
                fontFamily: 'Proxima Nova Alt',
                fontSize: 30,
                color: const Color(0xff163235),
                letterSpacing: -1.444,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.announcementData["açıklama"],
                style: TextStyle(
                  fontFamily: 'Proxima Nova Alt',
                  fontSize: 18,
                  color: const Color(0xff163235),
                  letterSpacing: -0.988,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
