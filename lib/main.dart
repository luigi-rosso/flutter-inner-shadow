import 'package:flutter/material.dart';

import 'inner_shadow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double blur = 10;
  double offsetX = 10;
  double offsetY = 10;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: InnerShadow(
                color: Colors.black,
                offset: Offset(offsetX, offsetY),
                blur: blur,
                child: Image.asset("assets/splat.png"),
              ),
            ),
            Text("Blur ${blur.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: blur,
                onChanged: (newValue) {
                  setState(() {
                    blur = newValue;
                  });
                },
              ),
            ),
            Text("Offset X ${offsetX.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: offsetX,
                onChanged: (newValue) {
                  setState(() {
                    offsetX = newValue;
                  });
                },
              ),
            ),
            Text("Offse Y ${offsetY.round()}"),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 300),
              child: Slider.adaptive(
                min: 0,
                max: 100,
                value: offsetY,
                onChanged: (newValue) {
                  setState(() {
                    offsetY = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
