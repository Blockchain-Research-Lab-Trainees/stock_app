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
  String ch='';
  // void initState() {
  //   super.initState();
  //   check(ch);
  // }
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
            child: Center(
              child: Column(
      children: [
          Text('  '),
              // Text(identifier[index].toString()),
          Text("Open with Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(L.open[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),
          Text("Day High Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.dayHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),
          Text("Day Low Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.dayLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Last Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.lastPrice[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Previous Close Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.previousClose[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Change in Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.change[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          // Text("Open with Price: "+L.pchange[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Total Traded Volume: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.totalTradedVolume[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Total Traded Value: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.totalTradedValue[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Last Update: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.lastUpdateTime[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Year High Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.yearHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Year Low Price: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.yearLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Change Price in 365 days: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.perChange365d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text(' '),

          Text("Change Price in 30 days: ",style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text(L.perChange30d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),

      ],),
            ),
          ),
        ),
    );
  }
}
