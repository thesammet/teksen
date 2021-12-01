import 'package:flutter/material.dart';
import 'package:teksen_mobile/app/view/other_views/about_us_view.dart';
import 'package:teksen_mobile/app/view/other_views/contact_us.dart';
import 'package:teksen_mobile/app/view/other_views/contacted_organizations_view.dart';
import 'package:teksen_mobile/app/view/other_views/managment_team_view.dart';
import 'package:teksen_mobile/app/view/other_views/member_want_view.dart';
import 'package:teksen_mobile/app/view/other_views/provincial_heads_view.dart';
import 'package:teksen_mobile/app/view/tab_views/home_page.dart';

class UnionView extends StatefulWidget {
  @override
  _UnionViewState createState() => _UnionViewState();
}

class _UnionViewState extends State<UnionView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: size.height,
        color: Colors.blue.withOpacity(.3),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TeksenLogoWidget(size: size),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width / 4).copyWith(
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UnionElementComponent(
                    elementName: "Hakkımızda",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsView()));
                    },
                  ),
                  UnionElementComponent(
                    elementName: "Yönetim Kadrosu",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManagmentTeamView()));
                    },
                  ),
                  UnionElementComponent(
                    elementName: "Anlaşmalı Kurumlar",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ContractedOrganizationsView()));
                    },
                  ),
                  UnionElementComponent(
                    elementName: "Üyelik Talep Şikayet",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemberWantView()));
                    },
                  ),
                  UnionElementComponent(
                    elementName: "il Başkanları ",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProvincialHeadsView()));
                    },
                  ),
                  UnionElementComponent(
                    elementName: "iletişim",
                    elementIcon: Icons.surfing,
                    func: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUsView()));
                    },
                  ),
                ],
              ),
            )
          ],
        )),
      )),
    );
  }
}

class UnionElementComponent extends StatelessWidget {
  const UnionElementComponent(
      {Key key,
      @required this.elementName,
      @required this.elementIcon,
      @required this.func})
      : super(key: key);
  final String elementName;
  final IconData elementIcon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            elementIcon,
            size: 28,
          ),
          TextButton(
            onPressed: func,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                elementName,
                style: TextStyle(
                  fontFamily: 'Proxima Nova Alt',
                  fontSize: 22,
                  color: const Color(0xff163235),
                  letterSpacing: -0.988,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
