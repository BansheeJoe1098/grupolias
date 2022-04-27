import 'dart:ui';
import 'package:flutter/material.dart';
import 'navbar.dart';

class Loginpage extends StatelessWidget {

  Widget _buildPageContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      color: Colors.blue.shade800,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Container(
                child:
                Image.asset(
                  'assets/gpolias.png',
                  width: 250,
                  height: 250,
                ),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)
                  ),
                ),
              ),
              SizedBox(
                height: 50,),
              ListTile(
                  title: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Email address:",
                        hintStyle:
                        TextStyle(
                            color: Colors.white70),
                        border: InputBorder.none,
                        icon: Icon
                          (Icons.email, color:
                        Colors.white30,)
                    ),
                  )
              ),
              Divider(
                color: Colors.greenAccent,),
              ListTile(
                  title: TextField(
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Password:",
                        hintStyle:
                        TextStyle
                          (color: Colors.white70),
                        border: InputBorder.none,

                        icon:
                        Icon
                          (Icons.lock, color: Colors.white30,)
                    ),
                  )
              ),
              Divider
                (color:
              Colors.greenAccent,),
              SizedBox(height: 20,),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=> BasicBottomNavBar()),
                              );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      color: Colors.green,
                      child: Text('Login',
                        style: TextStyle
                          (color: Colors.white70, fontSize: 16.0),),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
