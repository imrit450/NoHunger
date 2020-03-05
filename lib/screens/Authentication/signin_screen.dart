import 'package:appcup/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:appcup/components/inputfield.dart';
import 'package:appcup/components/large_btn.dart';
import 'package:appcup/constants.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({ this.toggleView });
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthenticationController _auth = AuthenticationController();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(

          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                Container(margin: EdgeInsets.all(20), padding: EdgeInsets.only(top: 40) ,child: Image.asset('assets/images/logo.png'),),
                InputField(
                  textPlaceholder: 'Email',
                  iconName: 'emailIcon.png',
                  textType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (val) => val.isEmpty ? 'Email should not left Empty.' : null,
                ),
                InputField(
                  textPlaceholder: 'Password',
                  iconName: 'password.png',
                  textType: TextInputType.text,
                  obscure: true,
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (val) => val.length < 6 ? 'Password should be more than 6 Characters.' : null,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Align(
                    child: Text('Forget Password?', textAlign: TextAlign.right,style: TextStyle(
                      color: Colors.grey
                    ),), alignment: Alignment.centerRight,
                  ),
                ),
                LargeButton(
                  myText: 'Sign In',
                  startColor: Color(0xFF00C14D),
                  endColor: Color(0xFF02DB96),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                        setState(() {
                          error = 'Please Enter a Registered Account';
                        });
                      } else
                      Navigator.pushNamed(context, '/donor_screen');
                    }
                  },
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'New user? ',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color:Colors.black45),
                      ),
                      GestureDetector(
                        onTap: () {

                          Navigator.pushNamed(context, '/userselect_screen');
                        },
                        child: Text(
                          'Sign Up',
                          style: kTextStyleAccent,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}