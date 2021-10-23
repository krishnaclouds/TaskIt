import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final formKey = new GlobalKey<FormState>();

  late String email, password;

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return 'Pass';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(
            height: 75.0,
          ),
          Container(
            height: 125.0,
            width: 200.0,
            child: Stack(
              children: [
                Text(
                  'TaskIt',
                  style: TextStyle(
                    fontFamily: 'ProximaNova',
                    fontSize: 60.0,
                  ),
                ),
                Positioned(
                  top: 63.0,
                  left: 10.0,
                  child: Text(
                    'Plan as you go along!',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'ProximaNova',
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                ),
                // Positioned(
                //   top: 80.0,
                //   left: 190.0,
                //   child: Container(
                //     height: 10.0,
                //     width: 10.0,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.green
                //     ),
                //   ),
                // )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.withOpacity(0.5),
                  fontFamily: 'ProximaNova',
                  fontWeight: FontWeight.w800,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                )),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) => value!.isEmpty ? 'Email is required' : null,
          ),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey.withOpacity(0.5),
                    fontFamily: 'ProximaNova',
                    fontWeight: FontWeight.w800,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Container()));
              },
              child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text('Forgot Password',
                          style: TextStyle(
                            color: greenColor,
                            fontSize: 11.0,
                            decoration: TextDecoration.underline,
                            fontFamily: 'ProximaNova',
                            fontWeight: FontWeight.w800,
                          ))))),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) {}
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    // shadowColor: Colors.greenAccent,
                    color: greenColor,
                    elevation: 4.0,
                    child: Center(
                        child: Text('LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ProximaNova',
                              fontWeight: FontWeight.w800,
                            ))))),
          ),
        ],
      ),
    );
  }
}
