import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:primal_fm/constants/ProgresPopup.dart';
import 'package:primal_fm/constants/text_fields.dart';


class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  File? _imageFile;


  @override
  Widget build(BuildContext context) {
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
                  }


                  final docUser = FirebaseFirestore.instance.collection("posts");

                  final json1 = {
                    "title" : _titleController.text,
                    "description" : _descriptionController.text,
                    "imageUrl" : imageUrl,
                    "date" : DateTime.now()
                  };
                  await docUser.add(json1).then((value) => print("I am heree"));

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Color(0xffda1328),
                    content: Text("Post Added Successfully", style: TextStyle(color: Colors.black),),
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
                    'Add Post',
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
