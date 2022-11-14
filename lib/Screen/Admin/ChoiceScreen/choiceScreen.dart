import 'package:flutter/material.dart';
import 'package:primal_fm/Screen/Admin/ViewPostAdmin/viewPostAdmin.dart';
import 'package:primal_fm/Screen/ViewPost/viewPost.dart';
import 'package:primal_fm/constants/text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../ForgetPassword/forgotPassword.dart';
import '../addPost/addPost.dart';


class ChoiceScreen extends StatefulWidget {
  ChoiceScreen({Key? key}) : super(key: key);

  var index = 0;

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 70,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);   
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(
                          Icons.arrow_back_ios_rounded, color: Colors.white,
                          size: 22,),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 0),
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded, color: Colors.black,
                        size: 20,),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.index = 0;
                      setState((){

                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      decoration: BoxDecoration(
                        color: widget.index == 0 ? Color(0xffda1328) : Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text('Add Post', style: TextStyle(
                          fontSize: 14,
                          color: widget.index == 0 ? Colors.white : Colors.black
                        ),),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.index = 1;
                      setState((){

                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      decoration: BoxDecoration(
                          color: widget.index == 1 ? Color(0xffda1328) : Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text('View Post', style: TextStyle(
                            fontSize: 14,
                            color: widget.index == 1 ? Colors.white : Colors.black
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              ChoiceScreenOut(index: widget.index,)
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceScreenOut extends StatefulWidget {
  ChoiceScreenOut({Key? key, required this.index}) : super(key: key);

  var index;

  @override
  State<ChoiceScreenOut> createState() => _ChoiceScreenOutState();
}

class _ChoiceScreenOutState extends State<ChoiceScreenOut> {
  @override
  Widget build(BuildContext context) {
    if(widget.index == 0){
      return AddPost();
      setState(() {

      });
    } else{
      return ViewPostAdmin();
    }
  }
}

