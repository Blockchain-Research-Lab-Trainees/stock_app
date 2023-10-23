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
        title: Center(
          child:Text(L.symbol[ind],style:TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
        ),
      ),
        body:Center(
          child: Column(
      children: [
          Text('  '),
          // Text(identifier[index].toString()),
          Text("Open with Price: "+L.open[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
          Text("Day High Price: "+L.dayHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Day Low Price: "+L.dayLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Last Price: "+L.lastPrice[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Previous Close Price: "+L.previousClose[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Change in Price: "+L.change[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          // Text("Open with Price: "+L.pchange[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Total Traded Volume: "+L.totalTradedVolume[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Total Traded Value: "+L.totalTradedValue[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Last Update: "+L.lastUpdateTime[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Year High Price: "+L.yearHigh[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Year Low Price: "+L.yearLow[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Change Price in 365 days: "+L.perChange365d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
          Text("Change Price in 30 days: "+L.perChange30d[ind].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),

      ],),
        ),
    );
  }
}
