import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/soil_details_screen.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';


class BasicDetailsScreen extends StatelessWidget {
  static const String id = 'basic_details_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar:ReusableWidgets.smallAppBar('Predict'),
        body: BasicDetailsForm(),
      ),
    );
  }
}

class BasicDetailsForm extends StatefulWidget {
  @override
  State<BasicDetailsForm> createState() => _BasicDetailsFormState();
}

class _BasicDetailsFormState extends State<BasicDetailsForm> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>(); //global key  to uniquely identify the form widget and helps in validating

  void _submitForm(){
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Map<String, dynamic> formData = _formKey.currentState!.value;
      // data['timestamp'] = DateTime.now().millisecondsSinceEpoch;
      // await _database.push().set(data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form submitted successfully'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crop Prediction",
                style: TextStyle(
                  fontFamily: "Jaldi",
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                  color: kHeadingTextColor,
                ),
              ),
              Text(
                "Answer the questions given below",
                style: TextStyle(
                  fontFamily: "Catamaran",
                  fontSize: 15.0,
                  color: Color(0xFF9B9B9B),
                ),
              ),
              FormBuilder(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Details",
                      style: kFormTextFieldLabelStyle.copyWith(
                          fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Location',
                            style: kFormTextFieldLabelStyle,
                          ),
                          FormBuilderTextField(
                            name: "location",
                            decoration: kFormTextFieldStyle,
                            validator: FormBuilderValidators.required(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2. Farming Area',
                            style: kFormTextFieldLabelStyle,
                          ),
                          FormBuilderTextField(
                              name: "farming_area",
                              decoration: kFormTextFieldStyle.copyWith(
                                  hintText: "( in square meters )"),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric()
                              ])),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3. Annual Income',
                            style: kFormTextFieldLabelStyle,
                          ),
                          FormBuilderTextField(
                            name: "annual_income",
                            decoration: kFormTextFieldStyle.copyWith(
                                hintText: "( in rupees )"),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.numeric()
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4. Past Grown Crop',
                            style: kFormTextFieldLabelStyle,
                          ),
                          FormBuilderTextField(
                            name: "past_crop_grown",
                            decoration: kFormTextFieldStyle.copyWith(
                                hintText: "( Ex: KidneyBeans )"),
                            validator: FormBuilderValidators.required(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 12.0, left: 12.0, right: 12.0, bottom: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5. WorkForce',
                            style: kFormTextFieldLabelStyle,
                          ),
                          FormBuilderTextField(
                            name: "workforce",
                            decoration: kFormTextFieldStyle.copyWith(
                                hintText: "( number of Workers )"),
                            // validator: FormBuilderValidators.required(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(
                                fontFamily: "Catamaran",
                              ),
                              backgroundColor: kButtonPositiveColor,
                            ),
                            onPressed: () {
                              //will move forward to soil details screen
                              _submitForm();
                              try{
                                Navigator.push(context,MaterialPageRoute(builder: (context) => SoilDetailsScreen(),),);
                              }catch(e){
                                print(e);
                              }
                            },
                            child: Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



