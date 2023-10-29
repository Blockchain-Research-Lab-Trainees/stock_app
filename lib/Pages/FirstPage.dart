import 'package:flutter/material.dart';
import 'package:stock_app/utils/Routes.dart';
import 'package:stock_app/Pages/HttpPage.dart';
import 'package:stock_app/main.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          height: MediaQuery.of(context).size.height,
          decoration:const BoxDecoration(
            color: Colors.black,
            // image: DecorationImage(
            //   image:AssetImage('lib/assets/BGN.jpeg'), // Replace with your image asset path
            //   fit: BoxFit.cover,
            //   opacity: 0.9,// Adjust the fit as needed
            // ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [ Column(
                children: [Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 115, 0, 10),
                      child:Column(children: [
                        Text('WELCOME  TO',style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,color: Colors.white),),
                        Text('STOCK  APP',style:TextStyle(fontSize:32,fontWeight:FontWeight.bold,color: Colors.white),),
                        ],),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Image(image: AssetImage('lib/assets/BGO.jpeg'),height: 300,width:MediaQuery.of(context).size.width,),
                  // Image:AssetImage('lib/assets/BGN.jpeg'),
                  SizedBox(height: 50,),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      maximumSize: Size(155, 55),
                      padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),

                    onPressed:(){
                    Navigator.pushNamed(context, MyRoutes.HttpPageRoutes);
                  }, child: Row(children: [
                      Text('STOCKS ',style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_right_alt,color: Colors.black,),
                    ],),
                  ),
                ],),
              ],),
            ),
          ),
        );
    }
  }