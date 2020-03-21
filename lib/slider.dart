import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:provider/provider.dart';
import 'changeNotify.dart';
import 'zoom_notifier.dart';

class SliderQuarter extends StatefulWidget {
  @override
  _SliderQuarterState createState() => _SliderQuarterState();
}

String percentageModifier(double value) {
  final roundedValue = value.ceil().toInt().toString();

  return '$roundedValue';
}

class _SliderQuarterState extends State<SliderQuarter> {
  @override
  Widget build(BuildContext context) {
    final zState = Provider.of<ZoomState>(context);
    final appState = Provider.of<AppState>(context);
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: appState.getOpacity,
      child: Stack(
        children: <Widget>[
          Transform.rotate(
              angle: -0.74,
              child: Transform.translate(
                  offset: Offset(-30, 63),
                  child: Text(
                    "zoom",
                    style: TextStyle(color: Colors.white70),
                  ))),
          Container(
            child: SleekCircularSlider(
              onChange: (double value) {
                zState.zoom(value);
              },
              initialValue: 2,
              min: 1,
              max: 8,
              appearance: CircularSliderAppearance(
                  angleRange: 120.0,
                  startAngle: 165,
                  size: 270,
                  infoProperties: InfoProperties(
                      topLabelText: " ",
                      bottomLabelText: " ",
                      modifier: percentageModifier,
                      mainLabelStyle: TextStyle(fontSize: 10)),
                  customColors: CustomSliderColors(
                      dotColor: Colors.white70,
                      trackColor: Colors.white70,
                      progressBarColor: Color.fromRGBO(250, 115, 90, 10),
                      hideShadow: true),
                  customWidths: CustomSliderWidths(progressBarWidth: 6)),
            ),
          ),
        ],
      ),
    );
  }
}
