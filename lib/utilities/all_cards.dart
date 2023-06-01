import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';

class SquareCard extends StatelessWidget {
  SquareCard({
    @required this.colour,
    @required this.cardChild,
  });
  final Color? colour;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: colour,
      child: cardChild,
      margin: EdgeInsets.all(5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
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
        color: kLightTealCardColor,
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

  const RectangleCard(
      {required this.relatedImagePath,
      required this.titleText,
      @required this.onTapped,
      required this.descriptionText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTap: onTapped,
        child: Card(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
          color: kLightTealCardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: ListTile(
            // crossAxisAlignment: CrossAxisAlignment.center,
            contentPadding: EdgeInsets.all(8),
            //Feature Icon
            leading: Image.asset(
              relatedImagePath,
              height: 80,
              width: 80,
            ),
            //Title Text
            title: Text(
              titleText,
              style: TextStyle(fontSize: 23, color: kNavyBlueColor, height: 1),
            ),

            subtitle: Text(descriptionText, style: kSubtitleTS),
          ),
        ),
      ),
    );
  }
}

// class TaskRectangleCard extends StatelessWidget {
//   const TaskRectangleCard({
//     required this.titleText,
//     required this.descriptionText,
//   });
//
//   final String titleText;
//   final String descriptionText;
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

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
        color: kLightTealCardColor,
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

class AgriPoolSquareCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const AgriPoolSquareCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      // margin: EdgeInsets.all(8),
      color: Color(0xFFF0F4F1),
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
            height: 80,
            width: 80,
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
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
        ],
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
        color: kLightTealCardColor,
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
        margin: EdgeInsets.only(left: 20, right: 10, bottom: 10),
        elevation: 2,
        child: ListTile(
          leading: FaIcon(
            leadingIcon,
            color: Colors.black,
          ),
          title: Text(title, style: kUserProfileCardsTitleTS),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
        ));
  }
}

class DropdownToggleCard extends StatefulWidget {
  final String title;
  final String content;

  DropdownToggleCard({required this.title, required this.content});

  @override
  _DropdownToggleCardState createState() => _DropdownToggleCardState();
}

class _DropdownToggleCardState extends State<DropdownToggleCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          children: [
            ListTile(
              title: Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: kNavyBlueColor),
              ),
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                size: 25.0,
                color: kNavyBlueColor,
              ),
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.content),
              ),
          ],
        ),
      ),
    );
  }
}

class DynamicDropdownLevelCards extends StatelessWidget {
  const DynamicDropdownLevelCards({
    required this.title,
    required this.dropdownChild,
  });
  final String title;
  final Widget dropdownChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Card(
            color: kLightTealCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: const Icon(
                FontAwesomeIcons.hourglassStart,
                size: 30.0,
                color: kButtonPositiveColor,
              ),
              title: Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    height: 1.5,
                    color: kNavyBlueColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(1.0), child: dropdownChild),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskStatus,
    required this.title,
    required this.duration,
    required this.cardIndex,
  });

  final List<bool> taskStatus;
  final String title;
  final String duration;
  final int cardIndex;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: taskStatus[cardIndex],
      child: Opacity(
        opacity: !taskStatus[cardIndex] ? 1 : 0.5,
        child: Card(
          color: kCardColorSecond,
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                title,
                style: const TextStyle(
                    fontSize: 18, color: kNavyBlueColor, height: 1),
              ),
              subtitle: Text(
                duration,
                style: const TextStyle(color: kDescriptionFontColor),
              ),
              trailing: taskStatus[cardIndex]
                  ? Icon(
                      Icons.check_circle,
                      color: kPrimaryAppColor,
                    )
                  : Icon(Icons.arrow_forward_ios,
                      color: kNavyBlueColor, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final String title;
  final String author;
  final String imagePath;

  const BlogCard({
    required this.title,
    required this.author,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                // Placeholder image to show when there is an error loading the image
                return Image.asset('assets/images/temp/Get_started.png');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'By $author',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
