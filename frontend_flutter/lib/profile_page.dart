import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool qrCode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      qrCode = !qrCode;
                    });
                  },
                  child: qrCode
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://th.bing.com/th/id/R.ca633eeeb296860d252adaf3b5fb5dd3?rik=XpdT9nUiNjVKHw&pid=ImgRaw&r=0"))
                      : CircleAvatar(
                          backgroundImage: AssetImage("assets/code.png"),
                        )),
            ), //Serene Yew lol
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Serene Yew",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/first.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/second.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/third.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/fourth.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/fifth.png"),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 300,
          child: ListView(
            children: [
              Text("Exclusive Offers"),
              Container(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                  ],
                ),
              ),
              Text("Saved Places"),
              Container(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                    Card(
                      child: SizedBox(
                        width: 200,
                        height: 180,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
