// import 'package:flutter/material.dart';
// import 'package:primal_fm/Screen/Drawer/DrawerScreen.dart';
// import 'package:primal_fm/Screen/Home/HomeScreen.dart';
// import 'package:primal_fm/Screen/sleeptimer.dart';
// import 'package:primal_fm/constants/alarm_constant.dart';

// class BottomNavigationBarWrapper extends StatefulWidget {
//   const BottomNavigationBarWrapper({Key? key}) : super(key: key);

//   @override
//   State<BottomNavigationBarWrapper> createState() =>
//       _BottomNavigationBarWrapperState();
// }

// class _BottomNavigationBarWrapperState
//     extends State<BottomNavigationBarWrapper> {
//   int index = 0;
//   List pages = [
//     HomeScreenPage(),
//     SleepTimer(),
//   ];

//   @override
//   void initState() {
//     index = 0;
//     super.initState();
//   }

//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: DrawerScreenPage(),
//       body: Stack(
//         children: [
//           pages[index],
//           SafeArea(
//             top: true,
//             bottom: false,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 20),
//                   child: IconButton(
//                     onPressed: () {
//                       scaffoldKey.currentState!.openDrawer();
//                     },
//                     icon: const Icon(
//                       Icons.menu_outlined,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 50,
//               decoration: BoxDecoration(
//                   // color: Colors.transparent,
//                   // color: primaryColor.withOpacity(0.2),
//                   ),
//               // height: 200,
//               child: Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(
//                     child: index == 0
//                         ? Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black26,
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                             margin: EdgeInsets.symmetric(horizontal: 30),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.home,
//                                   color: primaryColor,
//                                   size: 30,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   "Home",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         : Material(
//                             shape: CircleBorder(),
//                             color: Colors.transparent,
//                             child: IconButton(
//                               splashColor: primaryColor.withOpacity(0.8),
//                               icon: const Icon(
//                                 Icons.home,
//                                 color: primaryColor,
//                                 size: 30,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   index = 0;
//                                 });
//                               },
//                             ),
//                           ),
//                   ),
//                   Expanded(
//                     child: index == 1
//                         ? Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black26,
//                               borderRadius: BorderRadius.circular(18),
//                             ),
//                             margin: EdgeInsets.symmetric(horizontal: 30),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(
//                                   Icons.timer,
//                                   color: primaryColor,
//                                   size: 30,
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   "Sleep Timer",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         : Material(
//                             color: Colors.transparent,
//                             shape: CircleBorder(),
//                             // color: Colors.amber,
//                             child: IconButton(
//                               splashColor: primaryColor.withOpacity(0.8),
//                               icon: Icon(
//                                 Icons.timer,
//                                 color: primaryColor,
//                                 size: 30,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   index = 1;
//                                   print("INdex 1");
//                                 });
//                               },
//                             ),
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       // bottomNavigationBar: Container(
//       //   color: Colors.transparent,
//       //   height: 200,
//       //   child: Row(),
//       // ),
//     );
//   }
// }
