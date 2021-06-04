import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_botino/ChatPage.dart';
import 'package:smart_botino/car.dart';
import 'package:smart_botino/connection.dart';
import 'package:smart_botino/home.dart';
import 'package:smart_botino/main.dart';
import 'package:control_button/control_button.dart';
import 'manual.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                AssetImage("assets/khdma.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.bluetooth,
                              color:  Color(0xffffffff), size: 50.0),
                          iconSize: 50,
                          tooltip: "bluetooth",
                          splashColor: Color(0xff69f0ae),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Home()));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.settings,
                              color: Color(0xffffffff), size: 50.0),
                          iconSize: 50,
                          splashColor: Color(0xff69f0ae),
                          tooltip: "settings",
                          onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => manual()));},
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Welcome, Armbotino \nSelect an option",
                      style: TextStyle(
                        fontFamily: 'Pacifico-Regular',
                        color: Color(0xffffffff),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),

                      textAlign: TextAlign.start,
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Wrap(spacing: 20, runSpacing: 20.0, children: <
                          Widget>[
                        SizedBox(
                          width: 200.0,
                          height: 200.0,
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(),
                              height: 200,
                              width: 200,
                              child: Card(
                                shadowColor: Color(0xff14442c),
                                color: Color.fromARGB(255, 255, 254, 255),
                                elevation: 100.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: <Widget>[
                                          Material(
                                              child: InkWell(
                                                onTap: () async {
                                                  await FlutterBluetoothSerial.instance
                                                      .getBondedDevices()
                                                      .then((List<BluetoothDevice>
                                                  bondedDevices) {
                                                    bondedDevices.forEach((element) {
                                                      if (element.address ==
                                                          "98:D3:31:F4:1A:60") {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ChatPage(
                                                                      server: element,
                                                                    )));
                                                      }
                                                    });
                                                  });
                                                },
                                                child: Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius.circular(20.0),
                                                    child: Image.asset(
                                                        'assets/todo.png',
                                                        width: 150.0,
                                                        height: 100.0),
                                                  ),
                                                ),
                                              )),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Text(
                                            "Arm Control",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Pacifico-Regular',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          Text(
                                            "4 Axis",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w100),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 200.0,
                          child: Card(
                            shadowColor: Color(0xff245e42),
                            color: Color.fromARGB(255, 255, 255, 255),
                            elevation:100.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Material(
                                          child: InkWell(
                                            onTap: () {
                                              var device;
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          car()));
                                            },
                                            child: Container(
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(20.0),
                                                child: Image.asset('assets/note.png',
                                                    width: 150.0, height: 100.0),
                                              ),
                                            ),
                                          )),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Car control",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Pacifico-Regular',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "2 motors",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: 160.0,
                          height: 160.0,
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            )));
  }
}
