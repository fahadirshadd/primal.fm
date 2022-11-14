import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:primal_fm/Screen/viewSinglePost/viewSinglePost.dart';
import 'package:transparent_image/transparent_image.dart';

import '../editPost/editPost.dart';

class ViewPostAdmin extends StatefulWidget {
  const ViewPostAdmin({Key? key}) : super(key: key);

  @override
  State<ViewPostAdmin> createState() => _ViewPostAdminState();
}

class _ViewPostAdminState extends State<ViewPostAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView(
                                children: snapshot.data!.docs.map((document) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewSinglePost(documentId: document.id,)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(bottom: 30),
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.7,
                                                      child: Text(document['title'],style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18,color: Colors.white),)),
                                                  SizedBox(height: 10,),
                                                  SizedBox(
                                                      width: MediaQuery.of(context).size.width * 0.7,
                                                      child: Text(
                                                        document['description'],textAlign:TextAlign.left,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.white),maxLines: 3, overflow: TextOverflow.ellipsis,)),
                                                  SizedBox(height: 10,),
                                                ],
                                              ),
                                              PopupMenuButton(
                                                  onSelected: (value) async{
                                                    if (value == 1) {
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditPost(documentId: document.id,)));
                                                    } else if (value==2){
                                                      showDialog(context: context,
                                                          builder: (context) {
                                                            return Dialog(
                                                              backgroundColor: Colors.transparent,
                                                              child: Container(
                                                                  height: 250,
                                                                  width: MediaQuery.of(context).size.width * 0.6,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                      color: Color(0xffda1328)
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              'Delete Post',
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 18,
                                                                                  fontFamily: 'SFProDisplay',
                                                                                  fontWeight: FontWeight.w600),
                                                                            ),
                                                                            SizedBox(width: 35,),
                                                                            IconButton(
                                                                                onPressed: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                icon: Icon(Icons.close, size: 22, color: Colors.black,)),
                                                                            SizedBox(width: 10,)
                                                                          ],
                                                                        ),

                                                                        Center(
                                                                          child: SizedBox(
                                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                                            child: Text(
                                                                              'Do you want to delete this post?',
                                                                              style: TextStyle(
                                                                                fontSize: 16,
                                                                                fontFamily: 'SFProDisplay',
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.w600,),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                        GestureDetector(
                                                                          onTap: () async{
                                                                            Navigator.pop(context);
                                                                            await FirebaseFirestore.instance.collection('posts').doc(document.id).delete();
                                                                          },
                                                                          child: Container(
                                                                            width: MediaQuery.of(context).size.width * 0.4,
                                                                            height: 40,
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                              color: Colors.black,
                                                                            ),
                                                                            child: Center(
                                                                              child: Text(
                                                                                'Delete',
                                                                                style: TextStyle(
                                                                                    fontSize: 14,
                                                                                    fontFamily: 'SFProDisplay',
                                                                                    color: Colors.white,
                                                                                    fontWeight: FontWeight.w600),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],),
                                                                  )
                                                              ),
                                                            );
                                                          });
                                                    }
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10.0))),
                                                  padding: EdgeInsets.all(0),
                                                  color: Color(0xffda1328),
                                                  icon: Icon(Icons.more_vert,
                                                      size: 25, color: Colors.white,),
                                                  itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                      child: Text(
                                                        "Edit",
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'SFProDisplay',
                                                            fontSize: 11,
                                                            color: Colors.white),
                                                      ),
                                                      value: 1,
                                                    ),
                                                    PopupMenuItem(
                                                      child: Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontFamily:
                                                            'SFProDisplay',
                                                            fontSize: 11,
                                                            color: Colors.white),
                                                      ),
                                                      value: 2,
                                                    ),

                                                  ]),
                                          ],),
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
    );
  }
  // void _showPopupMenu() async {
  //   await showMenu(
  //     context: context,
  //     items: [
  //       PopupMenuItem<String>(
  //           child: const Text('Edit'), value: 'Edit'),
  //       PopupMenuItem<String>(
  //           child: const Text('Delete'), value: 'Delete'),
  //     ],
  //     elevation: 8.0,
  //   );
  // }

}
