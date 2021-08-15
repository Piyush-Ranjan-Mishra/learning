import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';

class BadgesEarned extends StatelessWidget {
  
  const BadgesEarned({Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle normalText =
        Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white);
    return Card(
      margin: marginCards,
      child: Container(
        padding: paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Badges Earned', Icons.star_border_outlined),
            Container(
                color: primaryColor,
                child: ExpansionTile(
                  backgroundColor: primaryColor,
                  title: Text(
                    'View Earned',
                    style: normalText,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
