import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactedOrganizationsView extends StatefulWidget {
  @override
  State<ContactedOrganizationsView> createState() =>
      _ContactedOrganizationsViewState();
}

class _ContactedOrganizationsViewState
    extends State<ContactedOrganizationsView> {
  final firestoreInstance = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot> managmentDataList;
  void _readOrganizations() {
    firestoreInstance.collection("kurumlar")
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
    _readOrganizations();
  }

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
                "Anlaşmalı Kurumlar",
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
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: CachedNetworkImage(
                                          height: size.height / 4.1,
                                          imageUrl: managmentDataList[index]
                                              ["url"],
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          managmentDataList[index]["isim"],
                                          style: TextStyle(
                                            fontFamily: 'Proxima Nova Alt',
                                            fontSize: 26,
                                            color: const Color(0xff163235),
                                            letterSpacing: -1.444,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0)
                                        .copyWith(bottom: 12),
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
