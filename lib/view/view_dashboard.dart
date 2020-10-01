import 'package:flutter/material.dart';

class ViewDashboard extends StatefulWidget {
  ViewDashboard({Key key}) : super(key: key);

  @override
  _ViewDashboardState createState() => _ViewDashboardState();
}

class _ViewDashboardState extends State<ViewDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.orange),
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
                left: 10,
                right: 10,
              ),
              child: Column(
                children: [
                  Text("Home"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      contentPadding: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                        left: 10,
                        right: 10,
                      ),
                      border: OutlineInputBorder(),
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
