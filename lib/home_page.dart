import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String buttonLabel = "Stop Service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsForeground');
              },
              child: const Text('Start Foreground'),
            ),
            FilledButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsBackground');
              },
              child: const Text('Start Background'),
            ),
            FilledButton(
              onPressed: () async{
                final service = FlutterBackgroundService();
                var isRunning = await service.isRunning();
                if (isRunning) {
                  service.invoke("stopService");
                } else {
                  service.startService();
                }

                if (!isRunning) {
                  buttonLabel = 'Stop Service';
                } else {
                  buttonLabel = 'Start Service';
                }
                setState(() {});
              },
              child: Text(buttonLabel),
            )
          ],
        ),
      ),
    );
  }
}
