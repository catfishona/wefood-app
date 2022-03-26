import 'package:flutter/material.dart';
import 'dart:async';
import 'package:wefood_app/Pages/loginpage.dart';

class SplashCa extends StatefulWidget {
  @override
  _SplashCaState createState() => _SplashCaState();
}

class _SplashCaState extends State<SplashCa> {
  @override
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_) {
        // TODO: ubah jadi HOME
        return new LogInPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xffa8dee0), Color(0xffa8dee0)])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Image.asset(
                  "assets/images/thankyou.png",
                  height: 800.0,
                  width: 700.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
