import 'package:sensors_plus/sensors_plus.dart';
import 'package:stock_app/Data/StoreList.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/Pages/HttpPage.dart';
import 'dart:async' as p;
class DetailStock extends StatefulWidget {
  DetailStock({ required this.sym});
 final String sym;
  @override
  State<DetailStock> createState() => _DetailStockState();
}
int ind=0;
class _DetailStockState extends State<DetailStock> {
  p.Future? f(){
  print(L.symbol[8]);
}
  Future<void> check (String symb) async{
    setState(() {

    if(L.symbol.contains(symb)){
      setState(() {
        ind=L.symbol.indexOf(symb);
      });
    }
    else{
      print("not exit");
    }
    });
  }
  double scrollPosition = 0.0;
  String ch='';
  void initState() {
     super.initState();
     accelerometerEvents.listen((AccelerometerEvent event) {
       // print('Accelerometer: x=${event.x}, y=${event.y}, z=${event.z}');
       double sensitivity = 2.0;
       setState((){
         scrollPosition += event.y * sensitivity;
         if (scrollPosition < 0) {
           scrollPosition = 0;
         } else if (scrollPosition > 1.0) {
           scrollPosition = 1.0;}
       });
     });
   }
  @override
  Widget build(BuildContext context) {
    setState(() {
      ch = widget.sym;
      check(ch);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
          Text(L.symbol[ind],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
        ),
        body:SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration:const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('lib/assets/BGT.jpeg'), // Replace with your image asset path
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
      children: [
          Text('  '),
                // Text(identifier[index].toString()),
          Text("Open with Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white),),
          Text(L.open[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),
          Text("Day High Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.dayHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),
          Text("Day Low Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.dayLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Last Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.lastPrice[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Previous Close Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.previousClose[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Change in Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.change[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          // Text("Open with Price: "+L.pchange[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Total Traded Volume : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.totalTradedVolume[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Total Traded Value : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.totalTradedValue[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Last Update : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.lastUpdateTime[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Year High Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.yearHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Year Low Price : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.yearLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Change Price in 365 days : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.perChange365d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text(' '),

          Text("Change Price in 30 days : ",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 25,color: Colors.white)),
          Text(L.perChange30d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),
          Text('  '),
        Text('  '),
        Text('  '),
        ElevatedButton(
          style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
            maximumSize: Size(115, 55),
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          onPressed:(){
          }, child: Row(children: [
          Text('BUY ',style: TextStyle(color: Colors.yellow[800],fontSize: 22,fontWeight: FontWeight.w800),),
          Icon(Icons.attach_money_rounded ,color: Colors.yellow[800],),
        ],),
        ),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
        Text('  '),
      ],),
              ),
              controller: ScrollController(initialScrollOffset: scrollPosition),
            ),
          ),

        ),
    );
  }
}
