import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:skns/screens/second_screen.dart';
import 'package:skns/widgets/custom_textfeild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? interval;
  FocusNode? trainingnode;
  String? pickedtime;
  String? breakedtime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextFeild(
                  focusNode: trainingnode,
                  textEditingController: interval,
                  hinttxt: 'Total Training Intervals',
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true,
                        currentTime: DateTime.now(), onConfirm: (time) {
                      setState(() {
                        pickedtime = "${time.minute}: ${time.second}";
                      });
                    });
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Training Interval Time',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          (pickedtime == null)
                              ? const Text(" ")
                              : Text(
                                  "$pickedtime",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 21),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true,
                        currentTime: DateTime.now(), onConfirm: (time) {
                      setState(() {
                        breakedtime = "${time.minute}: ${time.second}";
                      });
                    });
                  },
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Break Interval Time',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          (breakedtime == null)
                              ? const Text(" ")
                              : Text(
                                  "$breakedtime",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 21),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondScreen(
                                    starttime: pickedtime,
                                    // count: interval ,
                                    exittime: breakedtime,
                                  )));
                      // if (interval == null) {
                      //   const CustomAlertBox(
                      //       'Please enter #No of intervals', 'a');
                      // } else if (pickedtime!.isEmpty) {
                      //   const CustomAlertBox(
                      //       'Please enter #No of intervals', 'a');
                      // } else if (breakedtime!.isEmpty) {
                      //   const CustomAlertBox(
                      //       'Please enter #No of intervals', 'a');
                      // } else {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const SecondScreen()));
                      // }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
