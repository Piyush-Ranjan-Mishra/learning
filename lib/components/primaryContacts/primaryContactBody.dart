import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/model/allModel.dart';


class SingleContact extends StatelessWidget {
  final Contacts contact;
  const SingleContact({this.contact, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularIcon(
        
        Icons.people,
        imageUrl: contact.imageUrl,
        backgroundColor: Colors.grey,
        iconsColor: Colors.grey[200],
        radius: 30,
      ),
      title: Text(contact.serviceTitle ?? ''),
      subtitle: Text(contact.text ?? ''),
      trailing: true? Icon(Icons.call): Buttons('View \nContact \nDetails', () {}),
    );
  }
}
