
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'package:clay_containers/clay_containers.dart';
import 'medals.dart';
import 'package:url_launcher/url_launcher.dart';



class MedalsPage extends StatefulWidget {
  @override
  _MedalsPageState createState() => _MedalsPageState();
}

class _MedalsPageState extends State<MedalsPage> {
@override
  void initState() {
    super.initState();
    checkMedals();
    getMedals();
    print(dataMedals);
  }
  @override
  Widget build(BuildContext context) {

    double newMedalIconSize=20;
    return Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          centerTitle: true,
          backgroundColor: Colors.teal,

          title: new Text(
            "TROPHEES", textAlign: TextAlign.center,
            textScaleFactor: 0.8,
            style: new TextStyle(
              fontFamily: 'dot',
              color: Colors.white,),),

          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/logo.png'),
          ),

          actions: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Tooltip(message: 'Retour',
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0,),
                      child: ClayContainer(
                        borderRadius: 75,
                        depth: 10,
                        spread: 7,
                        width: 40,
                        height: 40,
                        color: Colors.teal,
                        child: CircleAvatar(
                          radius: 35,
                          child: CircleAvatar(
                            radius: 34,
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            child: Icon(
                              Icons.arrow_back,
                            ),
                          ),
                        ),


                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        body: (dataMedals.isNotEmpty)?Center(
          child: Container(
            color: Colors.grey[100],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,


            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new GridView.builder(
                  itemCount: dataMedals.length,
                  gridDelegate:
                  new SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio:1.2,crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int i) {
                    Medal current = medalList.where((med)=>med.nbRecords==dataMedals[i].nbRecords).first;
                    return Padding(
                      padding: const EdgeInsets.only(bottom:10.0,top:10),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                          newMedalIconSize=2;
                        });
                          _showMedal(dataMedals[i].nbRecords,dataMedals[i].date);},
                        child: Container(

                            decoration: BoxDecoration(
                                shape:BoxShape.circle,
                                image: DecorationImage(image:AssetImage('images/medal2.png'),colorFilter: ColorFilter.mode(Colors.teal, BlendMode.dst)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey[300],
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      2.0, // Move to right 10  horizontally
                                      2.0, // Move to bottom 10 Vertically
                                    ),
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 2.0, // soften the shadow
                                    spreadRadius: 2.0, //extend the shadow
                                    offset: Offset(
                                      -2.0, // Move to right 10  horizontally
                                      -2.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],

                            ),

                            child:Stack(
                              alignment: AlignmentDirectional.center,
                              children: <Widget>[

                                (dataMedals[i].date==today)?Positioned(bottom:6,
                                    child: Container(decoration:BoxDecoration(shape: BoxShape.circle,color:Colors.teal),child: Icon(Icons.new_releases,size: newMedalIconSize,color:Colors.white))):Container(height:0),

                                Positioned(
                                  top:15,
                                  child:Text("${current.nbRecords}",textScaleFactor: 1.5,textAlign: TextAlign.center,style: TextStyle(color:Colors.white),),
                                ),
                                Positioned(
                                  child:Text("${current.title}",textScaleFactor: 1,textAlign: TextAlign.center,style: TextStyle(color:Colors.white)),
                                ),


                                /*Positioned(
                                  bottom:5,
                                  child: Text("${dayFormatter.format(dataMedals[i].date)}"),
                                ),*/

                              ],
                            )
                        ),
                      ),
                    );
                  }),
            )

                      //Text("${dataMedals[0].nbRecords}"),



            ),


          ):
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/logo.png"))) ,
        child: Text("Vous trouverez ici les médailles que \nvous remportrez en enregistrant votre humeur.\nRevenez ici après avoir enregistré votre humeur pour la première fois.", textAlign: TextAlign.center,))

        );

  }

void _showMedal(nbRecords,date){
  showDialog(context: context,
  barrierDismissible: false,
  builder: (BuildContext context){
    return SingleChildScrollView(
      child: AlertDialog(backgroundColor: Colors.grey[200],
        content:Column(
          children: <Widget>[
            Text("${dayFormatter.format(date)}"),
            Container(
              height:300,
                width: 300,
                decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    image: DecorationImage(image:AssetImage('images/medal2.png'),colorFilter: ColorFilter.mode(Colors.teal, BlendMode.dst)),
      boxShadow: [
      BoxShadow(
      color: Colors.grey[300],
      blurRadius: 2.0, // soften the shadow
      spreadRadius: 2.0, //extend the shadow
      offset: Offset(
      2.0, // Move to right 10  horizontally
      2.0, // Move to bottom 10 Vertically
      ),
      ),
      BoxShadow(
      color: Colors.white,
      blurRadius: 2.0, // soften the shadow
      spreadRadius: 2.0, //extend the shadow
      offset: Offset(
      -2.0, // Move to right 10  horizontally
      -2.0, // Move to bottom 10 Vertically
      ),
      )
      ],

      ),

                child:Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Positioned(
                      top:75,
                      child:Text("${medalList.where((med)=>med.nbRecords==nbRecords).toList()[0].nbRecords}",textScaleFactor: 1.5,textAlign: TextAlign.center,style: TextStyle(color:Colors.white),),
                    ),
                    Positioned(
                      child:Text("${medalList.where((med)=>med.nbRecords==nbRecords).toList()[0].title}",textScaleFactor: 1,textAlign: TextAlign.center,style: TextStyle(color:Colors.white)),
                    ),
                    /*Positioned(bottom:5,child: Text("${dayFormatter.format(dataMedals[i].date)}"),),*/
                  ],
                )
            ),
            Text("${medalList.where((med)=>med.nbRecords==nbRecords).toList()[0].content}",textScaleFactor: 1,textAlign: TextAlign.center,style: TextStyle(color:Colors.black)),
          ],
        ),
        actions: <Widget>[
          FlatButton(child:Text('Fermer'),onPressed: (){Navigator.pop(context);},),
          (medalList.where((med)=>med.nbRecords==nbRecords).toList()[0].link=="")?Container():
      Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: RaisedButton(color:Colors.teal,
              onPressed: ()=>_launchURL(medalList.where((med)=>med.nbRecords==nbRecords).first.link),
              child: Text(medalList.where((med)=>med.nbRecords==nbRecords).toList()[0].linkText),
            ),
      ),
        ],

      ),
    );
  });}
  


  Future<Null> getMedals() async {
    var col = getCollection();
    List<ObtainedMedal> myData = [];
    col.then((coll) {
      dataMedals.clear();
      coll.forEach((med) {
        myData.add(ObtainedMedal(
            DateTime.parse(med.keys.toString().substring(1, 11)),
            int.parse(med.values.toString().substring(1, med.values
                .toString()
                .length - 1))));
        print('data : $dataMedals');
      });
      setState(() {
        dataMedals.clear();
        dataMedals = myData;

        print('data : $dataMedals');
      });
    });
  }

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url,forceSafariVC: false);
  } else {
    throw 'Connexion impossible à $url';
  }
}


}



//trailing:Container(width:100,child: Text("${medalList.where((med)=>med.nbRecords==dataMedals[i].nbRecords).toList()[0].content}")),
