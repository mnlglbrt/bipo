import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'medals_page.dart';

class Medal {
  int nbRecords;
  String title;
  String content;
  String imgUrl;

  Medal(this.nbRecords, this.title, this.content, this.imgUrl);
}

class obtainedMedal {
  DateTime date;
  int nbRecords;

  obtainedMedal(this.date, this.nbRecords);
}


List<Medal> medalList=[
  Medal(1,'Première\nentrée',"Bravo, vous venez de réaliser votre premier enregistrement. Continuez et vous débloquerez bientôt d'autres trophées.",'img.jp'),
  Medal(3,'Moyennes\net\nextremes',"Félicitations ! Grâce à vos 3 enregistrements vous avez maintenant accès aux moyennes et aux valeurs extrêmes dans la page profil.",'img.jp'),
  Medal(7,'Voir plus loin',"Avec ce septième enregistrement vous venez de débloquer deux nouveaux graphs sur l'acceuil. Allez y jeter un oeil !",'img.jp'),
  Medal(15,'15 jours !',"Wow ! Votre graph doit avoir de l'allure avec tous ces enregistrements!",'img.jp'),
  Medal(21,'Une habitude',"Les neurosciences affirment que lorsqu'on réalise une action pendant 21 jours, notre corps et notre esprit l'assimilent comme habitude. Cette action devient un automatisme. L'équipe de ThymTrack vous remercie d'avoir fait à notre travail une place dans votre quotidien.",'img.jp'),
  Medal(24,'Méditation',"Avez vous déja essayé la relaxation ou la méditation ? Tout commence avec le contrôle de la respiration. Prenez le temps d'inspirer et d'expirer profondément tout en vous efforçant de ne penser à rien. Faire le vide et chasser pour une dizaine de minutes les pensées parasites qui affluent dans votre conscience. Juste ressentir votre propre présence au moment et à l'endroit oú vous êtes.",'img.jp'),
  Medal(30,'30 enregistrements !',"L'équivalent d'un mois. Jour après jour... Vous pouvez être fiers !",'img.jp'),
];

void checkMedals(){
  updateToday();
  final data_instance = Firestore.instance;
  Map<String, dynamic> map;
  for (int i=0;i<medalList.length;i++) {
    if (dataMoods.length==medalList[i].nbRecords && dataMedals.where((med)=>med.nbRecords==dataMoods.length).toList().isEmpty){
      map={today.toString():dataMoods.length};
      data_instance.collection('users').document(uid).collection(
          "medals").document(today.toString()).setData(map);
    }
  }
}

List<obtainedMedal> dataMedals =[];


Future <List<Map<dynamic, dynamic>>> getCollection() async {
  List<DocumentSnapshot> templist;
  List<Map<dynamic, dynamic>> list = new List();
  CollectionReference collectionRef = Firestore.instance.collection("users")
      .document(uid)
      .collection('medals');
  QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

  templist = collectionSnapshot.documents; // <--- ERROR

  list = templist.map((DocumentSnapshot docSnapshot) {
    return docSnapshot.data;
  }).toList();

  return list;
}


