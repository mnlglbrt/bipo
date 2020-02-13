import 'package:bipo/dashboard.dart';
import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'dashboard.dart';
import 'package:clay_containers/clay_containers.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool signedIn=false;
  @override
  void initState() {
    super.initState();
    signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) {
                return DashBoard();
    }));
  });
        }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/background.png'),fit: BoxFit.fill)),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset('images/logo.png',height: 100,),
                  Text('Connexion',style:(TextStyle(color: Colors.grey[100])),textScaleFactor: 2.0,textDirection: TextDirection.ltr,),
                  SizedBox(height: 100,),
                  CircularProgressIndicator(valueColor:new AlwaysStoppedAnimation<Color>(Colors.teal[200]),backgroundColor: Colors.grey[200],),
                  SizedBox(height: 200,),
                  _signInButton(),
                  SizedBox(height: 100,)
                ],
              )
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(onTap: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DashBoard();
              },
            ),
          );
        });
      },

        child: ClayContainer(
          color: Colors.grey[100],
          height: 100,
          width: 100,
          borderRadius: 75,
          depth: 10,
          spread: 10,
          child: Center(
            child: Icon(Icons.input,size: 40,color: Colors.grey[300],),
          ),
        ),
      ),
    );
  }
}
