import 'package:flutter/material.dart';
import 'package:learning_people/Utils/spacing.dart';
import 'package:learning_people/Utils/style.dart';
import 'package:learning_people/model/allModel.dart';

class RecommendationBody extends StatelessWidget {
  final List<LPRecommendation> recommendationList;
  const RecommendationBody(this.recommendationList,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeBetweenWidget,
        ),
        Text(
            'Maximise your career and earning potential with the following courses'),
        SizedBox(
          height: sizeBetweenWidget,
        ),
            ...(recommendationList.map((el)=>SingleRecommendation(el)).toList()),
      ],
    );
  }
}

class SingleRecommendation extends StatelessWidget {
  final LPRecommendation recommendation;
  const SingleRecommendation(this.recommendation, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //TODO
      },
      child: Row(
        children: [
          Icon(Icons.done, size: recommendationIconSize, color: iconColor,),
          SizedBox(
            width: sizeBetweenWidget,
          ),
          Text(recommendation.name, style: yellowTextStyle(fontSize: 17.0, fontWeight: FontWeight.bold ),)
        ],
      ),
    );
  }
}
