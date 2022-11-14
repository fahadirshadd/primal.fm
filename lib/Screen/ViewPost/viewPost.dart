import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../viewSinglePost/viewSinglePost.dart';

class ViewPosts extends StatefulWidget {
  const ViewPosts({Key? key}) : super(key: key);

  @override
  State<ViewPosts> createState() => _ViewPostsState();
}

class _ViewPostsState extends State<ViewPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
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
                      child: Icon(Icons.arrow_back_ios_rounded, color: Colors.white, size: 22,),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
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
                padding: const EdgeInsets.only(top: 10, left: 30),
                child: Text(
                  'View Posts',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('posts').orderBy('date', descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
                          }
                          else {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: ListView(
                                  children: snapshot.data!.docs.map((document) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewSinglePost(documentId: document.id,)));
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context).size.width * 0.9,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:NetworkImage(document['imageUrl']))
                                              ),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(document['title'],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),),
                                            SizedBox(height: 10,),
                                            Text(document['description'],textAlign:TextAlign.left,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white),maxLines: 5,overflow: TextOverflow.ellipsis,),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text('Read More', style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xffda1328),),)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList()),
                            );
                          }
                        }),
                  ],
                ),
              ),



              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
