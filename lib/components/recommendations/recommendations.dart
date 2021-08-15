import 'package:flutter/material.dart';
import 'package:learning_people/Utils/commonWidgets.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/model/allModel.dart';

import 'recommendationBody.dart';

class Recommendations extends StatefulWidget {
  final List<LPRecommendation> recommendationList;

  const Recommendations({this.recommendationList, Key key}) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: marginCards,
      child: Container(
        padding: paddingAll10Bottom30,
        child: Column(
          children: [
            CardHeading('Recommendations', Icons.computer),
            ExpandingHeader(
              'View Recommendation',
              active: active,
              onTap: () => setState(() => active = !active),
            ),
            if (active) RecommendationBody(widget.recommendationList),
          ],
        ),
      ),
    );
  }
}
