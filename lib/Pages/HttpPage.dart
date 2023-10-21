import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/utils/Routes.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  void initState(){
    super.initState();
    getHttpRequest("IBM");
  }
  String apiKey ="demo";
  Future <void> getHttpRequest(String symbolName)async{
    String url ="https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY_ADJUSTED&symbol="+symbolName+"&apikey="+apiKey;
    var response = await http.get(url as Uri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
