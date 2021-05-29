import 'package:faunatic_front_end/Screens/Home/storyset_add_license.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  Future<void> showAboutDialog(BuildContext context) async {
    return showDialog<void>(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AboutDialog(
              applicationVersion: 'version 0.69.420',
              applicationLegalese: 'Glad sommar från Grupp 7!'
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white60,
              ),
              child: Text(
                'Meny',
                style: TextStyle(color: Colors.green, fontSize: 20.0),
              ),
            ),
            ListTile(
              title: Text('Profil'),
              trailing: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Inställningar'),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Om appen'),
              trailing: Icon(Icons.help),
              onTap: () {showAboutDialog(context);
              },
            ),
            ListTile(
              title: Text('Logga Ut'),
              trailing: Icon(Icons.logout),
              onTap: () =>
                context.read<AuthenticationService>().signOut() // TODO Implementera att användaren får upp ett fönster de måste trycka ok på för att logga ut
            )
          ],
        ),
      ),
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(size.height * 0.008),
                      child: Image.asset(
                        'assets/images/logo.png',
                        color: Colors.green,
                        isAntiAlias: true,
                        height: 160,
                        width: 110,
                        scale: 0.1,
                        filterQuality: FilterQuality.high,
                      )),
                  Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      'Välkommen till FAUNAtic',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.008),
                    child: Center(
                      child: Wrap(
                        children: <Widget>[
                          Column(
                            children: [
                              SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Card(
                                    color: Colors.teal.shade100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 5,
                                    margin: EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () => Navigator.pushNamed(
                                          context, '/excursions'),
                                      splashColor: Colors.green,
                                      child: Image.asset(
                                        'assets/images/Journey-amico.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text('Utflykter')
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Card(
                                  color: Colors.green.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 5,
                                  margin: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.green,
                                    child: Image.asset(
                                        'assets/images/Directions-amico.png'),
                                  ),
                                ),
                              ),
                              Text('Klassuppgifter')
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Card(
                                  color: Colors.red.shade50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 5,
                                  margin: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {},
                                    splashColor: Colors.green,
                                    child: Image.asset(
                                        'assets/images/Classroom-amico.png'),
                                  ),
                                ),
                              ),
                              Text('Google Classroom')
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 150.0,
                                height: 150.0,
                                child: Card(
                                  color: Colors.orange.shade100,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 5,
                                  margin: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/species/intersection'),
                                    splashColor: Colors.green,
                                    child: Image.asset(
                                        'assets/images/Bear market-amico.png'),
                                  ),
                                ),
                              ),
                              Text('Artdatabanken')
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () =>
                          context.read<AuthenticationService>().signOut(),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white60),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Logga Ut',
                        style: TextStyle(fontSize: 15.0, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
