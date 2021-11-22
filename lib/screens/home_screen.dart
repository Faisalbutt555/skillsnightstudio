import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:skns/models/custompicker.dart';
import 'package:skns/models/homemodel.dart';
import 'package:skns/screens/second_screen.dart';
import 'package:skns/widgets/custom_alertdialog.dart';
import 'package:skns/widgets/custom_textfeild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? interval = TextEditingController();

  HomeModel homeModel = HomeModel();
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
                  textInputType: TextInputType.number,
                  textEditingController: interval,
                  hinttxt: 'Total Training Intervals',
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    DatePicker.showPicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (time) {
                        setState(() {
                          homeModel.initialtime =
                              DateFormat("mm:ss").format(time);
                        });
                      },
                      pickerModel: CustomPicker(
                          currentTime: DateTime.now(), locale: LocaleType.en),
                    );
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
                          (homeModel.initialtime == null)
                              ? const Text(" ")
                              : Text(
                                  homeModel.initialtime!,
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
                    DatePicker.showPicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (time) {
                        setState(() {
                          homeModel.breaktime =
                              DateFormat("mm:ss").format(time);
                        });
                      },
                      pickerModel: CustomPicker(
                          currentTime: DateTime.now(), locale: LocaleType.en),
                    );
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
                          (homeModel.breaktime == null)
                              ? const Text(" ")
                              : Text(
                                  homeModel.breaktime!,
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
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: () {
                      if (interval!.text.isEmpty) {
                        showAlertDialog(
                            context, 'Alert', 'Please enter #No of interval');
                      } else if (homeModel.initialtime == null) {
                        showAlertDialog(
                            context, 'Alert', 'Please enter Training duration');
                      } else if (homeModel.breaktime == null) {
                        showAlertDialog(
                            context, 'Alert', 'Please enter break duration');
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen(
                                      starttime: homeModel.initialtime,
                                      count: interval,
                                      exittime: homeModel.breaktime,
                                    )));
                      }
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
