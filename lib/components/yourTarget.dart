import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';


class YourTarget extends StatelessWidget {
  final Map mapDetails;

  const YourTarget(this.mapDetails,
      { Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      CardHeading('Your targets', Icons.arrow_circle_up_rounded)
    ];
    bool isBackColorNeeded = true;
    mapDetails.forEach((key, val) {
      widgetList.add(
        TabularData(
          key,
          val,
          key: Key(key + val),
          isYellow: true,
          isAlternateBackGroundNeeded: isBackColorNeeded = !isBackColorNeeded,
        ),
      );
    });
    return Card(
      margin: marginCards,
      child: Padding(
        padding: paddingAll10Bottom30,
        child: Column(
          children: widgetList,
        ),
      ),
    );
  }
}
