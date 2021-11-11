import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String? starttime;
  final String? exittime;
  final String? count;
  const SecondScreen({Key? key, this.exittime, this.count, this.starttime})
      : super(key: key);
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late var finaltime = (widget.starttime! + widget.exittime!);
  final CustomTimerController _controller = CustomTimerController();
  late final cot = widget.count!;
  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print(finaltime!);
    // ignore: avoid_print
    print(cot!);
  }

  bool select = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Container(
                width: 130,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '1 Round',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              CustomTimer(
                controller: _controller,
                from: const Duration(hours: 12),
                to: const Duration(hours: 0),
                interval: const Duration(seconds: 1),
                builder: (CustomTimerRemainingTime remaining) {
                  return Text(
                    "${remaining.minutes}:${remaining.seconds}",
                    style: const TextStyle(fontSize: 30.0),
                  );
                },
              ),
              // Text(
              //   finaltime,
              //   style: const TextStyle(
              //       color: Colors.black,
              //       fontSize: 22,
              //       fontWeight: FontWeight.bold),
              // ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {});
                          select = !select;
                          select ? _controller.start() : _controller.pause();
                        },
                        child: Container(
                          height: 70,
                          width: 120,
                          color: Colors.grey[400],
                          child: Center(
                            child:
                                Icon(select ? Icons.pause : Icons.play_arrow),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 120,
                        color: Colors.grey[800],
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[900],
                              shape: BoxShape.rectangle),
                          height: 13,
                          width: 15,
                        )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('No Pain, no Gain!')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
