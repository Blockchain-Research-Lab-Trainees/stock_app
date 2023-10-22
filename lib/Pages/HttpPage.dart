// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/Model.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:sensors/sensors.dart';
class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  double scrollPosition = 0.0;
   List<dynamic> symbol=[];
   List<dynamic> identifier=[];
   List<dynamic> open=[];
   List<dynamic> dayHigh=[];
   List<dynamic> dayLow=[];
   List<dynamic> lastPrice=[];
   List<dynamic> previousClose=[];
   List<dynamic> change=[];
   List<dynamic> pchange=[];
   List<dynamic> totalTradedVolume=[];
   List<dynamic> totalTradedValue=[];
   List<dynamic> lastUpdateTime=[];
   List<dynamic> yearHigh=[];
   List<dynamic> yearLow=[];
   List<dynamic> perChange365d=[];
   List<dynamic> perChange30d=[];


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
      setState((){});
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
          symbol.add(element.symbol.toString());
          identifier.add(element.identifier.toString());
          open.add(element.open.toString());
          dayHigh.add(element.dayHigh.toString());
          dayLow.add(element.dayLow.toString());
          lastPrice.add(element.lastPrice.toString());
          previousClose.add(element.previousClose.toString());
          change.add(element.change.toString());
          pchange.add(element.pChange.toString());
          totalTradedVolume.add(element.totalTradedVolume.toString());
          totalTradedValue.add(element.totalTradedValue.toString());
          lastUpdateTime.add(element.lastUpdateTime.toString());
          yearHigh.add(element.yearHigh.toString());
          yearLow.add(element.yearLow.toString());
          perChange365d.add(element.perChange365D.toString());
          perChange30d.add(element.perChange30D.toString());
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
          Text("Stocks"),
        ],),
      ),
      ),
      body:
       Container(
         child: ListView.builder(
                  itemCount:symbol.length,
                  itemBuilder: (context,index){
                return ListTile(
                  subtitle: Column(children: [
                    Text('  '),
                    Text(symbol[index]),
                    Text('  '),
                    Text(identifier[index].toString()),
                    Text(open[index].toString()),
                    Text(dayHigh[index].toString()),
                    Text(dayLow[index].toString()),
                    Text(lastPrice[index].toString()),
                    Text(previousClose[index].toString()),
                    Text(change[index].toString()),
                    Text(pchange[index].toString()),
                    Text(totalTradedVolume[index].toString()),
                    Text(totalTradedValue[index].toString()),
                    Text(lastUpdateTime[index].toString()),
                    Text(yearHigh[index].toString()),
                    Text(yearLow[index].toString()),
                    Text(perChange365d[index].toString()),
                    Text(perChange30d[index].toString()),

                    // Text(monthYear[index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25)),
                    // Text('  '),
                    // Text('Volume : '+vol[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
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
