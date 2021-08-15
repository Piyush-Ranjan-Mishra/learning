import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/model/allModel.dart';

import 'primaryContactBody.dart';

class PrimaryContacts extends StatefulWidget {
  final List<Contacts> contactsList;
  const PrimaryContacts({this.contactsList, Key key}) : super(key: key);

  @override
  _PrimaryContactsState createState() => _PrimaryContactsState();
}

class _PrimaryContactsState extends State<PrimaryContacts> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: marginCards,
      child: Container(
        padding: paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Primary Contacts', Icons.person_outline),
            ExpandingHeader(
              'View Recommendation',
              active: active,
              onTap: () => setState(() => active = !active),
            ),
            if(active) ...widget.contactsList
                        ?.map((contact) => SingleContact(contact: contact))
                        ?.toList()
          ],
        ),
      ),
    );
  }
}
