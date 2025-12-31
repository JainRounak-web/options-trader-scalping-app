import 'package:flutter/material.dart';
import '../services/api_service.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map data = {};

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    data = await ApiService.getSignal();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scalping Signals")),
      body: Center(
        child: data.isEmpty
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['signal'], style: TextStyle(fontSize: 28)),
                  Text("Target: ${data['target_1']} - ${data['target_2']}"),
                  Text("SL: ${data['stop_loss']}"),
                  Text("Confidence: ${data['confidence']}"),
                ],
              ),
      ),
    );
  }
}
