import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/tab_views/home_page.dart';

class UnionView extends StatefulWidget {
  @override
  _UnionViewState createState() => _UnionViewState();
}

class _UnionViewState extends State<UnionView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "TEK-SEN MOBİL",
                style: TextStyle(color: Colors.black),
              ),
              Image.asset(
                "assets/teksen_logo.png",
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              )
            ],
          ),
        ),
        backgroundColor: Colors.blue.withOpacity(.3),
      ),
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
