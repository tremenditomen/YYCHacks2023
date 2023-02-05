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
                    ? const CircleAvatar(
                        backgroundImage: AssetImage("assets/code.png"),
                      )
                    : const CircleAvatar(
                        backgroundImage: AssetImage("assets/serene.gif"),
                      ),
              ),
            ), //Serene Yew lol
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Serene Yew",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.5),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/first.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/second.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/third.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/fourth.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage("assets/fifth.png"),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView(
            children: [
              const Text("Exclusive Offers"),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
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
              const Text("Saved Places"),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
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
