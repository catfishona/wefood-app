import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefood_app/Pages/loginpage.dart';
import 'package:wefood_app/pages/enterpin.dart';

class ForgotPwd extends StatefulWidget {
  @override
  _ForgotPwdState createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  return LogInPage();
                },
              ),
            );
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(50.0, 16.0, 50.0, 16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Card(
                    elevation: 0,
                    child: SizedBox(
                        width: 350,
                        height: 250,
                        child: Image.asset("assets/images/forgotpwd.png")),
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  "Forgot Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Please enter your email address to receive a verification code",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 15),
                SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  cursorColor: Color(0xff4CAFA0),
                  decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xff4CAFA0), width: 1.5),
                    ),
                    hintText: "Email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide:
                          BorderSide(color: Color(0xffC4C4C4), width: 1),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: 280.0,
                    child: RaisedButton(
                      elevation: 0,
                      onPressed: () {
                        if (_emailController.text != "budi@gmail.com" && _emailController.text.contains("@")) {
                          return _showSnackBar("Email is not registered");
                         } else if(!(_emailController.text.contains("@"))){
                            return _showSnackBar("Enter a valid email address!");
                         }
                        else{
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return EnterPin();
                              },
                            ),
                          );
                        }
                      },
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      color: Color(0xff4CAFA0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text("Send Verification Code",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showSnackBar(String text) {
    Get.showSnackbar(
      GetBar(
        message: text,
        backgroundColor: Colors.red,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        animationDuration: Duration(milliseconds: 800),
        snackPosition: SnackPosition.TOP,
      ),
    );
  }
}
