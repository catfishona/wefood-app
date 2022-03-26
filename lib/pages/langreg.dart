import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect.dart';
import 'package:wefood_app/pages/setnpriv.dart';

class LangReg extends StatefulWidget {
  @override
  _LangRegState createState() => _LangRegState();
}

class _LangRegState extends State<LangReg> {
  List<bool> isSelectedList = [true, false];
  bool isEnabled = true;
  String viewer = "English (International)";

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
          "Languages & Region",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              "Select Language",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                InkWell(
                                    child: Text("English (International)",),
                                    onTap: () {
                                      isEnabled = true;

                                      setState(
                                        () {
                                          isSelectedList[0] = true;
                                          isSelectedList[1] = false;
                                        },
                                      );
                                      // TODO: mau langsung pop ga?
                                      // Navigator.of(context).pop();
                                      _isSelected();
                                    }),
                                SizedBox(height: 10),
                                InkWell(
                                    child: Text("Indonesian"),
                                    onTap: () {
                                      isEnabled = true;

                                      setState(
                                        () {
                                          isSelectedList[0] = false;
                                          isSelectedList[1] = true;
                                        },
                                      );
                                      _isSelected();
                                      //Navigator.of(context).pop();
                                    }),
                              ],
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close")),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(viewer,
                        style: TextStyle(
                          color: Color(0xff85CBCC),
                         //fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ))),
              ],
            ),
            SizedBox(height: 15),
            Divider(
              height: 10,
              thickness: 1,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Country",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            "Select Country",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              InkWell(
                                  child: Text("Indonesia"),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Close")),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Indonesia",
                    style: TextStyle(
                      color: Color(0xff85CBCC),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _isSelected() {
    setState(() {
      if (isSelectedList[0] == true) {
        viewer = "English (International)";
      } else if (isSelectedList[1] == true) {
        viewer = "Indonesian";
      } else {
        viewer = "English (International)";
      }
    });
  }
}
