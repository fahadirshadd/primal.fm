import 'package:flutter/material.dart';
import 'package:primal_fm/constants/text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _confirmNewPasswordController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _oldPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: CustomPasswordFormFieldWithPrefix(
                controller: _oldPasswordController ,
                hintText: 'Old Password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: CustomPasswordFormFieldWithPrefix(
                controller: _newPasswordController ,
                hintText: 'New Password',
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: CustomPasswordFormFieldWithPrefix(
                controller: _confirmNewPasswordController ,
                hintText: 'Confirm Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffda1328),
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                ),
                child: Center(child: Text(
                  'Change Password',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  changePassword() async{

    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var email = _prefs.getString('email');
    var password = _prefs.getString('password');

    if(_oldPasswordController.text == password){
      _prefs.setString('password', _newPasswordController.text);
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
                          child: Icon(Icons.check, color: Colors.green, size: 40,),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Password Updated Successfully',
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
                        'Invalid Old Password',
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

  // signIn() {
  //   if((_emailController.text.trim() == "a") && (_passwordController.text.trim() == "a")){
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AddPost()));
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return Dialog(
  //               backgroundColor: Colors.black,
  //               child: Container(
  //                 height: 200,
  //                 width: MediaQuery.of(context).size.width,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //                 child: Column(
  //                   children: [
  //                     Padding(
  //                       padding: const EdgeInsets.only(top: 50),
  //                       child: Container(
  //                         height: 50,
  //                         width: 50,
  //                         decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             border: Border.all(color: Colors.black, width: 1)
  //                         ),
  //                         child: Icon(Icons.close, color: Colors.red, size: 40,),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Text(
  //                       'Invalid Credentials!',
  //                       style: TextStyle(
  //                         fontWeight: FontWeight.w700,
  //                         fontSize: 25,
  //                         color: Color(0xff000000),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ));
  //         });
  //   }
  // }
}
