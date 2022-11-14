import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ViewSinglePost extends StatefulWidget {
  ViewSinglePost({Key? key, this.documentId}) : super(key: key);

  var documentId;

  @override
  State<ViewSinglePost> createState() => _ViewSinglePostState();
}

class _ViewSinglePostState extends State<ViewSinglePost> {

  CollectionReference collectionReference = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: FutureBuilder<dynamic>(
          future: getData(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              print(snapshot.data.toString());
              return Container(
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

                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(snapshot.data!['imageUrl'])
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        snapshot.data['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        snapshot.data['description'],
                        style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white,
                       ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xffda1328),
                ),
              );
            }

          }
        ),
      ),
    );
  }

  getData() async{
    var temp = await collectionReference.doc(widget.documentId).get();

    return temp;

  }
}

