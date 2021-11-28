import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/components/event_component.dart';

class EventsView extends StatefulWidget {
  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  final firestoreInstance = FirebaseFirestore.instance;
  List<QueryDocumentSnapshot> testDataList;

  void _readTestData() {
    firestoreInstance.collection("events").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print("query snaps: " + querySnapshot.docs[1]["başlık"]);
        testDataList = querySnapshot.docs;
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readTestData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "events view",
          style: TextStyle(color: Colors.black),
        )),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CachedNetworkImage(
                    height: size.height / 3,
                    imageUrl:
                        "https://img.freepik.com/free-photo/abstract-grunge-decorative-relief-navy-blue-stucco-wall-texture-wide-angle-rough-colored-background_1258-28311.jpg?size=626&ext=jpg",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.blue, BlendMode.colorBurn)),
                      ),
                    ),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Column(
                    children: [
                      Text(
                        'TEK-SEN',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Tarafsız Etik Kamu Görevlileri Sendikası',
                          style: TextStyle(
                            fontFamily: 'Proxima Nova Alt',
                            fontSize: 18,
                            color: const Color(0xffffffff),
                            height: 1.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    testDataList != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: testDataList.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: EventComponent(
                                  eventData: testDataList[index],
                                ),
                              );
                            })
                        : Text("loading")
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class TeksenLogoWidget extends StatelessWidget {
  const TeksenLogoWidget({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Image.asset(
            "assets/teksen_logo.png",
            fit: BoxFit.cover,
            height: size.height / 3,
          ),
        ),
        Text(
          'TEK-SEN',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 50,
            color: Colors.blue,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
