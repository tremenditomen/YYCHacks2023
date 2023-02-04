import 'package:flutter/material.dart';

class PassportPage extends StatefulWidget {
  const PassportPage({super.key});

  @override
  State<PassportPage> createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  bool bookOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          setState(() {
            bookOpen = false;
          });
        }
        if (details.primaryVelocity! < 0) {
          setState(() {
            bookOpen = true;
          });
        }
      },
      child: bookOpen == false
          ? Center(
              child: Card(
                shadowColor: Colors.black,
                elevation: 15,
                color: Colors.red[800]!,
                child: const SizedBox(
                  width: 350,
                  height: 600,
                  child: Center(
                    child: Image(
                      image: AssetImage("assets/calgary_coatofarms.png"),
                    ),
                  ),
                ),
              ),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: Card(
                color: Colors.red[800],
                child: SizedBox(
                  width: 520,
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Card(
                      color: const Color.fromRGBO(255, 251, 242, 1),
                      child: SizedBox(
                        width: 330,
                        height: 580,
                        child: Center(
                          child: Column(
                            children: [
                              Transform.rotate(
                                angle: -3.14 / 12,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 75.0),
                                  child: SizedBox.square(
                                    dimension: 190,
                                    child: Image(
                                      image: AssetImage("assets/Stamp1.png"),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: 3.14 / 8,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 150.0),
                                  child: SizedBox.square(
                                    dimension: 190,
                                    child: Image(
                                      image: AssetImage("assets/Stamp2.png"),
                                    ),
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: -3.14 / 6,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 150.0),
                                  child: SizedBox.square(
                                    dimension: 190,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("assets/Stamp3.png"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
