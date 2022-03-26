import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:wefood_app/pages/forgotpwd.dart';
import 'package:wefood_app/pages/resetpwd.dart';

class EnterPin extends StatelessWidget {
  const EnterPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _pinController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Color(0xff85cbcc),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return ForgotPwd();
                  },
                ),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(50.0, 16.0, 50.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  elevation: 0,
                  child: SizedBox(
                      width: 350,
                      height: 250,
                      child: Image.asset("assets/images/mail.png")),
                ),
              ),
              Text(
                "Enter the Code",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Please enter enter the verification code we sent to your email address",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 30),
              Center(
                child: PinCodeTextField(
                  controller: _pinController,
                  autofocus: false,
                  maxLength: 4,
                  highlight: false,
                  hasUnderline: false,
                  hideCharacter: false,
                  pinBoxColor: Colors.white12,
                  defaultBorderColor: Color(0xffC4C4C4),
                  hasTextBorderColor: Color(0xffC4C4C4),
                ), 
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Didn't receive the code?",
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showSnackBar("Email sent", Color(0xff85CBCC),);
                    },
                    child: Text(
                      " Resend Code",
                      style: TextStyle(
                        color: Colors.amber[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 280.0,
                  child: RaisedButton(
                    elevation: 0,
                    onPressed: () {
                      if (_pinController.text == "1234") {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return ResetPwd();
                            },
                          ),
                        );
                      } else {
                        _showSnackBar("Failed to authenticate", Colors.red);
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    color: Color(0xff4CAFA0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text("Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _showSnackBar(String text, Color color) {
    Get.showSnackbar(
      GetBar(
        message: text,
        backgroundColor: color,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        animationDuration: Duration(milliseconds: 800),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }
}
