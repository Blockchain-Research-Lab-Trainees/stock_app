// import 'dart:convert';
import 'package:stock_app/Data/StoreList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/Model.dart';
import 'package:stock_app/Pages/DetailStock.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:sensors_plus/sensors_plus.dart';

import 'signup_auth.dart';
// import 'package:sensors/sensors.dart';
class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}
StoreList L=StoreList();
class _HttpPageState extends State<HttpPage> {
  double scrollPosition = 0.0;


   void initState(){
    getHttpRequest();
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
    super.initState();
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
  static String toPass='';
  // void dispose() {
  //   super.dispose();
  //   accelerometerEvents.drain();
  // }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Column(
      //   children: [
      //     ElevatedButton(onPressed: (){
      //       Navigator.push(context,  MaterialPageRoute(builder: (context) => Login()));
      //     }, child: Text('Logout'),),
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("STOCKS LIST",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
      ),
      body:
           Container(
             height: MediaQuery.of(context).size.height,
             decoration:const BoxDecoration(
               image: DecorationImage(
                 image:AssetImage('lib/assets/BGW.jpeg'), // Replace with your image asset path
                 fit: BoxFit.cover, // Adjust the fit as needed
                  // opacity: 0.9,
               ),
             ),
             child: Column(
               children: [Center(
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(10,20,10,0),
                   child: Container(
                     color: Colors.black87,
                     child: Form(
                       key: _formKey,
                       child:
                         // / Row(
                         // children: [
                           TextFormField(
                             style: TextStyle(color: Colors.white,fontSize: 20),
                             decoration: InputDecoration(
                               // contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                               hintText: "Find your Stock",
                               hintStyle: const TextStyle(color: Colors.white),
                               labelText: "Search",
                               labelStyle: const TextStyle(color: Colors.white),
                               border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10.0),
                               ),
                               focusedBorder:const OutlineInputBorder( // Border styling
                                 borderSide: BorderSide(color: Colors.white),
                               ),
                               enabledBorder: const OutlineInputBorder( // Border styling
                                 borderSide: BorderSide(color: Colors.white),
                               ),
                               suffixIcon: IconButton(onPressed: (){
                               if(_formKey.currentState!.validate()){
                                 Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailStock(sym: toPass)));
                               }
                             }, icon: Icon(Icons.search,color: Colors.white,),

                               ),
                             ),
                               validator: (value){
                               if(L.symbol.contains(value!.toUpperCase().toString())){
                                  toPass=value.toString().toUpperCase();
                                  // print(toPass);
                                 return null;
                               }
                               else{
                                 return "No Stock of this name";
                               }
                               },
                           ),
                     ),
                   ),
                 ),
               ),
                 SizedBox(height: 20,),
                 Expanded(
                   child: Container(

                     // color: Colors.black12,
                     child: ListView.builder(
                       itemCount:L.symbol.length,
                              itemBuilder: (context,index){
                            return ListTile(
                              subtitle: Container(
                                // color: index%2==0?Colors.blue[700]:Colors.blue[600],
                                color: Colors.white,
                                child: Center(

                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailStock(sym: L.symbol[index])));
                                    },
                                    style:ElevatedButton.styleFrom(backgroundColor: Colors.white,),
                                    child: Center(
                                      child: Column(children: [
                                        Text('  '),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${L.symbol[index]} ",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white,backgroundColor: Colors.black),),
                                        ),
                                        Text('  '),
                                        Text("Open with Price: "+L.open[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black),),
                                        Text("Day High Price: "+L.dayHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                                        Text("Day Low Price: "+L.dayLow[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                                        Text("Total Trade Volume: "+L.totalTradedVolume[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                                        // Text("Total Trade Value: "+L.totalTradedValue[index].toStringAsFixed(2),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white)),
                                        Text("Last Price: "+L.lastPrice[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                                        Text("Year High Price: "+L.yearHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black)),
                                        Text('  '),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                            // print(scrollPosition);
                          },
                     controller: ScrollController(initialScrollOffset: scrollPosition),
      ),
                   ),
                 ),
               ],
             ),
           ),
    );
  }
  void dispose() {
      super.dispose();
      accelerometerEvents.drain();
    }
}
