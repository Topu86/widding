import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widding/screen/gust.dart';
import '../constraction.dart';
import '../model/db_connect.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Stream? GustStream;
  getontheload () async{
    GustStream = await DBConnect().getGustDetails();
    setState(() {

    });
  }
  void initstate(){
    getontheload();
    super.initState();
  }
 Widget allGustDetails (){
   return StreamBuilder(
       stream: GustStream,
       builder: (context, AsyncSnapshot Snapshot){

     return Snapshot.hasData? ListView.builder(
         itemCount: Snapshot.data.doc.lenght,
         itemBuilder: (context, index){
           DocumentSnapshot ds = Snapshot.data.doc[index];
           return  Material(
             elevation: 5,
             borderRadius: BorderRadius.circular(10),
             child: Container(
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(10)
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('Name:'+ds["Name"],style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                       Icon(Icons.edit,color: Colors.orange,)
                     ],
                   ),
                   Text('Gift/Taka:'+ds["Gift/Taka"],style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                   Text('Relative:'+ds["Relative"],style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                 ],
               ),
             ),
           );

         }): Container();
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>Gust()));},
        child: Icon(Icons.add),),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appbar,

        title: Text('Widding Gift',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      backgroundColor: background,
      body: Container(
        margin: EdgeInsets.only(left: 20 ,right: 20,top: 30),
        child: Column(
          children: [
            Expanded(child: allGustDetails())
          ],
        ),
      ),
    );
  }
}
