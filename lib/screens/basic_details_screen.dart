import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/soil_details_screen.dart';
import 'package:vriddhi_0/widgets/reusable_widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;


class BasicDetailsScreen extends StatelessWidget {
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

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();//global key  to uniquely identify the form widget and helps in validating
  final TextEditingController _locationController = TextEditingController();
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _selectLocation() async {
    final LatLng? selectedLocation = await showDialog(
      context: context,
      builder: (BuildContext context) {
        LatLng? selectedLatLng;
        return AlertDialog(
          title: Text('Select Location', style: kFormTextFieldLabelStyle,),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(20.59, 78.96),
                zoom:3.0,
              ),
              markers: _markers,
              onTap: (LatLng latLng) {
                setState(() {
                  _markers = {
                    Marker(
                      markerId: MarkerId('selected_location'),
                      position: latLng,
                    ),
                  };
                });
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Done', style: kFormTextFieldLabelStyle.copyWith(fontSize: 16.0),),
              onPressed: () {
                if (_markers.isNotEmpty) {
                  final selectedMarker = _markers.first;
                  selectedLatLng = selectedMarker.position;
                  Navigator.of(context).pop(selectedLatLng);
                }else{
                  selectedLatLng = LatLng(20.59, 78.96);
                  Navigator.of(context).pop(selectedLatLng);
                }
              },
            ),
          ],
        );
      },
    );

    if (selectedLocation != null) {
      final addresses = await geocoding.placemarkFromCoordinates(
        selectedLocation.latitude,
        selectedLocation.longitude,
      );

      final city = addresses.first.locality;

      setState(() {
        _locationController.text = city ?? '';
      });
    }
  }

  void _submitForm(){
    if (_formKey.currentState!.validate() == true) {
      _formKey.currentState!.save();

      Map<String, dynamic> formData = _formKey.currentState!.value;

      Navigator.push(context,MaterialPageRoute(builder: (context) => SoilDetailsScreen(),),);

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
                style: kGreySubtitleTS,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1.Farm Location',
                                style: kFormTextFieldLabelStyle,
                              ),
                              TextButton(
                                // onPressed: (){},
                                onPressed: _selectLocation,
                                child: Text('Select Location', style:kFormTextFieldLabelStyle.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                            Opacity(
                              opacity: 0.5,
                              child: FormBuilderTextField(
                                name: "location",
                                controller: _locationController,
                                enabled: false,
                                decoration: kFormTextFieldStyle.copyWith(
                                    hintText: "Select Your location"),
                                validator: FormBuilderValidators.required(),
                              ),
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
                    // Padding(
                    //   padding: EdgeInsets.all(12.0),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         '3. Annual Income',
                    //         style: kFormTextFieldLabelStyle,
                    //       ),
                    //       FormBuilderTextField(
                    //         name: "annual_income",
                    //         decoration: kFormTextFieldStyle.copyWith(
                    //             hintText: "( in rupees )"),
                    //         validator: FormBuilderValidators.compose([
                    //           FormBuilderValidators.required(),
                    //           FormBuilderValidators.numeric()
                    //         ]),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3. Past Grown Crop',
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
                            '4. WorkForce',
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
                              Navigator.push(context,MaterialPageRoute(builder: (context) => SoilDetailsScreen(),),);

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



