import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:learning_people/Utils/spacing.dart';


class StudentProfile extends StatelessWidget {
  /// key-value pair
  ///
  /// star Key for ratings
  ///
  /// null value will leave a sized box
  final Map mapDetails;

  const StudentProfile(
    this.mapDetails, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      CardHeading('Student Profile', Icons.people),
    ];
    bool isBackColorNeeded = true;
    mapDetails.forEach((key, val) {
      // if key is star then add star component else heading component
      if (key == 'star')
        widgetList.add(
            ratingBar(context, mapDetails['star'], mapDetails['starSize']));
      else if (key != 'starSize')
        widgetList.add(
          TabularData(
            key,
            val,
            key: Key(key ?? '' + val ?? ''),
            isAlternateBackGroundNeeded: isBackColorNeeded = !isBackColorNeeded,
          ),
        );
    });
    // Adding stars
    widgetList.add(Buttons('Tips to level up', null));
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

  Widget ratingBar(BuildContext context, double yourScore, int maxScore) {
    double starSize = (MediaQuery.of(context).size.width - (maxScore + 2) * 5) /
        (maxScore + 1);
    return RatingBar(
      rating: yourScore,
      icon: Icon(
        Icons.star,
        size: starSize,
        color: Colors.grey,
      ),
      starCount: maxScore,
      spacing: 4.0,
      size: starSize,
      isIndicator: true,
      allowHalfRating: true,
      color: Colors.amber,
    );
  }
}
