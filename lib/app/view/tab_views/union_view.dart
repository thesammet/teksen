import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/tab_views/events_view.dart';

class UnionView extends StatefulWidget {
  @override
  _UnionViewState createState() => _UnionViewState();
}

class _UnionViewState extends State<UnionView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TeksenLogoWidget(size: size),
            )
          ],
        ),
      ))),
    );
  }
}
