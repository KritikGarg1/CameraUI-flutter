import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'zoom_notifier.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller =
    new CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    final zState = Provider.of<ZoomState>(context);
    print(zState.getZoom.toStringAsFixed(1));
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    if (!controller.value.isInitialized) {
      return new Container();
    }
    return new Transform.scale(
      scale: zState.getZoom*controller.value.aspectRatio / deviceRatio,
      child: Center(
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: CameraPreview(controller),
        ),
      ),
    );
  }
}