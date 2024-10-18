import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<StatefulWidget> createState() => _SignUp();

}
class _SignUp extends State<SignUp>{
    var nameEditingController = TextEditingController();
    var ageEditingController = TextEditingController();
    var emailEditingController = TextEditingController();
    var passEditingController = TextEditingController();
    var confirmpasEditingController = TextEditingController();

     adddata(String name,String email,String password) async{
     try{
       if(name == "" && email == "" && password ==""){
         log("Fill out the required feilds");
       }else
      {
        FirebaseFirestore.instance.collection("Users").doc(name).set
        ({
            "name": name,
            "email": email,
            "password" :password,
        });
       }
    }
     catch (e){
      print("exception : $e");
     }
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sign Up"),
      ),
      body: Container(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Stack(
             children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameEditingController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text("Enter Your name"),
                      hintText: ("Enter your full name here"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 11),
                    TextField(
                    controller: ageEditingController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter Your Age"),
                      hintText: ("Enter your age here"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 11),
                   TextField(
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress ,
                    decoration: const InputDecoration(
                      label: Text("Enter Your Email"),
                      hintText: ("Enter your email here"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 11),
                    TextField(
                    controller: passEditingController,
                    keyboardType: TextInputType.visiblePassword ,
                    decoration: const InputDecoration(
                      label: Text("Password"),
                      hintText: ("Enter your password here"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 11),
                    TextField(
                    controller: confirmpasEditingController,
                    keyboardType: TextInputType.visiblePassword ,
                    decoration: const InputDecoration(
                      label: Text("Confirm Password"),
                      hintText: ("Confirm your Password here"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  const SizedBox(height: 11),
                  ElevatedButton(onPressed: (){
                        adddata(nameEditingController.text.toString(), emailEditingController.text.toString(), passEditingController.text.toString());
                       
                  }, child: const Text("Done"))
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text("Sign Up with Google")),
                  ],
                ),
              ),
             ]
           ),
         ),
      ),
    );
    
      }

}
