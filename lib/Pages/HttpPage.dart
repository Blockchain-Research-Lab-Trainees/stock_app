// import 'dart:convert';
import 'package:stock_app/Data/StoreList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Data/Model.dart';
import 'package:stock_app/Pages/DetailStock.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'SearchPage.dart';
import 'signup_auth.dart';
// import 'package:sensors/sensors.dart';
class HttpPage extends StatefulWidget {
  const HttpPage({super.key});

  @override
  State<HttpPage> createState() => _HttpPageState();
}
StoreList L=StoreList();
class _HttpPageState extends State<HttpPage> {
  Future<void>? _futureData;
  double scrollPosition = 0.0;


   void initState(){
     super.initState();
     _futureData=getHttpRequest();
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
  List<Stock>? stockData;
  bool display =false;

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
  // static String toPass='';
  // void dispose() {
  //   super.dispose();
  //   accelerometerEvents.drain();
  // }
  // final _formKey = GlobalKey<FormState>();
  void dispose() {
    super.dispose();
    accelerometerEvents.drain();
  }
  // List<dynamic> filteredList=L.symbol;

  // void updateList(String query) {
  //   setState(() {
  //     filteredList = L.symbol.where((item) => item.contains(query.toUpperCase())).toList();
  //     print(filteredList[0]);
  //   });
  // }
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
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text("STOCKS LIST",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
            SizedBox(width:60 ,),
            FloatingActionButton(onPressed: (){
              Navigator.pushNamed(context, MyRoutes.SearchPageRoutes);
            },
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: Colors.white,
              child:Icon(Icons.search,color: Colors.black,),

            ),
          ],
        ),
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
               children: [
                 SizedBox(height: 20,),
                 Expanded(
                   child: Container(
                   child:
                    FutureBuilder<void>(
                     future: _futureData,
                     builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color:Colors.white,
                          ),
                        );
                    } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                    } else {
                      return
                   ListView.builder(
                       itemCount:L.symbol.length,
                              itemBuilder: (context,index){
                            return ListTile(
                              subtitle: Container(
                              child: Center(
                                  child: ElevatedButton(
                                    onPressed: (){
                                      Navigator.push(context,  MaterialPageRoute(builder: (context) => DetailStock(sym: L.symbol[index])));
                                    },
                                    style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                                        shadowColor:Colors.grey,

                                        shape: RoundedRectangleBorder(borderRadius:BorderRadiusDirectional.all(Radius.circular(30)))),
                                    child: Center(
                                      child: Column(children: [

                                        SizedBox(height: 10,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${L.symbol[index]} ",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white,backgroundColor: Colors.black),),
                                        ),
                                        SizedBox(height: 10,),
                                        Text("Open with Price: "+L.open[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),),
                                        Text("Day High Price: "+L.dayHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)),
                                        Text("Day Low Price: "+L.dayLow[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)),
                                        Text("Total Trade: "+L.totalTradedVolume[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)),
                                        // Text("Total Trade Value: "+L.totalTradedValue[index].toStringAsFixed(2),style:TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white)),
                                        Text("Last Price: "+L.lastPrice[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)),
                                        Text("Year High Price: "+L.yearHigh[index].toString(),style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black)),
                                        SizedBox(height: 10,),
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
                        );
                      }
                    }
                   ),),
                 ),

               ],
             ),
           ),
    );
  }

}
