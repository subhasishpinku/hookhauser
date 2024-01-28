import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff020D4D),
          child: const Icon(Icons.clear_outlined),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffC34072),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(350),
                ),
              ),
              height: MediaQuery.of(context).size.height * .87,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xff020D4D),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(350),
                ),
              ),
              height: MediaQuery.of(context).size.height * .80,
            ),
            const Positioned(
                right: 30,
                top: 40,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                )),
            ListView(
              children: const [Text('data')],
            ),
          ],
        ));
  }
}
