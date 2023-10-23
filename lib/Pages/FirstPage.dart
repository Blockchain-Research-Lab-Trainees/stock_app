import 'package:flutter/material.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:stock_app/Pages/HttpPage.dart';
import 'package:stock_app/main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
        height: MediaQuery.of(context).size.height,
        decoration:const BoxDecoration(
        image: DecorationImage(
            image:AssetImage('lib/assets/BG.png'), // Replace with your image asset path
            fit: BoxFit.cover, // Adjust the fit as needed
            ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [ Column(
              children: [Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 105, 0, 10),
              child:Column(children: [
                 Text('WELCOME TO',style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,color: Colors.orange),),
                 Text('STOCK APP',style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,color: Colors.orange),),
    ],
    ),

    ),
    ),
                SizedBox(height: 200,),
                ElevatedButton(onPressed:(){
                  Navigator.push(context,  MaterialPageRoute(builder: (context) => HttpPage()));
                }, child: Row(
                  children: [
                    Text('STOCK'),
                    Icon(Icons.arrow_right_alt),
                  ],
                )),
    ],),
        ],
          ),
        ),
        ),
    );
}
}