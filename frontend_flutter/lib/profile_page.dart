import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool qrCode = false;

  List<dynamic> art = [];
  List<dynamic> events = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    var artRes = await Dio().get("http://20.246.2.152/api1/events/art");
    var eventsRes = await Dio().get("http://20.246.2.152/api1/events");
    setState(() {
      art = artRes.data;

      events = eventsRes.data;
      events.removeRange(0, 15);
    });
    print("Got Art");
  }

  void openURL(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
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
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            "Serene Yew",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const Text("750/1000 to Level 5"),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: LinearProgressIndicator(
            value: .7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.5, bottom: 5),
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
              const Text("Saved Places"),
              SizedBox(
                height: 150,
                child: art.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: art.map<Widget>(
                          (e) {
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () => openURL(
                                    "https://www.calgary.ca/arts-culture/public-art.html"),
                                child: SizedBox(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, top: 8),
                                          child: Text(
                                            e["title"],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, bottom: 2),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text("By: " + e["artist"]),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, bottom: 2),
                                        child: Text(e["address"]),
                                      ),
                                      const Text(
                                        "City of Calgary Public Art",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
              ),
              const Text("Exclusive Offers"),
              SizedBox(
                height: 150,
                child: events.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView(
                        scrollDirection: Axis.horizontal,
                        children: events.map<Widget>(
                          (e) {
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                onTap: () => openURL(e["url"]),
                                child: SizedBox(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Image(
                                        height: 150,
                                        width: 100,
                                        fit: BoxFit.fitHeight,
                                        image: NetworkImage(
                                          e["img_url"],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e["name"],
                                              overflow: TextOverflow.fade,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Text(
                                            e["address"],
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            e["phone_number"],
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
