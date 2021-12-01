import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key key, @required this.eventData}) : super(key: key);
  final QueryDocumentSnapshot eventData;
  @override
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //1
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            //2
            SliverAppBar(
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.eventData["başlık"],
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
                background: Image.network(
                  widget.eventData["url"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //3
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          widget.eventData["başlık"],
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: 'Montserrat',
                            color: const Color(0xff163235),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.eventData["makale"],
                            style: TextStyle(
                              fontFamily: 'Proxima Nova Alt',
                              fontSize: 18,
                              color: const Color(0xff163235),
                              letterSpacing: -0.988,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
    /* return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: size.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://png.pngitem.com/pimgs/s/295-2957547_newspaper-transparent-background-ripped-newspaper-clipping-png-png.png"))),
            child: Column(
              children: [
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
                Text("asf"),
              ],
            ),
          ),
        ),
      ),
    ); */
  }
}
