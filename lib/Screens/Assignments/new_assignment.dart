import 'package:flutter/material.dart';

class NewAssignmentScreen extends StatefulWidget {
  const NewAssignmentScreen({Key key}) : super(key: key);

  @override
  _NewAssignmentScreenState createState() => _NewAssignmentScreenState();
}

class _NewAssignmentScreenState extends State<NewAssignmentScreen> {
  var assignments = [];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(actions: [TextButton(
        style: TextButton.styleFrom(primary: Colors.green),
        onPressed: () {
            Navigator.pop(context, assignments);
          },
        child: Text('SPARA'),
      )],),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/Notebook-rafikiV2.png',
              ),
              Column(

                children: [...assignments],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    hintText: 'Ny uppgift',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
                indent: 20,
                endIndent: 20,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      assignments.add(Card(
                        child: ListTile(title: Text(_controller.text)),
                      ));
                    });
                    _controller.clear();

                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 24,
                    color: Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: SizedBox(
            width: 115.0,
            height: 45.0,
            child: FloatingActionButton.extended(
              backgroundColor: const Color(0xff5ECD9E),
              foregroundColor: Colors.white,
              onPressed: () {
                // Respond to button press
              },
              label: Text('Spara'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
