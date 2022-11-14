import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../sleep_provider.dart';
import '../timer_functions.dart';
import '../streammusic.dart';
import 'package:provider/provider.dart';

// class SleepTimer extends StatefulWidget {
//   const SleepTimer({Key? key}) : super(key: key);

//   @override
//   State<SleepTimer> createState() => _SleepTimerState();
// }

class SleepTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sleepTimerProvider = Provider.of<SleepTimerProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(),
              Container(
                height: 60,
              ),
              const Text(
                "PRIMAL.FM App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "PRIMAL.FM // United as one ist dein sender fur Hardstyle, EDM und Handsup musik! In der PRIMAL.FM App habt ihr die Moglichkeit direkt mit uns uber die wunsch ",
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 30,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Version: 2.3",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              ),

              SizedBox(
                height: 25,
              ),
              Text("Sleep Timer"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${sleepTimerProvider.timerString}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sleepTimerProvider.isActive
                      ? ElevatedButton(
                          onPressed: () {
                            sleepTimerProvider.stopTimer();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: Text("STOP TIMER"),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            await Get.bottomSheet(
                              Container(
                                // height: height * .15,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Bitte setze einen Timer (min)",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    StatefulBuilder(
                                      builder: ((context, setState) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Slider(
                                                divisions: 180,
                                                min: 0,
                                                max: 180,
                                                activeColor: Colors.red,
                                                thumbColor: Colors.red,
                                                inactiveColor:
                                                    Colors.red.shade300,
                                                value: sleepTimerProvider
                                                    .minutesTime
                                                    .toDouble(),
                                                label: sleepTimerProvider
                                                    .minutesTime
                                                    .toString(),
                                                onChanged: (newTime) {
                                                  sleepTimerProvider
                                                          .minutesTime =
                                                      newTime.toInt();
                                                  setState(() {});
                                                  sleepTimerProvider
                                                      .notifyListeners();
                                                  print(
                                                      "new Time = $sleepTimerProvider.minutesTime");
                                                },
                                              ),
                                            ),
                                            Text(
                                              "${sleepTimerProvider.minutesTime.toInt()}",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("OK"),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.amber,
                            );
                            // await setTimer();
                            // setState(() {});
                            sleepTimerProvider.secondsTime =
                                sleepTimerProvider.minutesTime * 60;
                            sleepTimerProvider.timerString = timerFormat(
                                sleepTimerProvider.secondsTime.toString());
                            sleepTimerProvider.startTimer();
                            // showDialog(
                            //   context: context,
                            //   builder: (context) {
                            //     return Container(
                            //       height: 100,
                            //       child: AlertDialog(
                            //         content: RotatedBox(
                            //           quarterTurns: 3,
                            //           child: SfSlider(
                            //             min: 0.0,
                            //             max: 600.0,
                            //             value: _value,
                            //             interval: 1,
                            //             enableTooltip: true,
                            //             minorTicksPerInterval: 1,
                            //             onChanged: (dynamic value) {
                            //               setState(
                            //                 () {
                            //                   print("object");
                            //                   _value = value;
                            //                 },
                            //               );
                            //             },
                            //           ),
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text("SETZE TIMER"),
                        ),
                ],
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
