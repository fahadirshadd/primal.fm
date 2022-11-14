import 'package:flutter/material.dart';
import 'package:primal_fm/Screen/Admin/ChoiceScreen/choiceScreen.dart';
import 'package:primal_fm/constants/text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ForgetPassword/forgotPassword.dart';
import '../addPost/addPost.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
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
                      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 22,),
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
                    child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30),
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: CustomTextFormFieldWithPrefix(
                  keyboardType: TextInputType.emailAddress,
                  readOnly: false,
                  controller: _emailController,
                  hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomPasswordFormFieldWithPrefix(
                controller: _passwordController ,
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                  },
                  child: Text('Forgot Password', style: TextStyle(
                      color: Color(0xffda1328),
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                  ),),
                )
              ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xffda1328),
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: signIn,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signIn() async{


    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var email = _prefs.getString('email');
    var password = _prefs.getString('password');

    if((_emailController.text.trim() == email) && (_passwordController.text.trim() == password)){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChoiceScreen()));
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
                backgroundColor: Colors.black,
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 1)
                          ),
                          child: Icon(Icons.close, color: Colors.red, size: 40,),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Invalid Credentials!',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ));
          });
    }
  }
}
