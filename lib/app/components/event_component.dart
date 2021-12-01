import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teksen_mobile/app/view/other_views/event_detail_view.dart';

class EventComponent extends StatefulWidget {
  const EventComponent({Key key, @required this.eventData}) : super(key: key);
  final QueryDocumentSnapshot eventData;

  @override
  _EventComponentState createState() => _EventComponentState();
}

class _EventComponentState extends State<EventComponent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var format = DateFormat.yMMMMEEEEd('tr');
    var dateString = format
        .format(DateTime.parse(widget.eventData["tarih"].toDate().toString()));
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventDetailPage(
                        eventData: widget.eventData,
                      )));
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 2).copyWith(left: 3),

          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(7.0),
              topRight: const Radius.circular(7.0),
              bottomLeft: const Radius.circular(7.0),
              bottomRight: const Radius.circular(7.0),
            ),
          ),
          //clip beahviour imagein borderı önlememesi için konulur.

          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderOnForeground: true,
          semanticContainer: true,

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: size.height / 4.1,
                  imageUrl: widget.eventData["url"],
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.eventData["başlık"],
                        style: TextStyle(
                          fontFamily: 'Proxima Nova Alt',
                          fontSize: 30,
                          color: const Color(0xff163235),
                          letterSpacing: -1.444,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        dateString,
                        style: TextStyle(
                          fontFamily: 'Proxima Nova Alt',
                          fontSize: 18,
                          color: const Color(0xff163235),
                          letterSpacing: -0.836,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: size.width,
                    child: AutoSizeText(
                      widget.eventData["açıklama"],
                      style: TextStyle(
                        fontFamily: 'Proxima Nova Alt',
                        fontSize: 24,
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
          ),
        ));
  }
}
