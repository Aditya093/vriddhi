import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/screens/current_screen.dart';
import 'package:vriddhi_0/screens/login_screen.dart';
import 'package:vriddhi_0/services/Authentication.dart';

import 'home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = 'registration_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryAppbarColor,
        leadingWidth: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      body: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey <FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child:Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registration",
                          style: kFormPrimaryHeadingStyle,
                        ),
                        Text(
                          "Fill your account details",
                          style: kFormSecondaryHeadingStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'name',
                      decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Name", hintText: "Enter Your Name"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Email", hintText: "Enter your email-id"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                        name: 'password',
                        decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Password", hintText: "Enter your password"),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.minLength(8)])
                    ),
                  ),
                  FormBuilderCheckbox(
                    name: 'agree',
                    initialValue: false,
                    checkColor: Colors.white,
                    activeColor: kPrimaryGreenColor,
                    title: Text('I agree to all terms and conditions.', style: TextStyle(color: kButtonPositiveColor, fontSize: 15.0, fontFamily: "Jaldi"),),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                      // FormBuilderValidators.,
                    ]),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height:36.0,
                  width:158.0,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CurrentBottomNavBarScreen()));
                    } ,
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: "Catamaran",
                      ),
                      backgroundColor: kButtonPositiveColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(
                  "OR"
                ),
                SizedBox(height: 20.0,),
                SizedBox(
                  height:60.0,
                  width:258.0,
                  child: ElevatedButton(
                    onPressed: (){} ,
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap:()async{
                            var user =
                                await Authentication.signInWithGoogle(context: context);
                            if(user !=null){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => CurrentBottomNavBarScreen(
                                  ),
                                ),
                              );
                            }
                          },
                          child: ListTile(
                            leading: Icon(FontAwesomeIcons.google, color: kButtonPositiveColor,),
                            title: Text("Sign Up with Google", style: TextStyle(color: kButtonPositiveColor,fontSize: 15.0)),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: "Catamaran",
                      ),
                      backgroundColor: kBackgroundColor,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have an account ? ", style: TextStyle(color: kButtonPositiveColor, fontSize: 16.0),),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Login now !",
                          style: TextStyle(color: kPrimaryGreenColor, fontSize: 16.0),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (){Navigator.pushNamed(context, LoginScreen.id);},
                        ),
                      ],
                    ),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
