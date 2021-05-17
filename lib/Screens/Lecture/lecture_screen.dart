import 'package:flutter/material.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text('Save'),
      ),
      appBar: AppBar(
        title: Text('Plan lecture'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.image_outlined,
                size: 150,
              ),
              Text(
                'Plan your excursion',
                style: Theme.of(context).textTheme.headline6,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Excursion name',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 12),
                            fillColor: Colors.white38,
                            filled: true),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Place',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Structured moments',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Student tasks',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
