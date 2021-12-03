import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/tab_views/home_page.dart';

class ContactUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TeksenLogoWidget(size: size),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
