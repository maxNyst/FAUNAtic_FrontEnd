import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faunatic',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: size.height * 0.3,width: size.width * 0.3, color: Colors.blue,),
            Center(
              heightFactor: 1,
              child: Image.asset("assets/images/logo.png",
              color: Theme.of(context).accentColor,),
            ),
          ],
        ),
      ),
    );
  }
}
