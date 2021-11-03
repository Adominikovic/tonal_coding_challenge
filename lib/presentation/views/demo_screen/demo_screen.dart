import 'package:flutter/material.dart';
import 'package:tonal_mobile_coding_challenge/presentation/views/demo_screen/widgets/demo_screen_form.dart';
import 'package:tonal_mobile_coding_challenge/presentation/views/demo_screen/widgets/metrics_widget.dart';

// Our DemoScreen provides our main view for this app and and displays our metrics
// widget and a form widget that lets us update our metrics widget's state.
class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    // I try to avoid absolute sizes because your app may be viewed on various
    // screen sizes so I just use MediaQuery to get relative sizing.
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: screenHeight * .05),
                width: screenWidth * .75,
                child: Image.asset('assets/images/tonal-logo-vector.png'),
              ),
              MetricsWidget(),
              DemoScreenForm(),
            ],
          ),
        ),
      ),
    );
  }
}
