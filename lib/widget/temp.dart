import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:wefood_app/pages/donor/create_account/donorform.dart';
import 'package:latlong2/latlong.dart';
import 'package:wefood_app/widget/holupoo.dart';
import 'package:wefood_app/widget/search_widget.dart';

class SelectMap extends StatefulWidget {
  @override
  _SelectMapState createState() => _SelectMapState();
}

class _SelectMapState extends State<SelectMap> {
  List<String> locations = [];
  final TextEditingController ctrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xffa8dee0),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff45AEB1),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DonorForm();
                },
              ),
            );
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(
              center: LatLng(-6.8865, 107.5809),
              zoom: 18.0,
            ),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayerOptions(
                markers: [
                  Marker(
                      width: 45.0,
                      height: 45.0,
                      point: LatLng(-6.8865, 107.5809),
                      builder: (ctx) => Container(
                            child: IconButton(
                              icon: Icon(Icons.location_on),
                              color: Colors.red,
                              iconSize: 45.0,
                              onPressed: () {},
                            ),
                          )),
                ],
              ),
            ],
          ),
          Positioned(
            top: 600,
            child: Container(
                color: Colors.white,
                width: 410,
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text("Select your address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(width: 120),
                          IconButton(
                            icon: Icon(
                              Icons.search_outlined,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return buildSheet();
                                  });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.gps_fixed_outlined,
                            color: Colors.amber[900],
                          ),
                          SizedBox(width: 25),
                          Text("We Food HQ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 50),
                          Text(
                              "Jl. Surya Sumantri No.65, Sukawarna, Kec. Suka\njadi, Kota Bandung, Jawa Barat 40164",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 240),
                          SizedBox(
                            height: 40.0,
                            width: 125.0,
                            child: RaisedButton(
                              elevation: 0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      //return DonorForm();
                                      return FilterLocalListPage();
                                    },
                                  ),
                                );
                              },
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              color: Color(0xff1AAE9F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        //text: query,
        hintText: 'Title or Author Name', onChanged: (String value) {},
        text: '',
        //onChanged: searchBook,
      );

  Widget buildSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, controller) {
        return Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select your address",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.gps_fixed_outlined,
                      color: Colors.amber[900],
                    ),
                    SizedBox(width: 25),

                    // Container(
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       hintText: 'Enter a search term',
                    //     ),
                    //     controller: ctrl,
                    //     onSubmitted: (text) {
                    //       locations.add(text);
                    //       ctrl.clear();
                    //       setState(() {});
                    //     },
                    //   ),
                    // )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.map_outlined,
                    ),
                    SizedBox(width: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "SELECT VIA MAP",
                        style: TextStyle(fontSize: 14),
                      ),
                      // Text("SELECT VIA MAP", style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                //TODO: edit so fill the whole width of screem
                Divider(
                  thickness: 1,
                  height: 20,
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(height: 20),
                // new Expanded(
                //     child: new ListView.builder(
                //         itemCount: locations.length,
                //         itemBuilder: (BuildContext ctxt, int Index) {
                //           return new Text(locations[Index]);
                //         }))
                
              ],
            ));
      },
    );
  }
}

// Padding(
//                     padding: EdgeInsets.only(left: 40),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             temp = "a";
//                             _funk();
//                           },
//                           child: Text("Garda Pangan"),
//                         ),
//                         SizedBox(height: 20),
//                         Text("Food Bank Dago"),
//                       ],
//                     ))
