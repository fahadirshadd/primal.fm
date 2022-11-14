// import 'package:flutter/material.dart';
// import 'package:primal_fm/constants/alarm_constant.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewStack extends StatefulWidget {
//   final url;
//   final reformName;
//   const WebViewStack({
//     Key? key,
//     required this.url,
//     required this.reformName,
//   }) : super(key: key);

//   @override
//   State<WebViewStack> createState() => _WebViewStackState();
// }

// class _WebViewStackState extends State<WebViewStack> {
//   var loadingPercentage = 0;
//   var _height;
//   WebViewController? _controller;
//   getHTML() async {
//     String html = await _controller!.evaluateJavascript(
//         "window.document.getElementsByTagName('html')[0].outerHTML;");
//     print(html);
//     // String
//     // _controller!.runJavascript(javaScriptString);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _height = MediaQuery.of(context).size.height;
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: primaryColor,
//           centerTitle: true,
//           title: Padding(
//             padding: EdgeInsets.only(left: 19, right: 49),
//             child: Column(
//               children: [
//                 Text(
//                   "${widget.reformName}",
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   "${widget.url}",
//                   style: TextStyle(
//                     fontSize: 10,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.close),
//           ),
//         ),
//         body: Stack(
//           children: [
//             WebView(
//               // javascriptChannels: ,
//               javascriptMode: JavascriptMode.unrestricted,
//               initialUrl: widget.url,
//               onWebViewCreated: (controller) {
//                 _controller = controller;
//               },
//               onPageStarted: (url) {
//                 setState(() {
//                   loadingPercentage = 0;
//                 });
//               },
//               onProgress: (progress) {
//                 setState(() {
//                   loadingPercentage = progress;
//                 });
//               },
//               onPageFinished: (url) {
//                 getHTML();
//                 setState(() {
//                   loadingPercentage = 100;
//                 });
//               },
//             ),
//             if (loadingPercentage < 100)
//               LinearProgressIndicator(
//                 minHeight: 5,
//                 value: loadingPercentage / 100.0,
//                 color: primaryColor,
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
