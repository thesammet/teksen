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
  void initState() {
    super.initState();
    _readManagmentData();
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
                "Yönetim Kadromuz",
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
            child: managmentDataList != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: managmentDataList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        managmentDataList[index]["isim"],
                                      ),
                                      Text(managmentDataList[index]["görev"]),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Divider(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          );
                        }),
                  )
                : LoadingCircularComponent()),
      ),
    );
  }
}

class LoadingCircularComponent extends StatelessWidget {
  const LoadingCircularComponent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
