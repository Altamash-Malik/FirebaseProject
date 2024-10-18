import 'package:flutter/material.dart';
import 'package:myfirstapp/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCFtAnbXHFScKv_T6V9IYrG5_kEyhLHeXc',
      appId: '1:768356607276:web:ad7c5076054d7908c2b889',
      messagingSenderId: '768356607276',
      projectId: 'myfirstapp-16313',
      authDomain: 'myfirstapp-16313.firebaseapp.com',
      storageBucket: 'myfirstapp-16313.appspot.com',
      measurementId: 'G-VVTWDVLFTF',
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
            debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'My First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    // ignore: non_constant_identifier_names
    var emailTextcontroller = TextEditingController();
    // ignore: non_constant_identifier_names
    var passTextController = TextEditingController();
    // checkSignIn()async{
    //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //   .collection('Users')
    //   .get();
    //   bool isChecked = false;
    //   for(var User in querySnapshot.docs){
    //       Map<String, dynamic> data = User.data() as Map<String, dynamic>;
    //       print(data['email']);
    //       print(data['password']); 
    //       if(data['email'] == emailTextcontroller.text && data['password']== passTextController.text){
    //         isChecked= true;
    //         break;
    //       }
    //       }
    //   if(isChecked==true)
    //   {
    //     print("Sign in succesfully");
    //   }
    //   else{
    //     print("Incorrect Username or password");
    //   }
    // }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
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
                  controller: emailTextcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text("Enter Your email"),
                    hintText: ("abcdefgh@gmail.com"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                const SizedBox(height: 11),
                  TextField(
                  controller: passTextController,
                  keyboardType: TextInputType.visiblePassword ,
                  decoration: const InputDecoration(
                    label: Text("Password"),
                    hintText: ("Enter your Password here"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                ),
                 const SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      checkSignIn(emailTextcontroller,passTextController);
                       },
                    child: const Text("Sign In") 
                    ),
                    // ElevatedButton(onPressed: () async {
                          
                    // }, child: const Text("SIGN IN")),
                     const SizedBox(width: 11),
                    ElevatedButton(onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=> const SignUp()));
                    }, child: const Text("SIGN UP")),
                  ],
                )
            
              ],
            ),
             Center(
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){}, child: const Text("Sign In with Google"))
                  ],
                ),
             )
            ]
          ),
        ),
      )
    );
  }
}
checkSignIn(TextEditingController emailTextcontroller,TextEditingController passTextController)async{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Users')
      .get();
      bool isChecked = false;
      for(var User in querySnapshot.docs){
          Map<String, dynamic> data = User.data() as Map<String, dynamic>;
          print(data['email']);
          print(data['password']); 
          if(data['email'] == emailTextcontroller.text && data['password']== passTextController.text){
            isChecked= true;
          }
          }
      if(isChecked==true)
      {
        print("Sign in succesfully");
      }
      else{
        print("Incorrect Username or password");
      }
    }