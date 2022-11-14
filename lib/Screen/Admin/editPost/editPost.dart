import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:primal_fm/Screen/Admin/ViewPostAdmin/viewPostAdmin.dart';
import 'package:primal_fm/Screen/ViewPost/viewPost.dart';
import 'package:primal_fm/constants/text_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../constants/ProgresPopup.dart';
import '../ForgetPassword/forgotPassword.dart';
import '../addPost/addPost.dart';


class EditPost extends StatefulWidget {
  EditPost({Key? key, this.documentId}) : super(key: key);

  var documentId;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  File? _imageFile;

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext contexc03cd5f2006e15a3d3bbf684a25b9dc9t) {
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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30),
                child: Text(
                  'Edit Post',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50,),

          FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: CustomTextFormFieldWithPrefix(
                            keyboardType: TextInputType.emailAddress,
                            readOnly: false,
                            controller: _titleController,
                            hintText: 'Title',
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: CustomTextFormFieldWithPrefix(
                            keyboardType: TextInputType.emailAddress,
                            readOnly: false,
                            controller: _descriptionController,
                            hintText: 'Description',
                            minLines: 8,
                            maxLines: 11,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Center(
                        child: GestureDetector(
                          onTap: getImage,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xffda1328),
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.camera, size: 20, color: Colors.white,),
                                Text(
                                  'Add Image Here',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: getImage,
                      //     child: Container(
                      //       width: 0.8,
                      //       height: 50,
                      //       decoration: BoxDecoration(
                      //         image: DecorationImage(
                      //           image: (_imageFile != null) ?
                      //           Image.file(
                      //             File(_imageFile!.path
                      //                 .toString()),).image : null,
                      //         ),
                      //         color: Colors.grey
                      //       ),]
                      //       backgroundImage: (_imageFile != null) ?
                      //       Image.file(
                      //         File(_imageFile!.path
                      //             .toString()),
                      //         fit: BoxFit.cover,).image : null,
                      //
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 40,),

                      Center(
                        child: GestureDetector(
                          onTap: () async{

                            ProgressPopup(context);

                            setState(() {
                            });
                            String imageUrl = "";

                            if(_imageFile != null){
                              FirebaseStorage storage = FirebaseStorage.instance;
                              var date  = DateTime.now().toString();

                              String fileName = _imageFile!.path.split('/').last;

                              Reference ref = storage.ref('posts').child(date.toString());

                              await ref.putFile(File(_imageFile!.path));
                              imageUrl = await ref.getDownloadURL();
                              print(imageUrl);

                              final json1 = {
                                "title" : _titleController.text,
                                "description" : _descriptionController.text,
                                "imageUrl" : imageUrl,
                                "date" : DateTime.now()
                              };
                              final docUser = FirebaseFirestore.instance.collection("posts");

                              await docUser.doc(widget.documentId).update(json1).then((value) => print("I am heree"));

                            } else {
                              final json1 = {
                                "title" : _titleController.text,
                                "description" : _descriptionController.text,
                                "date" : DateTime.now()
                              };
                              final docUser = FirebaseFirestore.instance.collection("posts");

                              await docUser.doc(widget.documentId).update(json1).then((value) => print("I am heree"));
                            }

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Color(0xffda1328),
                              content: Text("Post Updated Successfully", style: TextStyle(color: Colors.black),),
                            ));

                            Navigator.pop(context);
                            Navigator.pop(context);

                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xffda1328),
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                            ),
                            child: Center(child: Text(
                              'Edit Post',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),

                      SizedBox(height: 50,),

                    ],
                  ),
                ),
              );
            }
          ),


            ],
          ),
        ),
      ),
    );
  }

  getData() async{
    print("heeehahsdadada");
    var temp = await collectionReference.doc(widget.documentId).get();
    print(temp['title'].toString());
    _titleController.text = temp['title'];
    _descriptionController.text = temp['description'];

  }

  Future getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type:FileType.image);

    if(result != null){
      setState(() {
        _imageFile = File(result.files.single.path.toString());
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xffda1328),
        content: Text("Image Uploaded", style: TextStyle(color: Colors.black),),
      ));
    }
  }

}


