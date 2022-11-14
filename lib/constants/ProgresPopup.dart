import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String djApiUrl = "https://api.primal.fm";

ProgressPopup(BuildContext context){
  return
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Container(child: Center(child: new CircularProgressIndicator(color: Color(0xffda1328),)));

    },
  );
}