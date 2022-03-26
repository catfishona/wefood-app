import 'package:flutter/material.dart';
import 'package:wefood_app/pages/setnpriv.dart';
import 'package:wefood_app/widget/button_profdon_widget.dart';

class ProfileDonee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffa8dee0),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, //to remove back button
        title: Text(
          "My Profile",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            color: Color(0xff4CAFA0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SetAndPriv();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: <Widget>[
              Image(
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1549848493-e49f154aef92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80'),
              ),
              Positioned(
                bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1549848493-e49f154aef92?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=688&q=80'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Center(
            child: Column(
              children: [
                Text(
                  'Rajut Asa',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '@rajutasa_id',
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                Text(
                  'Organization',
                  style: TextStyle(
                      fontFamily: 'Montserrat', color: Colors.teal[600]),
                ),
              ],
            ),
          ),
          // FlatButton.icon(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.mail,
          //     color: Colors.white,
          //   ),
          //   label: Text(
          //     'Hire Me',
          //     style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
          //   ),
          //   color: Colors.blue,
          //   shape:
          //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          // ),
          SizedBox(height: 10),
          // buildUpgradeButton(),
          SizedBox(height: 2),
          Divider(
            height: 15,
            thickness: 2,
          ),

          Center(
            child: Column(
              children: [
                buildAbout(
                  'A student-run, non-profit organization\nfocused on raising awareness by curating\nfundraisers and contributing to causes that matter.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget buildUpgradeButton() => ButtonWidget(
  //       text: 'Edit Profile',
  //       onClicked: () {},
  //     );

  Widget buildAbout(String text) => Container(
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                height: 1.4,
              ),
            ),
          ],
        ),
      );
}
