/*
import 'package:cloud_firestore/cloud_firestore.dart';
 class FirebaseConnectivity{
   final firestoreInstance = FirebaseFirestore.instance;
   List itemName = [];
   List weight = [];
   fetchPizza(){
     firestoreInstance
         .collection('instant-recpie')
         .doc('pizza')
         .get()
         .then((ds) {
     itemName = ds['item'];
     weight = ds['weight'];
     return[itemName,weight];
     });
   }
 }
*/
