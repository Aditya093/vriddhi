import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/data_lists/agripool_features.dart';
import 'package:vriddhi_0/screens/agripool_feature_details_screen.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class AgriPoolScreen extends StatefulWidget {

  @override
  State<AgriPoolScreen> createState() => _AgriPoolScreenState();
}

class _AgriPoolScreenState extends State<AgriPoolScreen> {


  List<SmallSquareCard> featureList = AgriPoolFeatures.agripoolfeatures;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: ReusableWidgets.smallAppBar('AgriPool'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0,left:15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("How would you like to help us ?", style:kFormTextFieldLabelStyle),
                  RichText(text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Learn how it would help others",
                        style:kFormSecondaryHeadingStyle.copyWith(color:Color(0xFF7474E6),),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (){}
                      ),
                    ],
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  itemBuilder: (BuildContext context, int index) {
                    final current_feature = featureList[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AgriPoolFeatureDetailsScreen(featureName: featureList[index].title),
                          ),
                        );
                      },
                      child: AgriPoolSquareCard(
                          title: current_feature.title,
                          imagePath: current_feature.imagePath,
                          ),
                    );
                  },
                  itemCount: featureList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
