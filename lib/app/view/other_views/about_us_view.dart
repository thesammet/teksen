import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatefulWidget {
  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  final firestoreInstance = FirebaseFirestore.instance;

  String aboutUsText;

  void _readAboutUs() {
    firestoreInstance.collection("hakkımızda")
      ..get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          aboutUsText = result["açıklama"];
          print(result["açıklama"]);
          setState(() {});
        });
      });
  }

  @override
  void initState() {
    super.initState();
    _readAboutUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hakkımızda",
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
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.3),
              borderRadius: BorderRadius.circular(7.0)),
          child: aboutUsText != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(child: Text(aboutUsText)),
                )
              : Text("yükleniyor"),
        ),
      ),
    );
  }
}
