import 'package:flutter/material.dart';
import 'dart:async';
import 'time_keeper.dart';

class MyCoolTimingApp extends StatefulWidget {
  @override
  _MyCoolTimingAppState createState() => _MyCoolTimingAppState();
}

class _MyCoolTimingAppState extends State<MyCoolTimingApp> {
  final TextEditingController _controller = TextEditingController();
  final List<TimeKeeper> _timeKeepers = [];
  Timer? _uiTimer;

  @override
  void initState() {
    super.initState();
    _uiTimer = Timer.periodic(Duration(seconds: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    _uiTimer?.cancel();
    super.dispose();
  }

  void _addTimeKeeper() {
    final name = _controller.text.trim();
    if (name.isEmpty) return;

    setState(() {
      _timeKeepers.add(TimeKeeper()..name = name);
      _controller.clear();
    });
  }

  void _toggleTimer(TimeKeeper timeKeeper) {
    setState(() {
      if (timeKeeper.isRunning) {
        timeKeeper.stop();
      } else {
        timeKeeper.start();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tíma Skráning')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Nafn á verkefni'),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTimeKeeper,
                  child: Text('Stofna nýtt verkefni'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _timeKeepers.length,
                itemBuilder: (context, index) {
                  final timeKeeper = _timeKeepers[index];
                  return Card(
                    child: ListTile(
                      title: Text(timeKeeper.name),
                      subtitle: Text(
                        'Unninn tími: ${timeKeeper.formattedTime()}',
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          timeKeeper.isRunning ? Icons.stop : Icons.play_arrow,
                        ),
                        onPressed: () => _toggleTimer(timeKeeper),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
