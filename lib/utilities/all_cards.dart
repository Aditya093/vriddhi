import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';

class SquareCard extends StatelessWidget {
  SquareCard(
      {@required this.colour,
      @required this.cardChild,
      @required this.onPress});
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: colour,
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class BoxCard extends StatelessWidget {
  final Widget cardChild;
  final VoidCallback? onTapped;
  const BoxCard({required this.cardChild, @required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Card(
        color: kCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: EdgeInsets.only(top: 110, left: 20, right: 20),
        child: Container(
          height: 200,
          child: cardChild,
        ),
      ),
    );
  }
}

class RectangleCard extends StatelessWidget {
  final VoidCallback? onTapped;
  final String relatedImagePath;
  final String titleText;
  final String descriptionText;

  const RectangleCard({required this.relatedImagePath,
  required this.titleText, @required this.onTapped, required this.descriptionText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Card(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
        color: kCardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListTile(
          // crossAxisAlignment: CrossAxisAlignment.center,
          contentPadding: EdgeInsets.all(5),
            //Feature Icon
          leading: Image.asset(
              relatedImagePath,
              height: 80,
              width: 80,
            ),
            //Title Text
          title: Text(
              titleText,
              style: TextStyle(fontSize: 23, color: kNavyBlueColor,height: 1),
              ),

          subtitle: Text(descriptionText, style: kSubtitleTS),

        ),
      ),
    );
  }
}

class TaskRectangleCard extends StatelessWidget {
  final Widget? cardChild;
  const TaskRectangleCard({@required this.cardChild});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // width: 170,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      decoration: BoxDecoration(
        color: kCardColorSecond,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: cardChild,
    );
  }
}

class SmallSquareCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTapCard;
  const SmallSquareCard(
      {Key? key,
      required this.title,
      required this.imagePath,
      @required this.onTapCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCard,
      child: Card(
        elevation: 4,
        // margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            // SizedBox(height: 10),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  // softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // height: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

class SmallWeatherSpecsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;

  const SmallWeatherSpecsCard(
      {Key? key,
      required this.title,
      required this.icon,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Card(
        elevation: 2,
        color: kCardColor,
        // margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            FaIcon(
              icon,
              size: 35,
            ),
            SizedBox(height: 5),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  title,
                  // softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // height: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  subtitle,
                  // softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,

                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}

class UserProfileRectangleCards extends StatelessWidget {
  const UserProfileRectangleCards({
    required this.leadingIcon,
    required this.title,
  });
  final IconData leadingIcon;
  // final IconData trailingIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 20,right: 10,bottom: 10),
        elevation: 2,
        child: ListTile(
          leading: FaIcon(leadingIcon, color: Colors.black,),
          title:  Text(title, style: kUserProfileCardsTitleTS),
          trailing:Icon(Icons.arrow_forward_ios,size: 15,),
        )
    );
  }
}


