import 'package:flutter/material.dart';
import 'package:wefood_app/pages/signuppage.dart';
import 'donor/create_account/donortype.dart';

class SelectUserType extends StatefulWidget {
  @override
  _SelectUserTypeState createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  int buttonSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: Color(0xff4CAFA0),
          iconSize: 36,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignUpMain()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 20,
                  width: 300,
                  child: LinearProgressIndicator(
                    value: 0.25,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0XffFBC78D)),
                    backgroundColor: Color(0xFFE5E5E5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: Text(
                "Select User Type",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 28),
            Center(
              child: Text(
                "Please choose which description\n fits you best",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(height: 70),
            buttonSelection(0),
            buttonSelection(1),
            SizedBox(height: 15),
            SizedBox(height: 200),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                // TODO: set all elevation to 0
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectDonorType();
                      },
                    ),
                  );
                },
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                color: Color(0xff1AAE9F),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buttonSelection(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipOval(
              child: Material(
                color: Color(0xffE5E5E5), // Button color
                child: InkWell(
                  splashColor: Color(0xffA8DEE0), // Splash color
                  onTap: () {
                    setState(() {
                      buttonSelected = index;
                    });
                  },
                  child: SizedBox(
                    width: 115,
                    height: 115,
                    child: Icon(Icons.volunteer_activism,
                        size: 50,
                        color: buttonSelected == index
                            ? Color(0xff45AEB1)
                            : Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Donor",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
