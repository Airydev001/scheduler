import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisSize: MainAxisSize.min, children: [
      Row(children: [
        Row(children: [
          Container(
              alignment: const Alignment(50.0, 50.0),
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                left: 100,
                top: 100,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 96, 33, 243),
                shape: BoxShape.rectangle,
              )),
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Text(
              "alig",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              alignment: const Alignment(50.0, 50.0),
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(
                top: 100,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 243, 33, 177),
                shape: BoxShape.rectangle,
              ))
        ]),
        const Spacer(),
        Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            )),
        const Spacer(),
        Container(
          width: 100,
          height: 100,
          color: const Color.fromARGB(255, 87, 0, 150),
          child: const Text("1"),
        )
      ]),
      const Spacer(),
      Container(
        width: 200,
        height: 200,
        decoration: const BoxDecoration(
            //image:DecorationImage(FlutterLogo())
            color: Colors.orange,
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 4, 14, 31),
                Color.fromARGB(255, 11, 11, 12)
              ],
            )),
      )
    ]));
  }
}
