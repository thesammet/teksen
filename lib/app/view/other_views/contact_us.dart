import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/other_views/contacted_organizations_view.dart';
import 'package:teksen_mobile/app/view/tab_views/home_page.dart';

class ContactUsView extends StatefulWidget {
  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final firestoreInstance = FirebaseFirestore.instance;

  List<QueryDocumentSnapshot> contactDataList;
  void _readContacts() {
    firestoreInstance.collection("iletişim")
      ..get().then((querySnapshot) {
        querySnapshot.docs.forEach((result) {
          contactDataList = querySnapshot.docs;
          setState(() {});
        });
      });
  }

  @override
  void initState() {
    super.initState();
    _readContacts();
  }

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
            contactDataList != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ContactComponent(
                            size: size,
                            ic: Icons.navigation_outlined,
                            text: contactDataList[0]["adres"],
                            title: "adres",
                          ),
                          ContactComponent(
                            size: size,
                            ic: Icons.phone_outlined,
                            text: contactDataList[0]["telefon"],
                            title: "telefon",
                          ),
                          ContactComponent(
                            size: size,
                            ic: Icons.mail_outline,
                            text: contactDataList[0]["mail"],
                            title: "e-mail",
                          ),
                          contactDataList[0]["web"] == ""
                              ? Container()
                              : ContactComponent(
                                  size: size,
                                  ic: Icons.web,
                                  text: contactDataList[0]["web"],
                                  title: "web sitesi",
                                ),
                        ],
                      ),
                    ),
                  )
                : LoadingCircularComponent()
          ],
        ),
      )),
    );
  }
}

class ContactComponent extends StatelessWidget {
  const ContactComponent(
      {Key key,
      @required this.size,
      @required this.text,
      @required this.ic,
      @required this.title})
      : super(key: key);
  final Size size;
  final String text;
  final String title;
  final IconData ic;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    ic,
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title.toUpperCase() + ":",
                      style: TextStyle(
                        fontFamily: 'Proxima Nova Alt',
                        fontSize: 24,
                        color: const Color(0xff163235),
                        letterSpacing: -0.988,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: size.width - 100,
                  child: AutoSizeText(
                    text,
                    style: TextStyle(
                      fontFamily: 'Proxima Nova Alt',
                      fontSize: 22,
                      color: const Color(0xff163235),
                      letterSpacing: -0.988,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
