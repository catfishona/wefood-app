import 'package:flutter/material.dart';
import 'package:wefood_app/widget/google_signin_api.dart';

class GoogleSignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 50,
        width: 320,
        child: RaisedButton(
          color: Colors.white,
          textColor: Colors.black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffC4C4C4), width: 1),
            borderRadius: BorderRadius.circular(4.0),
          ),
          onPressed: signIn,
          child: Row(
            children: <Widget>[
              new Image.asset('assets/images/google.png',
                  height: 25, width: 25),
              SizedBox(width: 17),
              Text('Log in with Google',
                  style: TextStyle(fontSize: 15, color: Color(0xff697178))),
            ],
          ),
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        ),
      ),
    );
  }

  Future signIn() async {
    await GoogleSignInApi.login();
  }
}
