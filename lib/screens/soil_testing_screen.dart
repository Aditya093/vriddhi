import 'package:flutter/material.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';

class SoilTestingScreen extends StatelessWidget {
  static const String id = 'soil_testing_screen';
  const SoilTestingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: ReusableWidgets.smallAppBar("Soil Testing"),
      body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(top:15.0,left: 5.0,right: 5.0,bottom: 5.0),
                    child:
                          ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('assets/images/temp/Soil_Testing.jpg'),
                    ),),

                    Padding(
                        padding: EdgeInsets.only(top:10.0,left: 5.0,right: 5.0,bottom: 10.0),
                        child:Card(

                          color: kLightTealCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation:5.0,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Basic Testing",
                                style: kFormPrimaryHeadingStyle,

                                ),

                              ),


                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left:15.0),
                                  child:Text("Soil sample analysis for 6 parameters:",
                                    style:kTitleOfInfoCardsTS,

                                  ),
                                ),

                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                    children:[
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Ph'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Electric Conductivity (EC)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Organic Carbon (OC)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Nitrogen (N)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Phosphorus (P)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Potassium (K)'),
                                      ),
                                    ]
                                ),
                              ),
                              SizedBox(height: 10),

                              SizedBox(height: 50,width: double.infinity,),

                            ],
                          //  ha pan
                          ),
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top:10.0,left: 5.0,right: 5.0,bottom: 10.0),
                        child:Card(

                          color: kLightTealCardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation:5.0,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.center,
                                child: Text("Advanced Testing",
                                  style: kFormPrimaryHeadingStyle,

                                ),

                              ),


                              SizedBox(height: 15),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left:15.0),
                                  child:Text("Soil sample analysis for 15 parameters:",
                                    style:kTitleOfInfoCardsTS,

                                  ),
                                ),

                              ),
                              SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                    children:[
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Ph'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Electric Conductivity (EC)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Organic Carbon (OC)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Nitrogen (N)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Phosphorus (P)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Potassium (K)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Calcium (Ca)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Magnesium (Mg)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Sulphur (S)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Zinc (Zn)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Iron (Fe)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Copper (Cu)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Boron (B)'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.adjust),
                                        title: Text('Lime Requirement / Gypsum Requirement'),
                                      ),
                                    ]
                                ),
                              ),
                              SizedBox(height: 10),

                              SizedBox(height: 50,width: double.infinity,),

                            ],
                          ),
                        )
                    ),
                  ],
                ),


              ),



            ],

        ),
      );

  }
}
