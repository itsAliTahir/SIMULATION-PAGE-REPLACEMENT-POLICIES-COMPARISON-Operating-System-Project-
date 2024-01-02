import 'package:flutter/material.dart';
import '../Screens/home_page_widgets/input_fields.dart';
import 'home_page_widgets/pages_circles.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //       child: Text('SIMULATION: PAGE REPLACEMENT POLICIES COMPARISON')),
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 120,
            ),
            Container(
              width: 400,
              height: 60,
              color: Colors.transparent,
              child: Text(
                'SIMULATION: PAGE REPLACEMENT POLICIES COMPARISON',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Container(
              width: 400,
              height: 400,
              child: Card(
                color: Colors.white,
                shadowColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    MyInputFields(),
                    // MyPagesCircles(),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
