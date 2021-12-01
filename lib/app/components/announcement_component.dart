import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/other_views/announcement_detail_view.dart';

class AnnouncementComponent extends StatelessWidget {
  final QueryDocumentSnapshot announcementDataList;

  const AnnouncementComponent({Key key, @required this.announcementDataList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AnnouncementDetailPage(
                    announcementData: announcementDataList)));
      },
      child: Container(
        width: double.infinity,
        child: Card(
          color: Colors.blue.withOpacity(.2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.announcement),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: AutoSizeText(
                      announcementDataList["başlık"],
                      style: TextStyle(
                        fontFamily: 'Proxima Nova Alt',
                        color: const Color(0xff163235),
                        letterSpacing: -0.988,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
