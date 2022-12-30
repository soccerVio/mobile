import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:soccervio/constants.dart';

void main() => runApp(DateTimePicker());

class DateTimePicker extends StatefulWidget {
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int numOfItems = 1;
  SizedBox buildOutlineButton({IconData? icon, press()?}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  String _date = "Not set";
  String _time = "Not set";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Make a reservation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year} - ${date.month} - ${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // RaisedButton(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0)),
              //   elevation: 4.0,
              //   onPressed: () {
              //     DatePicker.showTimePicker(context,
              //         theme: DatePickerTheme(
              //           containerHeight: 210.0,
              //         ),
              //         showTitleActions: true, onConfirm: (time) {
              //       print('confirm $time');
              //       _time = '${time.hour} : ${time.minute} : ${time.second}';
              //       setState(() {});
              //     }, currentTime: DateTime.now(), locale: LocaleType.en);
              //     setState(() {});
              //   },
              //   child: Container(
              //     alignment: Alignment.center,
              //     height: 50.0,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: <Widget>[
              //         Row(
              //           children: <Widget>[
              //             Container(
              //               child: Row(
              //                 children: <Widget>[
              //                   Icon(
              //                     Icons.access_time,
              //                     size: 18.0,
              //                     color: Colors.teal,
              //                   ),
              //                   Text(
              //                     " $_time",
              //                     style: TextStyle(
              //                         color: Colors.teal,
              //                         fontWeight: FontWeight.bold,
              //                         fontSize: 18.0),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //         Text(
              //           "  Change",
              //           style: TextStyle(
              //               color: Colors.teal,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18.0),
              //         ),
              //       ],
              //     ),
              //   ),
              //   color: Colors.white,
              // )
              Stack(
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
                              // SizedBox(
                              //   height: 40,
                              // ),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 110,
                                            width: 110,
                                          ),
                                        ),
                                        Container(
                                          height: 110,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.teal,
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                        ),
                                        Container(
                                          height: 110,
                                          width: 90,
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                              // Container(
                              //   width: 55,
                              //   color: Colors.black54,
                              //   height: 3,
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Number of players",
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
                              Row(
                                children: [
                                  buildOutlineButton(
                                    icon: Icons.remove,
                                    press: () {
                                      if (numOfItems > 1) {
                                        setState(() {
                                          numOfItems--;
                                        });
                                      }
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPaddin / 2),
                                    child: Text(
                                      // if our item is less  then 10 then  it shows 01 02 like that
                                      numOfItems.toString().padLeft(2, "0"),
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ),
                                  buildOutlineButton(
                                    icon: Icons.add,
                                    press: () {
                                      setState(
                                        () {
                                          numOfItems++;
                                        },
                                      );
                                    },
                                  ),
                                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
