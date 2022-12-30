import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orangeAccent[100],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Make a reservation"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.sort,
            ),
            onPressed: () => {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 10,
                  color: Colors.orangeAccent[100],
                  margin: EdgeInsets.all(0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: <Widget>[
                      //         Row(
                      //           children: <Widget>[
                      //             Text(
                      //               "John Doe ",
                      //               style: TextStyle(
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             Icon(
                      //               Icons.done,
                      //               size: 15,
                      //             )
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         Text(
                      //           "Thane, India",
                      //           style: TextStyle(
                      //             fontSize: 14,
                      //           ),
                      //         ),
                      //         SizedBox(
                      //           height: 5,
                      //         ),
                      //         Row(
                      //           children: <Widget>[
                      //             for (int i = 0; i < 5; i++)
                      //               Icon(
                      //                 Icons.star,
                      //                 size: 17,
                      //               )
                      //           ],
                      //         ),
                      //         SizedBox(
                      //           height: 7,
                      //         ),
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       width: 50,
                      //     ),
                      //     IconButton(
                      //       icon: Icon(Icons.share),
                      //       onPressed: () {},
                      //     ),
                      //     IconButton(
                      //       icon: Icon(Icons.favorite),
                      //       onPressed: () {},
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Available Timings",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 55,
                        color: Colors.black54,
                        height: 3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    height: 110,
                                    width: 110,
                                  ),
                                ),
                                Container(
                                  height: 110,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                                Container(
                                  height: 110,
                                  width: 90,
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '09:00',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'AM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 55,
                        color: Colors.black54,
                        height: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 15,
                  color: Colors.grey,
                ),
                // Divider(
                //   height: 15,
                //   color: Colors.grey,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
