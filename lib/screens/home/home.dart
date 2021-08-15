import 'package:flutter/material.dart';
import 'package:learning_people/Utils/style.dart';  
import 'package:learning_people/components/components.dart';
import 'package:learning_people/model/allModel.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: 
         ListView( 
          children: [
            AppBarComponent('Piyush',
                'https://miro.medium.com/fit/c/1020/1020/0*VNIMlw6eNljQuKOU.jpg'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Learning People Student Profile',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            StudentProfile({
              'Name': 'TestName',
              'Learning People Id': '007007',
              'First Enrolled': '27 January 2020',
              'Current Course/Collection': 'CEO for Dummies',
              'length': null,
              'Learning People Level': ' 3 of 9',
              'star': 3.0,
              'starSize': 9,
            }),
            YourTarget({
              'Target Salary': "\$250,000",
              'Target Exam Date': '11-Jan-2021'
            }),
            LeaderBoard(),
            BadgesEarned(),
            PrimaryContacts(contactsList: dummyContactList,),
            FinanceUpdate(finance: dummyFinance,),
            Recommendations(recommendationList: dummyRecommendationList,),
            Notifications(dummyNotificationData),
          ],
        ),
      ),
    );
  }

  
}
