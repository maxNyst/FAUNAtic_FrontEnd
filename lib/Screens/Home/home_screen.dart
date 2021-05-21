import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(decoration: BoxDecoration(
              color: Colors.green.shade100,
            ),
              child: Text('Meny',
                style: TextStyle(color: Colors.black.withOpacity(.6), fontSize: 20.0) ,),
            ),
            ListTile(
              title: Text('Profil'),
              trailing: Icon(Icons.person),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Inställningar'),
              trailing: Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logga Ut'),
              trailing: Icon(Icons.logout),
              onTap: (){
                Navigator.pop(context, true); // Implementera att användaren får upp ett fönster de måste trycka ok på för att logga ut
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.black.withOpacity(.6),),
              onPressed: () => context.read<AuthenticationService>().signOut()
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(8.0),
    child: InkWell(
    onTap: () => Navigator.pushNamed(context, '/lectures'),
    splashColor: Colors.green,
      child: Image.asset('assets/images/Journey-amico.png')
    ),
    ),
                Text('Hello'),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              elevation: 5,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.green,
                  child: Image.asset('assets/images/Directions-amico.png')
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              elevation: 5,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {},
                  splashColor: Colors.green,
                  child: Image.asset('assets/images/Classroom-amico.png'),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              elevation: 5,
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/search'),
                splashColor: Colors.green,
                child: Image.asset('assets/images/Bear market-amico.png'),
              ),
            ),
    ],
        ),
      ),
    );
  }
}

