import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/utilities/all_cards.dart';

class BlogInfoScreen extends StatelessWidget {
  static const String id = 'blog_info_screen';

  const BlogInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(8.0),
        child:SingleChildScrollView(
        child:Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: const [

          Padding(padding: EdgeInsets.only(top: 25),),
          Text("Blogs",
            style: kFormPrimaryHeadingStyle,
          ),
          SizedBox(width:16),
          BlogCard(
            title: 'Barnhardt Cotton’s Circle of Life',
            author: 'Dixit Mehta',
            imagePath: 'assets/images/temp/Cotton-Plant.jpg',
          ),
          BlogCard(
            title: 'Oranges: Nutrients, Benefits, Juice, and More',
            author: 'Devina Bhattacharjee',
            imagePath: 'assets/images/temp/Growing-Orange-Trees-commercially.jpg',
          ),
          BlogCard(
            title: 'Grapes: How they reached India, types and health benefits',
            author: 'Rahul Trivedi',
            imagePath: 'assets/images/temp/grapes.jpg',
          ),
          BlogCard(
            title: 'Wheat production to be record high despite unseasonal rains: Officials',
            author: 'Daljeet Taneja',
            imagePath: 'assets/images/temp/Wheat.jpg',
          ),
          BlogCard(
            title: 'Mahindra’s Tractor’s Potato Farming Guide',
            author: 'Drasthi Thakur',
            imagePath: 'assets/images/temp/Mahindras-Tractors.jpg',
          ),
        ],



        ),
        )
      ),


    );
  }
}
