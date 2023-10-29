import 'package:stock_app/utils/Routes.dart';

import 'DetailStock.dart';
import 'HttpPage.dart';
import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage> {
  static String toPass='';
  final _formKey = GlobalKey<FormState>();
  List<dynamic> filteredList=[];
  void updateList(String query) {
    setState(() {
      filteredList = L.symbol.where((item) => item.contains(query.toUpperCase())).toList();
      // print(filteredList[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Your Stock",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child:
              // / Row(
              // children: [
              Container(
                color: Colors.white,
                child:
                     Column(
                       children: [
                         SizedBox(height: 5,),
                         TextFormField(
                  style: TextStyle(color: Colors.black,fontSize: 20),
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    hintText: "Find your Stock",
                    hintStyle: const TextStyle(color: Colors.black),
                    labelText: "Search",
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder:const OutlineInputBorder( // Border styling
                          borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: const OutlineInputBorder( // Border styling
                          borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon: IconButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailStock(sym: toPass)));
                          }
                    }, icon: Icon(Icons.search,color: Colors.black,),

                    ),
                  ),
                  // onTapOutside: ((){display=false;})
                  onChanged: updateList,
                  onFieldSubmitted: (value){
                    if(_formKey.currentState!.validate()){
                          Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => DetailStock(sym: toPass)));
                    }
                  },
                  validator: (value){
                    if(L.symbol.contains(value!.toUpperCase().toString())){
                          toPass=value.toString().toUpperCase();
                          return null;
                    }
                    else{
                          return "No Stock of this name";
                    }
                  },
                ),
                         SizedBox(height: 2,),

                       ],
                     ),
              ),
            ),
            SizedBox(height: 3,),
            Expanded(
              child:
              ListView.builder(itemCount: filteredList.length,itemBuilder: (context,index){
                 return ListTile(subtitle:
                   Container(
                     // height: 100,
                     child:SingleChildScrollView(
                       child: Column(
                         children: [
                           TextButton(onPressed: (){
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailStock(sym: filteredList[index])));
                           },
                               child: Text(filteredList[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                         ],
                        ),
                      ),
                    ),
                  );
                  },
                  ),
            ),
            ],
        ),
      ),
    );
}
}