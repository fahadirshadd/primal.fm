import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:primal_fm/Screen/About_us/About_us_screen.dart';
import 'package:primal_fm/Screen/Home/music_screen.dart';
import 'package:primal_fm/Screen/Policy/PolicyScreen.dart';
import 'package:primal_fm/Screen/ViewPost/viewPost.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Admin/loginScreen/login.dart';
import '../sleeptimer.dart';

class DrawerScreenPage extends StatefulWidget {
  const DrawerScreenPage({Key? key}) : super(key: key);

  @override
  _DrawerScreenPageState createState() => _DrawerScreenPageState();
}

class _DrawerScreenPageState extends State<DrawerScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.69,
      decoration: BoxDecoration(
        color: Color(0xff202020),
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: SafeArea(
        child: Container(
          // padding: const EdgeInsets.only(left: 20.0, top: 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    height: 60,
                    width: 120,
                  ),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.03,
              // ),
              SizedBox(
                height: 30,
              ),
              DrawerButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => MusicScreen(),
                    ),
                  );
                },
                icon: Icons.home,
                title: "Home",
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // DrawerButton(
              //   title: "Sleep TImer",
              // onTap: () {
              //   Navigator.pop(context);
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => SleepTimer(),
              //     ),
              //   );
              // },
              //   icon: Icons.access_time_rounded,
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              // Material(
              //               color: Colors.transparent,
              //               shape: CircleBorder(),
              //               // color: Colors.amber,
              //               child: IconButton(
              //                 splashColor: primaryColor.withOpacity(0.8),
              //                 icon: Icon(
              //                   Icons.timer,
              //                   color: primaryColor,
              //                   size: 30,
              //                 ),
              //                 onPressed: () {
              //                   setState(() {
              //                     index = 1;
              //                     print("INdex 1");
              //                   });
              //                 },
              //               ),
              //             ),
              // DrawerButton(
              //   title: "Home",
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(
              //         builder: (context) => HomeScreenPage(),
              //       ),
              //     );
              //   },
              //   icon: Icons.home,
              // ),
              DrawerButton(
                title: "Shop",
                onTap: () {},
                icon: Icons.screen_search_desktop,
              ),
              DrawerButton(
                title: "Sleep Timer",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SleepTimer(),
                    ),
                  );
                },
                icon: Icons.timer,
              ),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.screen_search_desktop,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '  Shop',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ],
              // ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              DrawerButton(
                title: "Website",
                onTap: () {
                  launchUrl(Uri.parse('https://primal.fm/'));
                },
                icon: Icons.ac_unit_outlined,
              ),

              // InkWell(
              //     onTap: () {
              //       launchUrl(Uri.parse('https://primal.fm/'));
              //     },
              //     child: Row(
              //       children: [
              //         Icon(
              //           Icons.ac_unit_outlined,
              //           color: Colors.white,
              //         ),
              //         Text(
              //           '  Website',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontWeight: FontWeight.w700,
              //             fontSize: 18,
              //           ),
              //         ),
              //       ],
              //     )),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              DrawerButton(
                title: "Facebook",
                onTap: () {
                  launchUrl(Uri.parse('https://www.facebook.com/fmprimal'));
                },
                icon: Icons.facebook,
              ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              DrawerButton(
                title: "Instagram",
                onTap: () {
                  launchUrl(Uri.parse('https://www.instagram.com/primal.fm/'));
                },
                icon: FontAwesomeIcons.instagram,
              ),

              // InkWell(
              //   onTap: () {
              //     launchUrl(Uri.parse('https://www.instagram.com/primal.fm/'));
              //   },
              //   child: Row(children: [
              //     Icon(
              //       FontAwesomeIcons.instagram,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '  Instagram',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ],
              //  ),
              // ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),
              DrawerButton(
                title: "Chat",
                onTap: () {
                  Navigator.of(context).pop();
                  Get.to(
                    launchUrl(
                      Uri.parse('https://chat.primal.fm/'),
                    ),
                  );
                },
                icon: CupertinoIcons.chat_bubble_text,
              ),
              // InkWell(
              //   onTap: () {
              //     launchUrl(Uri.parse('https://chat.primal.fm/'));
              //   },
              //   child: Row(children: [
              //     Icon(
              //       CupertinoIcons.chat_bubble_text,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '  Chat',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ]),
              // ),

              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),

              DrawerButton(
                title: "Wish/\nGreeting Box",
                onTap: () {
                  launchUrl(Uri.parse('https://primal.fm/grussbox/frame.html'));
                },
                icon: Icons.person,
              ),
              // InkWell(
              //   onTap: () {
              //     launchUrl(Uri.parse('https://primal.fm/grussbox/frame.html'));
              //   },
              //   child: Row(children: [
              //     Icon(
              //       Icons.person,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '  Wish/\n  Greeting box',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ]),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02,
              // ),

              DrawerButton(
                title: "Posts",
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ViewPosts()));
                },
                icon: Icons.local_post_office_outlined,
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => ViewPosts()));
              //   },
              //   child: Row(children: [
              //     Icon(
              //       Icons.local_post_office_outlined,
              //       color: Colors.white,
              //     ),
              //     Text(
              //       '  Posts',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.w700,
              //         fontSize: 18,
              //       ),
              //     ),
              //   ]),
              // ),

              Spacer(),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.32,
              // ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      backgroundColor: Colors.black,
                                      child: AboutUsScreenPage());
                                });
                          },
                          child: Text(
                            'About Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PolicyScreenPage()));
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
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

class DrawerButton extends StatelessWidget {
  final title;
  final onTap;
  final IconData icon;
  const DrawerButton({
    required this.title,
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
