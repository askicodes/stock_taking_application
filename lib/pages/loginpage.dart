import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class MainPage extends StatefulWidget{
  Loginscreen createState()=> Loginscreen();

}

class Loginscreen extends State<MainPage>{

TextEditingController username=new TextEditingController();
TextEditingController password=new TextEditingController();

String msg='';

Future<List> _login() async {
  final response = await http.post("http://172.20.10.4/stocktake/login.php", body: {
    "username": username.text,
    "password": password.text,
  });

  var datauser = json.decode(response.body);
  if(datauser.length==0){
    setState(() {
      msg="Login Failed";
        });
  }else {
    if (datauser[0]['level'] == 'admin') {
      Navigator.pushReplacementNamed(context, '/pages/adminpage');
    } else if (datauser[0]['level'] == 'user') {
      Navigator.pushReplacementNamed(context, '/pages/userpage');
    }
    setState(() {
      username = datauser[0]['username'];
    });

  }

  return datauser;
}

    @override
   Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        resizeToAvoidBottomInset: false,

        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/1.png',))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * .4,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Stocktaker',
                          style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 50,
                              fontFamily: 'font1'),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 8,
                          width: width * .5,
                          decoration: BoxDecoration(
                              color: Color(0x626262),
                              borderRadius: BorderRadius.circular(5)),
                        )
                      ],
                    )
                  ],
                ),
                TextField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: 'Enter username'
                  ),
                ),

                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: 'Enter password'
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    _login();
                  },
                ),

                Text(msg,style: TextStyle(fontSize: 20.0,color: Colors.red),)

              ],
            ),
          ),
        ),
      );
    }
}
