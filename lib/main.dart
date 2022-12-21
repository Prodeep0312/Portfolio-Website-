import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio Web App',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prodeep Ghosh'),

        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              HeroSection(),
              SizedBox(height: 20,),
              Text('    Projects -',style: TextStyle(fontSize: 40.0),),
              SizedBox(height: 20,),
              ProjectState(),
              SizedBox(height: 20,),
              Text('    Skills -',style: TextStyle(fontSize: 40.0),),
              SkillSection(),


            ],
          ),
        ),
    ));
  }
}
class HeroSection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 600.0),

      child:  Stack(
        alignment: Alignment.center,
          children: [
            Image.asset('images/hero.jpg',fit: BoxFit.cover,width: double.infinity,),
            Text('    Hi I am Prodeep Ghosh \n I write codes for Mobile And Web Apps',
              textAlign:TextAlign.center,
              style: TextStyle(
              fontSize: MediaQuery.of(context).size.width>768 ? 50.0 :30.0,
              color: Colors.white,
              backgroundColor: Colors.purple,
            ),),

          ],
        ),

    );

  }
}

class ProjectState extends StatelessWidget {
  final List<Map> projets = [
    {
      "title": "Instagram clone",
      "url": "https://www.instagram.com/",
      "image":
      "https://images.unsplash.com/photo-1585247226801-bc613c441316?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Insta chat",
      "url": "https://www.instagram.com/",
      "image":
      "https://images.unsplash.com/photo-1512486130939-2c4f79935e4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "My Store",
      "url": "https://www.amazon.in/",
      "image":
      "https://images.unsplash.com/photo-1509395062183-67c5ad6faff9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Notes App",
      "url": "https://apps.apple.com/us/app/notes/id1110145109",
      "image":
      "https://images.unsplash.com/photo-1516131206008-dd041a9764fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Job Portal",
      "url": "https://jobs.delhi.gov.in/",
      "image":
      "https://images.unsplash.com/photo-1516131206008-dd041a9764fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(

        maxCrossAxisExtent:300,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10),
    
    children:projets.map((e) => Container(
      margin: EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(

          header: GridTileBar(title: Text(e["title"]),backgroundColor: Colors.purple),
          child: Image.network(e["image"]),

        footer: GridTileBar(title:TextButton.icon(onPressed: (){
          window.open(e["url"], 'code link');


        }, icon: Icon(Icons.code), label:Text('View Code',style: TextStyle(color: Colors.purple),)),
          backgroundColor:Colors.white,
        ),

        ),
      ),
    )
    ).toList(),
    );
  }
}


class GenerateStars extends StatelessWidget {
  final int star;
  final String skillname;
  GenerateStars({required this.star,required this.skillname});


  @override

  Widget build(BuildContext context) {
    List<Widget> stars=[
      Container(
          width:180,
          child: Text(skillname,style: TextStyle(fontSize: 30.0),))
    ];

    for(int i=1;i<=star;i++){

      stars.add(Icon(Icons.star,color: Colors.purple,));
    }

    for(int i=star+1;i<=10;i++){

      stars.add(Icon(Icons.star_outline));
    }
    return Row(children:stars);
  }
}


class SkillSection extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(

          children: [

            GenerateStars(star: 1, skillname:'React'),
            GenerateStars(star: 5, skillname:'Flutter'),
            GenerateStars(star: 1, skillname:'Node.js'),
            GenerateStars(star: 7, skillname:'OOPS'),
            GenerateStars(star: 6, skillname:'DBMS'),
            GenerateStars(star: 5, skillname:'OS'),





          ],
        ),
        if(MediaQuery.of(context).size.width >920.0)Image.asset('images/webdev.png',fit: BoxFit.cover,),
      ],
    );
  }
}








