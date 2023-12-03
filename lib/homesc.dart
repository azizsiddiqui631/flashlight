import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:torch_light/torch_light.dart';

class homesc extends StatefulWidget {
  const homesc({super.key});

  @override
  State<homesc> createState() => _homescState();
}

class _homescState extends State<homesc> {
  bool ison = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              "FlashLight App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/flashlight.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 320, left: 10, right: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterSwitch(
                    value: ison,
                    onToggle: (value) {
                      setState(() {
                        ison = !ison;

                        ison
                            ? TorchLight.enableTorch()
                            : TorchLight.disableTorch();
                      });
                    },
                    activeText: "ison",
                    activeTextColor: Colors.white,
                    inactiveText: "isoff",
                    inactiveTextFontWeight: FontWeight.bold,
                    activeTextFontWeight: FontWeight.bold,
                    inactiveTextColor: Colors.white,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
