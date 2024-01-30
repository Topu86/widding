import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import '../model/db_connect.dart';

class Gust extends StatefulWidget {
  const Gust({Key? key}) : super(key: key);

  @override
  State<Gust> createState() => _GustState();
}

class _GustState extends State<Gust> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController giftcontroller = TextEditingController();
  TextEditingController relativecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gust Data',
        style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,),
      body: Container(
        margin: EdgeInsets.only(left: 20,top: 30,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
            Text('Gift/Taka',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextField(controller: giftcontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 20,),
            Text('Relative',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: TextField(
                controller: relativecontroller,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: ElevatedButton(
                  onPressed: () async {
                    String Id = randomAlphaNumeric(18);
                Map<String,dynamic> gustInfoMap={
                  "Name":namecontroller.text,
                  "GIft":giftcontroller.text,
                  "Relative":relativecontroller.text
                };
                await DBConnect().addGustDetails(gustInfoMap, Id).then((value) => {
                Fluttertoast.showToast(
                msg: "Upload Your Data",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
                )
                });
              },
                  child: Text('Save')),
            )


          ],
        ),
      ),

    );
  }
}
