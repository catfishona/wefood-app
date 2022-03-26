import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wefood_app/pages/setnpriv.dart';

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffa8dee0),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          color: Color(0xff4CAFA0),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SetAndPriv()));
          },
        ),
        title: Text(
          "Notifications",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 25, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 5,
            ),

            buildNotificationOptionRow("Reminders", false),
            Divider(
              height: 10,
              thickness: 1,
            ),
            SizedBox(
              height: 5,
            ),
            buildNotificationOptionRow("Push Notifications", true),
            SizedBox(height: 1),
            Text("We'll send you updates", style: TextStyle(color: Colors.grey, fontSize: 13)),
            Text("about the meals you shared!", style: TextStyle(color: Colors.grey, fontSize: 13)),
            Text("shared!", style: TextStyle(color: Colors.grey, fontSize: 13)),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 10,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {
              },
            ))
      ],
    );
  }


}
