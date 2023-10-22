// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/Model.dart';
import 'package:stock_app/utils/Routes.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
   List<dynamic> high=[];
   List<dynamic> open=[];
   List<dynamic> low=[];
   List<dynamic> close=[];
   List<dynamic> vol=[];
   List<dynamic> aclose=[];
   List<dynamic> amount=[];
    List<dynamic> monthYear=[];

   void initState(){
    super.initState();
    getHttpRequest("TSCO.LON");
  }
  String info="";
   String symbol='';
   String timezone='';
  String apiKey ="demo";
  String month='';
  var re;
  List<Stock>? stockData;
  Stock? stockD;
  Future <void> getHttpRequest(String symbolName)async{
    final String apiKey ="1e71ef091fmsh9f841ffb3c10310p19c60fjsna11ad101e2b5";
    final String endpoint ="https://latest-stock-price.p.rapidapi.com/price?Indices=NIFTY%20200";
    final String apihost ="latest-stock-price.p.rapidapi.com";
    final response=await http.get(Uri.parse(endpoint),
    headers: {
      'RapidApi-key':apiKey,
      'RapidApi-Host':apihost,
    });
    // String url ="https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol="+symbolName+"&apikey="+apiKey;
    // var response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode==200){
    // stockData=monthlyAdjustedFromMap(response.body);
      stockData=stockFromMap(response.body);
      // stockD=stockData as Stock?;
      print(stockData![5].symbol.toString());

    // stockData!.monthlyAdjustedTimeSeries.forEach((key, value) {
      setState(() {
        // monthYear.add(key);
        // info=stockData!.metaData.the1Information;
        // symbol=stockData!.metaData.the2Symbol;
        // timezone=stockData!.metaData.the4TimeZone;
        // high.add(value.the2High);
        // open.add(value.the1Open);
        // low.add(value.the3Low);
        // aclose.add(value.the5AdjustedClose);
        // amount.add(value.the7DividendAmount);
        // vol.add(value.the6Volume);
        // close.add(value.the4Close);
      });
    // });
    // print(data);
    // // print(monthlyAdjustedFromMap(response.body));
    }else{
      print('error');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Column(children: [
          // Text(info),
          // Text(symbol),
          // Text(timezone),
        ],),
      ),
      ),
      body:

          ListView.builder(
              // itemCount:open.length,
              itemBuilder: (context,index){
            return ListTile(
              subtitle: Column(children: [
                // Text(stockData!.monthlyAdjustedTimeSeries.cast().toString()),
                Text('  '),
                Text('  '),
                // Text(monthYear[index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25)),
                // Text('  '),
                // Text('Open : '+open[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('High : '+high[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('Low : '+low[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('Close : '+close[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('Adjusted Close : '+aclose[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('Amount : '+amount[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                // Text('Volume : '+vol[index],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
              ],
              ),

            );
          }),

      //
      // body: Text(data.length.toString()),
    );
  }
  // LineChartData sampleData2(){
  //   return LineChartData(
  //     lineTouchData: LineTouchData(
  //       enabled: false,
  //     ),
  //     gridData: FlGridData(
  //       show: false,
  //     ),
  //     titlesData: FlTitlesData(
  //       bottomTitles:AxisTitles(sideTitles:
  //       SideTitles(
  //         showTitles: true,
  //         reservedSize: 22,
  //         textStyle: const TextStyle(
  //           color: Colors.red,
  //           fontWeight: FontWeight.bold,
  //           fontSize: 16,
  //         ),
  //       ),
  //     )
  //   );
  // }
}
