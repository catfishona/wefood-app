import 'package:flutter/material.dart';
import 'package:wefood_app/pages/signuppage.dart';
import 'donor/create_account/donortype.dart';

class SelectUserType extends StatefulWidget {
  @override
  _SelectUserTypeState createState() => _SelectUserTypeState();
}

class _SelectUserTypeState extends State<SelectUserType> {
  List<bool> isPressedList = [false, false];

  bool isEnabled = false;

  sampleFunction() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (isPressedList[1] == false) {
            return SelectDonorType();
          }
          // TODO: edit!
          else {
            return SelectUserType();
          }
        },
      ),
    );
  }

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
                    value: 0.25, // percent filled
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
            SizedBox(height: 20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Color(0xffE5E5E5), // Button color
                        child: InkWell(
                          splashColor: Color(0XffFBC78D), // Splash color
                          onTap: () {
                            setState(() {
                              isPressedList[0] = true;
                              isPressedList[1] = false;
                              isEnabled = true;
                            });
                          },
                          child: ChoiceButton(
                            isPressed: isPressedList[0],
                            iconbutt: Icons.volunteer_activism,
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
                SizedBox(width: 40),
                Column(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Color(0xffE5E5E5), // Button color
                        child: InkWell(
                          splashColor: Color(0XffFBC78D), // Splash color
                          onTap: () {
                            setState(() {
                              isPressedList[0] = false;
                              isPressedList[1] = true;
                              isEnabled = true;
                            });
                          },
                          child: ChoiceButton(
                            isPressed: isPressedList[1],
                            iconbutt: Icons.emoji_people_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Donee",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 215),
            SizedBox(
              width: 200.0,
              child: RaisedButton(
                elevation: 0,
                onPressed: isEnabled ? () => sampleFunction() : null,
                
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                color: isEnabled ? Color(0xff1AAE9F) : Colors.grey,
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
}

class ChoiceButton extends StatelessWidget {
  final bool isPressed;
  final IconData iconbutt;

  ChoiceButton({required this.isPressed, required this.iconbutt});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 115,
      decoration: BoxDecoration(
        color: isPressed ? Color(0XffFBC78D) : Colors.transparent,
      ),
      child: Center(
        child: SizedBox(
          width: 115,
          height: 115,
          child: Icon(iconbutt,
              size: 50, color: isPressed ? Color(0xffE8833A) : Colors.grey),
        ),
      ),
    );
  }
}
