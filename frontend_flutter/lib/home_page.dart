import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Trending",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          height: 180,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                child: SizedBox(
                    width: 200, child: Text("These are seperate objects")),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Nearby",
            style: TextStyle(fontSize: 30),
          ),
        ),
        Container(
          height: 180,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                child: SizedBox(
                  width: 200,
                ),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              ),
              Card(
                child: SizedBox(
                  width: 200,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
