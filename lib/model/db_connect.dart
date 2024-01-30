import 'package:cloud_firestore/cloud_firestore.dart';


class DBConnect{
  Future addGustDetails(Map<String,dynamic> gustInfoMap, String id) async{
    return await FirebaseFirestore.instance.
    collection('gust')
        .doc(id)
        .set(gustInfoMap);
  }
  Future<Stream<QuerySnapshot>> getGustDetails()async{
    return  FirebaseFirestore.instance.collection('gust').snapshots();

  }
}