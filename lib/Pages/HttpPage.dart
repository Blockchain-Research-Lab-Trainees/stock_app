// import 'dart:convert';
import 'package:stock_app/Data/StoreList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/Model.dart';
import 'package:stock_app/Pages/DetailStock.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:sensors/sensors.dart';
class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}
StoreList L=StoreList();
class _HttpPageState extends State<HttpPage> {
  double scrollPosition = 0.0;


   void initState(){
    super.initState();
    getHttpRequest();
    accelerometerEvents.listen((AccelerometerEvent event) {
    double sensitivity = 2.0;
    scrollPosition += event.y * sensitivity;
      if (scrollPosition < 0) {
        scrollPosition = 0;
      } else if (scrollPosition > 1.0) {
        scrollPosition = 1.0;
      }
      // setState((){});
    });
   }

  List<Stock>? stockData;

  Future <void> getHttpRequest()async{
    final String apiKey ="1e71ef091fmsh9f841ffb3c10310p19c60fjsna11ad101e2b5";
    final String endpoint ="https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%20200";
    final String apihost ="latest-stock-price.p.rapidapi.com";
    final response=await http.get(Uri.parse(endpoint),
    headers: {
      'RapidApi-key':apiKey,
      'RapidApi-Host':apihost,
    });
    if(response.statusCode==200){
      stockData=stockFromMap(response.body);
      print(stockData![5].symbol.toString());
      // if(stockData!.contains(symbol.compareTo("HDFCBANK"))){
      //
      // }
      stockData!.forEach((element) {
        setState(() {

          L.symbol.add(element.symbol.toString());
          L.identifier.add(element.identifier.toString());
          L.open.add(element.open.toString());
          L.dayHigh.add(element.dayHigh.toString());
          L.dayLow.add(element.dayLow.toString());
          L.lastPrice.add(element.lastPrice.toString());
          L.previousClose.add(element.previousClose.toString());
          L.change.add(element.change.toString());
          L.pchange.add(element.pChange.toString());
          L.totalTradedVolume.add(element.totalTradedVolume.toString());
          L.totalTradedValue.add(element.totalTradedValue.toString());
          L.lastUpdateTime.add(element.lastUpdateTime.toString());
          L.yearHigh.add(element.yearHigh.toString());
          L.yearLow.add(element.yearLow.toString());
          L.perChange365d.add(element.perChange365D.toString());
          L.perChange30d.add(element.perChange30D.toString());

        });
      });

    }else{
      print('error');
    }

  }
  void dispose() {
    super.dispose();
    accelerometerEvents.drain();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Column(children: [
          TextButton(onPressed: (){
            if(L.symbol!=null){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailStock(sym: "UBL")));
              // DetailStock(sym: L.symbol[1].toString());
            }
          }, child:Text('try',style: TextStyle(color: Colors.white),) ),
          Text("Stocks"),
        ],),
      ),
      ),
      body:
       // Column(
       //   children: [
           // TextButton(onPressed: (){DetailStock(L.symbol[2]);}, child:Text('try') ),
           Container(
             child: ListView.builder(

                      itemCount:L.symbol.length,
                      itemBuilder: (context,index){
                    return ListTile(
                      subtitle: Column(children: [
                        Text('  '),
                        Text('  '),
                        Text(L.symbol[index],style:TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                        Text('  '),
                        // Text(identifier[index].toString()),
                        Text("Open with Price: "+L.open[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                        Text("Day High Price: "+L.dayHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        Text("Day Low Price: "+L.dayLow[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        // Text(lastPrice[index].toString()),
                        // Text(previousClose[index].toString()),
                        // Text(change[index].toString()),
                        // Text(pchange[index].toString()),
                        Text("Total Traded Volume: "+L.totalTradedVolume[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        Text("Total Traded Value: "+L.totalTradedValue[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        Text("Last Update: "+L.lastUpdateTime[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        Text("Year High Price: "+L.yearHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20)),
                        // Text(yearLow[index].toString()),
                        // Text(perChange365d[index].toString()),
                        // Text(perChange30d[index].toString()),

                        ],
                      ),

                    );
                  },
              controller: ScrollController(initialScrollOffset: scrollPosition),
      ),

           ),


      //
      // body: Text(data.length.toString()),
    );
  }
}
