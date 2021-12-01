import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManagmentTeamView extends StatefulWidget {
  @override
  State<ManagmentTeamView> createState() => _ManagmentTeamViewState();
}

class _ManagmentTeamViewState extends State<ManagmentTeamView> {
  final firestoreInstance = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot> managmentDataList;
  void _readManagmentData() {
    firestoreInstance.collection("yönetim")
      ..get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          managmentDataList = querySnapshot.docs;
          setState(() {});
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("managment"),
        ),
      ),
    );
  }
}
