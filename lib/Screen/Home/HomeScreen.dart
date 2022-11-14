// import 'dart:async';
// import 'dart:io';
// // import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:primal_fm/Screen/Drawer/DrawerScreen.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:primal_fm/Screen/Home/music_provider.dart';
// import 'package:primal_fm/constants/alarm_constant.dart';
// import 'package:primal_fm/webvew.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../api/djApi.dart';
// import '../../streammusic.dart';
// import 'package:transparent_image/transparent_image.dart';

// class HomeScreenPage extends StatefulWidget {
//   //  HomeScreenPage({Key? key}) : super(key: key);

//   @override
//   State<HomeScreenPage> createState() => _HomeScreenPageState();
// }

// class _HomeScreenPageState extends State<HomeScreenPage> {
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

//   showprint() {
//     setState(() {
//       play = !play;

//       print("here is the title");

//       // play == false ? musicModel.pause() : musicModel.playaudio();
//     });
//     print('alarm done=====================>');
//   }


//   var play = false;
//   @override
//   Widget build(BuildContext context) {
//     MusicProvier musicProvider = Provider.of<MusicProvier>(context);
//     // setHourMinutesSeconds();
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: DrawerScreenPage(),
//       // bottomNavigationBar: ,
//       backgroundColor: Colors.black,
//       body: Column(
//         // shrinkWrap: true,
//         children: [
//           // Text(settime.toString(),style: TextStyle(color: Colors.white),),
//           //
//           StreamBuilder<http.Response>(
//             // stream: musicModel.GetStream(),
//             stream: musicProvider.GetStream(),
//             builder: (context, snapshot) {
//               var document;
//               if (snapshot.hasData) {
//                 document = parser.parse(snapshot.data!.body);

//                 return Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(color: Colors.black),
//                   child: Stack(
//                     children: [
//                       Container(
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context).size.width,
//                         child: ColorFiltered(
//                           colorFilter: ColorFilter.mode(
//                               Colors.black.withOpacity(0.5), BlendMode.darken),
//                           child: FadeInImage.memoryNetwork(
//                             fit: BoxFit.cover,
//                             placeholder: kTransparentImage,
//                             image:
//                                 '${document.getElementsByClassName('container')[0].getElementsByClassName('cover-container')[0].querySelector('img').attributes['src']}',
//                           ),
//                         ),
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.all(20),
//                             height: MediaQuery.of(context).size.height * 0.65,
//                             width: MediaQuery.of(context).size.width,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   crossAxisAlignment: CrossAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.8,
//                                       child: Text(
//                                         '${document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[3].text.toString().toUpperCase()}',
//                                         textAlign: TextAlign.right,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 37,
//                                           color: primaryColor,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width *
//                                           0.8,
//                                       child: Text(
//                                         '${document.getElementsByClassName('container')[0].children[0].children[1].children[0].children[2].text.toString().toUpperCase()}',
//                                         textAlign: TextAlign.right,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.w900,
//                                           fontSize: 37,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           // Spacer(),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   share();
//                                 },
//                                 child: Icon(
//                                   Icons.share,
//                                   color: Colors.white,
//                                   size: 25,
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   // launchUrl(
//                                   //     Uri.parse('https://chat.primal.fm/'));
//                                   Get.to(
//                                     WebViewStack(
//                                       url: "https://chat.primal.fm/",
//                                       reformName: "Chats",
//                                     ),
//                                   );
//                                 },
//                                 child: Icon(
//                                   CupertinoIcons.chat_bubble_text,
//                                   color: Colors.white,
//                                   size: 25,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(
//                                     () {
//                                       play = !play;

//                                       print("here is the title");

//                                       musicModel.audioPlayer.playing
//                                           ? musicModel.pause()
//                                           : musicModel.playaudio();
//                                     },
//                                   );
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   width: 40,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: primaryColor,
//                                   ),
//                                   child: Center(
//                                     child: Icon(
//                                       play == false
//                                           ? Icons.play_arrow
//                                           : Icons.pause,
//                                       color: Colors.white,
//                                       size: 30,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () async {
//                                   djApi ap = new djApi();
//                                   var status = await ap.apiCall();
//                                   if (status) {
//                                     launchUrl(Uri.parse(
//                                         'https://primal.fm/grussbox/frame.html'));
//                                   } else {
//                                     showDialog(
//                                         context: context,
//                                         builder: (context) {
//                                           return Dialog(
//                                               backgroundColor: Colors.black,
//                                               child: Container(
//                                                 height: 200,
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(30),
//                                                 ),
//                                                 child: Column(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               top: 50),
//                                                       child: Container(
//                                                         height: 50,
//                                                         width: 50,
//                                                         decoration: BoxDecoration(
//                                                             shape:
//                                                                 BoxShape.circle,
//                                                             border: Border.all(
//                                                                 color: Colors
//                                                                     .black,
//                                                                 width: 1)),
//                                                         child: Icon(
//                                                           Icons.close,
//                                                           color: Colors.red,
//                                                           size: 40,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       height: 20,
//                                                     ),
//                                                     Text(
//                                                       'No DJ is Live',
//                                                       style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w700,
//                                                         fontSize: 25,
//                                                         color:
//                                                             Color(0xff000000),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ));
//                                         });
//                                   }
//                                 },
//                                 child: ImageIcon(
//                                   AssetImage('assets/images/person.png'),
//                                   size: 25,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   openwhatsapp();
//                                 },
//                                 child: Icon(
//                                   FontAwesomeIcons.whatsapp,
//                                   color: Colors.white,
//                                   size: 25,
//                                 ),
//                               ),
//                             ],
//                           ),

//                           SizedBox(
//                             height: 10,
//                           ),
//                           // Slider(
//                           //   va lue: _currentSliderValue,
//                           //   max: 500,
//                           //   divisions: 1,
//                           //   onChanged: (double value) {
//                           //     setState(() {
//                           //       _currentSliderValue = value;
//                           //     });
//                           //   },
//                           // )

//                           // Text(settime.toString(),style: TextStyle(color: Colors.white),),

//                           // FlatButton(
//                           //   color: Colors.grey,
//                           //
//                           //     onPressed: (){
//                           //
//                           //     },
//                           //
//                           //     child: Text("start timer"))

//                           // Text(settime.toString(),style: TextStyle(color: Colors.white),),
//                         ],
//                       ),
//                       SafeArea(
//                         top: true,
//                         bottom: false,
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 top: 0,
//                                 left: 8,
//                               ),
//                               child: IconButton(
//                                 onPressed: () {
//                                   scaffoldKey.currentState!.openDrawer();
//                                 },
//                                 icon: const Icon(
//                                   Icons.menu_outlined,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               } else {
//                 return Container();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }

  // Future<void> share() async {
  //   await FlutterShare.share(
  //       title: 'Primal FM',
  //       text: 'Share to freinds',
  //       linkUrl: 'https://primal.fm/',
  //       chooserTitle: 'Primal FM');
  // }

//   openwhatsapp() async {
//     var whatsapp = "+4935121789666";
//     var whatsappURl_android =
//         "whatsapp://send?phone=" + whatsapp + "&text=hello";
//     var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
//     if (Platform.isIOS) {
//       launchUrl(Uri.parse(whatappURL_ios));
//       if (await canLaunch(whatappURL_ios)) {
//         await launch(whatappURL_ios, forceSafariVC: false);
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: new Text("whatsapp no installed")));
//       }
//     } else {
//       launchUrl(Uri.parse(whatsappURl_android));
//       if (await canLaunch(whatsappURl_android)) {
//         await launch(whatsappURl_android);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: new Text("whatsapp no installed"),
//           ),
//         );
//       }
//     }
//   }
// }

// sendGreeting() async {
//   http.post(
//     Uri.parse('https://api.primal.fm'),
//   );
// }
