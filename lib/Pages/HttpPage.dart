// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/MonthlyModel.dart';
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

   void initState(){
    super.initState();
    getHttpRequest("IBM");
  }
  String apiKey ="demo";
  var re;
  MonthlyAdjusted? stockData;
  Future <void> getHttpRequest(String symbolName)async{
    String url ="https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol="+symbolName+"&apikey="+apiKey;
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if(response.statusCode==200){
    stockData=monthlyAdjustedFromMap(response.body);
    stockData!.monthlyAdjustedTimeSeries.forEach((key, value) {
      setState(() {
        high.add(value.the2High);
        open.add(value.the1Open);
        low.add(value.the3Low);
        aclose.add(value.the5AdjustedClose);
        amount.add(value.the7DividendAmount);
        vol.add(value.the6Volume);
        close.add(value.the4Close);
      });
    });
    // print(data);
    // // print(monthlyAdjustedFromMap(response.body));
    }else{
      print('error');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView.builder(
          itemCount:10,
          itemBuilder: (context,index){
        return ListTile(
          subtitle: Column(children: [
            // Text(stockData!.monthlyAdjustedTimeSeries.cast().toString()),
            Text('Open : '+open[index]),
            Text('High : '+high[index]),
            Text('Low : '+low[index]),
            Text('Close : '+close[index]),
            Text('Adjusted Close : '+aclose[index]),
            Text('Amount : '+amount[index]),
            Text('Volume : '+vol[index]),
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
