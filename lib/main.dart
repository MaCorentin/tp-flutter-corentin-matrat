import 'package:boninterexo/equipement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMain',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home:  MyHomePage(title: 'MyMain'),
    );
  }
}

class InfoText extends StatelessWidget {
  const InfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                  Text("Xefi Lyon",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 3)),
                  Text("2507 Avenue de l'Europe,"),
                  Text("69140 Rillieux-la-Pape"),
                  Text("04 72 83 75 75", style: TextStyle(height: 2)),
                  Text("xefi@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.bold, height: 2)),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Text(
                        "Advenit post multos Scudilo Scuriorim tribunus cvelamento subafresti inegnii persuianinis opifex callidus qui eum adulabili sermo seriis.",
                        style: TextStyle(height: 1.5)),
                  )
                ])))
      ],
    );
  }
}

class ListArticle extends StatelessWidget {
  final String nom,numserie;
  const ListArticle({Key? key, required this.nom, required this.numserie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nom,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                   Text(
                    "n° de série : "+numserie,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const Text(
                    "Infos et historique >",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    
      final List<Equipement> listEquipement = [Equipement(nom: "ergrgg", numserie: "15615"),Equipement(nom: "ergrgg", numserie: "15615"),Equipement(nom: "ergrgg", numserie: "15615"),Equipement(nom: "ergrgg", numserie: "15615"),Equipement(nom: "ergrgg", numserie: "15615"),Equipement(nom: "ergrgg", numserie: "15615")];
      final int _length = listEquipement.length;
    return Scaffold(
      body: Column(
        children: <Widget>[
          const InfoText(),
          Row(
            children:  [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Equipements($_length)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      height: 2),
                ),
              )
            ],
          ),
          SizedBox(
            width: _size.width,
            height: _size.height * 0.51,
            child: ListView(
              padding: const EdgeInsets.all(8),
              children:
                List.generate( listEquipement.length , (int index) => ListArticle(nom:listEquipement[index].nom,numserie: listEquipement[index].numserie),)
              ,
            ),
          ),
        ],
      ),
    );
  }
}
