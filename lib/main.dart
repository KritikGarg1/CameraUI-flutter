import 'package:flutter/material.dart';
import 'package:radial_button/widget/circle_floating_button.dart';
import 'slider.dart';
import 'package:provider/provider.dart';
import 'changeNotify.dart';
import 'package:camera/camera.dart';
import 'package:camera_ui/camera_screen.dart';
import 'zoom_notifier.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  cameras = await availableCameras();
  runApp(
    ChangeNotifierProvider<AppState>(
      builder: (_) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> itemsActionBar;

  GlobalKey<CircleFloatingButtonState> key01 =
      GlobalKey<CircleFloatingButtonState>();

  GlobalKey<CircleFloatingButtonState> key02 =
      GlobalKey<CircleFloatingButtonState>();

  GlobalKey<CircleFloatingButtonState> key03 =
      GlobalKey<CircleFloatingButtonState>();

  @override
  void initState() {
    itemsActionBar = [
      Padding(
        padding: EdgeInsets.only(top: 6),
        child: Image(
            image: AssetImage('assets/Intersect.png'), height: 85, width: 83),
      ),
      Image(image: AssetImage('assets/Intersect-1.png'), height: 95, width: 90),
      Image(image: AssetImage('assets/Intersect-2.png'), height: 95, width: 90),
      Image(image: AssetImage('assets/Intersect-3.png'), height: 89, width: 80),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ZoomState>(
      builder: (_) => ZoomState(),
      child: MaterialApp(
          home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CameraScreen(cameras),
            Container(
              width: 5,
              height: 5,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              alignment: Alignment.center,
            ),
            Transform.translate(
                offset: Offset(0, -363),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      border: Border.all(color: Colors.black87)),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 55),
                      Icon(
                        Icons.hd,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(width: 97),
                      Icon(
                        Icons.filter_hdr,
                        size: 33,
                        color: Colors.white,
                      ),
                      SizedBox(width: 95),
                      Icon(
                        Icons.timer_off,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
            Transform.translate(
              offset: Offset(-140, 325),
              child: Container(
                width: 67.0,
                height: 67.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/flower.jpg'),
                  ),
                ),
              ),
            ),
            Transform.translate(offset: Offset(0, 340),
              child: Container(child: Padding(
                padding: const EdgeInsets.only(top:6.0),
                child: Text("PRO",style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
              ),
                decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20)),
                width: 60,
                height: 30,
              ),
            )
          ],
        ),
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "CAMERA",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.black87,
        ),
        floatingActionButton: Transform.translate(
          offset: Offset(68, 95),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 220, top: 200),
                child: SliderQuarter(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 115, top: 132),
                child: CircleFloatingButton.floatingActionButton(
                  radius: 160,
                  key: key01,
                  items: itemsActionBar,
                  color: Colors.deepOrange,
                  duration: Duration(milliseconds: 400),
                  curveAnim: Curves.linearToEaseOut,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
