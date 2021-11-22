import 'package:flutter/material.dart';

class UnionView extends StatefulWidget {
  @override
  _UnionViewState createState() => _UnionViewState();
}

class _UnionViewState extends State<UnionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Text("union sayfası"),
      )),
    );
  }
}
