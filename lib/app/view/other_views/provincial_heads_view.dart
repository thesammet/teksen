import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:teksen_mobile/app/view/other_views/contacted_organizations_view.dart';

class ProvincialHeadsView extends StatefulWidget {
  @override
  State<ProvincialHeadsView> createState() => _ProvincialHeadsViewState();
}

class _ProvincialHeadsViewState extends State<ProvincialHeadsView> {
  final firestoreInstance = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot> managmentDataList;

  void _readProvincialHeads() {
    firestoreInstance.collection("başkanlar")
      ..get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          managmentDataList = querySnapshot.docs;
          setState(() {});
          print(managmentDataList);
        });
      });
  }

  @override
  void initState() {
    super.initState();
    _readProvincialHeads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: managmentDataList != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GroupedListView<dynamic, String>(
                    elements: managmentDataList,
                    groupBy: (element) => element['il'],
                    indexedItemBuilder: (context, dynamic element, index) =>
                        Text(element['isim']),

                    groupSeparatorBuilder: (String groupByValue) => Center(
                      child: Text(
                        groupByValue,
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    itemComparator: (item1, item2) =>
                        item1['isim'].compareTo(item2['isim']), // optional

                    floatingHeader: true, // optional
                    order: GroupedListOrder.ASC, // optional
                  ),
                )
              : LoadingCircularComponent()),
    );
  }
}
