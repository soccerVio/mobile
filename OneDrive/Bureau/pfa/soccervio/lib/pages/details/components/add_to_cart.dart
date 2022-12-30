import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soccervio/constants.dart';
import 'package:soccervio/models/Product.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddToCart extends StatefulWidget {
  AddToCart({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int numOfItems = 1;

  TextEditingController _firstnameController = TextEditingController();

  TextEditingController _lastnameController = TextEditingController();

  TextEditingController _roleController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _gmailController = TextEditingController();

  submitForm() async {
    var first_name = _firstnameController.text.trim();
    var last_name = _lastnameController.text.trim();
    // var roleName = _roleController.text.trim();
    // var password = _passwordController.text.trim();
    var email = _gmailController.text.trim();

    // String url = 'http://55ff-160-176-204-126.eu.ngrok.io/users';
    String url = 'https://jsonplaceholder.typicode.com/users';
    http.Response response = await http.post(Uri.parse(url),
        // headers: {
        //   HttpHeaders.contentTypeHeader: 'application/json',
        // },
        body: jsonEncode(
          {
            // 'firstName': firstName,
            // 'lastName': lastName,
            // 'roleName': roleName,
            // 'password': password,
            // 'email': email,
            'firstName': first_name,
            'lastName': last_name,

            'email': email,
          },
        ));
    if (response.statusCode == 201) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return true;
    } else {
      print('Something went wrong');
      return false;
    }
  }

  String? codeDialog;

  String? valueText;

  //textfield deco
  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }

  //textfield deco
  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }

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

  Future<void> _addAdminDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Make a reservation',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(
                        () {
                          valueText = value;
                        },
                      );
                    },
                    controller: _firstnameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your first Name",
                      prefixIcon: Icon(Icons.people),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Container(height: 20),
                  TextField(
                    controller: _lastnameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your last Name",
                      prefixIcon: Icon(Icons.people),
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  Container(height: 20),
                  TextField(
                    controller: _gmailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: "Enter your Email",
                      labelText: "Email",
                      enabledBorder: myinputborder(),
                      focusedBorder: myfocusborder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Container(height: 20),
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPaddin / 2),
                    child: Text(
                      // if our item is less  then 10 then  it shows 01 02 like that
                      numOfItems.toString().padLeft(2, "0"),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  buildOutlineButton(
                      icon: Icons.add,
                      press: () {
                        setState(() {
                          numOfItems++;
                        });
                      }),

                  // TextField(
                  //   controller: _passwordController,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter Password",
                  //     labelText: "Password",
                  //     prefixIcon: const Icon(Icons.lock),
                  //     enabledBorder: myinputborder(),
                  //     focusedBorder: myfocusborder(),
                  //   ),
                  //   // keyboardType: TextInputType.visiblePassword,
                  // ),
                  // Container(height: 20),
                  // TextField(
                  //   controller: _roleController,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Icon(Icons.admin_panel_settings_sharp),
                  //     labelText: "Role",
                  //     hintText: "Enter Admin or Sup-Admin",
                  //     // labelStyle: TextStyle(fontSize: 20, color: black),
                  //     enabledBorder: myinputborder(),
                  //     focusedBorder: myfocusborder(),
                  //   ),
                  //   keyboardType: TextInputType.text,
                  // ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('SAVE'),
                onPressed: () {
                  // submitForm();
                  submitForm().then(
                    (success) {
                      if (success) {
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('Admin has been added!!!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  _firstnameController.text = '';
                                  _lastnameController.text = '';
                                  _gmailController.text = '';
                                },
                                child: Text('OK'),
                              )
                            ],
                          ),
                          context: context,
                        );
                        return;
                      } else {
                        // showErrorDialog(context,
                        //     title: Text('Error creating user'));
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('Error Adding Admin!!!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              )
                            ],
                          ),
                          context: context,
                        );
                        return;
                      }
                    },
                  );
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: widget.product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: widget.product.color,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: widget.product.color,
                onPressed: () {
                  _addAdminDialog(context);
                },
                child: Text(
                  "Reserve  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
