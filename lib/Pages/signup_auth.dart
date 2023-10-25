import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stock_app/Pages/HttpPage.dart';
class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: passController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                // suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              signUp();
            }, child: Text('Login'),),
          ],
        ),
      ),
    );
  }
  Future <void> signUp()async{
    final headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'Origin': 'http://127.0.0.1',
      'X-RapidAPI-Key': '1e71ef091fmsh9f841ffb3c10310p19c60fjsna11ad101e2b5',
      'X-RapidAPI-Host': 'login-signup.p.rapidapi.com',
    };
    if(emailController.text.isNotEmpty&&passController.text.isNotEmpty){
    var response = await http.post(Uri.parse("https://login-signup.p.rapidapi.com/public/v1/signup.php"),
        headers:headers,
        body:({
          'email':emailController.text,
          'password':passController.text,
        }));
    print(response.body);
    if(response.statusCode==200){
      Navigator.push(context,  MaterialPageRoute(builder: (context) => HttpPage()));

    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid Credentials'),),);
    }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Black Field Not Allowed'),),);
    }
  }
}
