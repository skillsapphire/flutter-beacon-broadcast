import 'package:flutter/material.dart';
import 'package:beacon_broadcast/beacon_broadcast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  BeaconBroadcast beaconBroadcast = BeaconBroadcast();
  String message = "Click on the button to control beacon!";
  bool _isLoading = false;
  _startBeacon() async {
    setState(() {
      _isLoading = true;
    });
   await beaconBroadcast
        .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
        .setMajorId(1)
        .setMinorId(100)
        .start();
    setState(() {
      message = "Beacon is now broadcasting!";
      _isLoading = false;
    });

  }
  _stopBeacon() async {
    setState(() {
      _isLoading = true;
    });
    await beaconBroadcast
        .setUUID('39ED98FF-2900-441A-802F-9C398FC199D2')
        .setMajorId(1)
        .setMinorId(100)
        .stop();

    setState(() {
      message = "Beacon is now stopped!";
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? CircularProgressIndicator() : Scaffold(
      appBar: AppBar(
        title: Text("Act as beacon"),
      ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(42, 20, 0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(message)
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        child: Text("Start beacon"),
                        onPressed: () async {
                          _isLoading = true;
                         await _startBeacon();
                          _isLoading = false;
                        }
                        ),
                  ),
                  RaisedButton(
                      child: Text("Stop beacon"),
                      onPressed: (){
                        _stopBeacon();
                      }
                  ),

                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
