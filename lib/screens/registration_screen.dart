import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vriddhi_0/constants.dart';
import 'package:vriddhi_0/global_listeners/user_data.dart';
import 'package:vriddhi_0/screens/current_screen.dart';
import 'package:vriddhi_0/services/Authentication.dart';


class RegistrationScreen extends StatelessWidget {
  // RegistrationScreen({required this.onSignIn});
  // final Function(User) onSignIn;

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
  //Firebase-Authentication variables
  late String email;
  late String password;
  late String username;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  bool isTermsCicked = false;

  //form variables
  final GlobalKey<FormBuilderState> _formKey = GlobalKey <FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    //Authentication + username params
    // final userData = Provider.of<UserData>(context);


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
                  //Heading and static text
                  Padding(
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
                  //Form Input-1 (Name)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'name',
                      decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Name", hintText: "Enter Your Name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a username';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        // Save the username value
                        if(value != null){
                          username = value;
                        }
                        else{
                          username = 'Hello';
                        }


                      },
                    ),
                  ),
                  //Form Input-2 (Email)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                      name: 'email',
                      onChanged: (value) {
                        //Firebase instance email
                        email = value!;
                      },
                      decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Email", hintText: "Enter your email-id"),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                  ),
                  //Form Input-3 (Password)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FormBuilderTextField(
                        name: 'password',
                        onChanged: (value) {
                          password = value!;
                        },
                        decoration: kFormLabelTextFieldStyle.copyWith(labelText: "Password", hintText: "Enter your password"),
                        obscureText: true,
                        validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.minLength(6)])
                    ),
                  ),
                  // Form Input-4 (Checkbox of Terms and Conditions)
                  FormBuilderCheckbox(
                    name: 'agree',
                    onChanged: (value){
                      setState(() {
                        this.isTermsCicked = value!;
                      });
                    },
                    initialValue: false,
                    checkColor: Colors.white,
                    activeColor: kPrimaryGreenColor,
                    title: Text('I agree to all terms and conditions.', style: TextStyle(color: kButtonPositiveColor, fontSize: 15.0, fontFamily: "Jaldi"),),
                    validator: FormBuilderValidators.compose([FormBuilderValidators.required(),
                    ]),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Register Button
                SizedBox(
                  height:36.0,
                  width:158.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      //Process of Firebase Registered User
                      try {
                        if (isTermsCicked == true) {
                          final userData = Provider.of<UserData>(context,listen: false);
                          userData.setUsername(username);
                          await  Authentication.registerUser(email, password, username);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CurrentBottomNavBarScreen()));
                        }
                        else if(isTermsCicked == false){
                          AlertDialog(content: Text("Please Accept the terms and conditions"),);
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontFamily: "Catamaran",
                      ),
                      backgroundColor: kButtonPositiveColor,
                    ),
                  ),
                ),
                //Space
                SizedBox(height: 20.0,),
                //Part 2
                Text(
                  "OR"
                ),
                //Space
                SizedBox(height: 20.0,),
                //Register with Google
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
                //Space
                SizedBox(height: 20.0,),
                //Pre-Registered user Option
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
                            ..onTap = (){Navigator.pushNamed(context, '/login');},
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
