import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class singup extends StatefulWidget {
  const singup({ Key? key }) : super(key: key);

  @override
  _singupState createState() => _singupState();
}

class _singupState extends State<singup> {
  @override
  Widget build(BuildContext context) {
  TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
      void Register() async {
      FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseFirestore db = FirebaseFirestore.instance;

      final String username = nameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      try {
        final UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        await db.collection("users").doc(user.user!.uid).set({
          "email": email,
          "username": username,
        });
        print("Register done");
      } catch (e) {
        print(e);
      }
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.blueAccent,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),
      body: 
         SafeArea(
        
          child: Container(
            child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff6bceff),
                    Color(0xff6bceff)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(90)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),

                  Align(
                    alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 32,
                          right: 32
                        ),
                        child: Text('Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                       // labelText: 'Enter Name',
                        
                         hintText: 'Enter Name',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        
                        border: InputBorder.none,
                        //labelText: 'Enter Email',
                        hintText: ' Enter Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),                  
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        //labelText: 'Enter Password',
                       // labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w100)
                          hintText: ' Enter Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width/1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff6bceff),
                            Color(0xFF00abff),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50)
                        )
                      ),
                      child: Center(
                          child: Center(
                        child: Text('Sign Up'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        )),
                       
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account ?"),
                  Text("Login",style: TextStyle(color: Color(0xff6bceff)),),
                ], 
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),           
          ],
          
        ),
             
          //    height: MediaQuery.of(context).size.height,
          //     width: double.infinity,
          //   child:Column(
          //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Column(
                
          //      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         SizedBox(height: 40,),
          //          Text ("Sign up", style: TextStyle(
          //                   fontSize: 30,
          //                   fontWeight: FontWeight.bold,
          //                 ),),
          //                 SizedBox(height: 20,),
          //                 Text("Create an Account,Its free",style: TextStyle(
          //                   fontSize: 15,
          //                   color: Colors.grey[700],
          //                 ),),
          //       ],
          //     ),
            
          //     SizedBox(height: 15,),
          //       TextField(
          //         controller: nameController,
          //         decoration: const InputDecoration(
          //             border: OutlineInputBorder(),
          //           icon: Icon(Icons.person),
          //           labelText: 'User Name *',
          //         ),
          //       ),
      
          //       //2
          //        SizedBox(height: 15,),
          //        TextFormField(
          //         controller: emailController,
          //         decoration: const InputDecoration(
          //             border: OutlineInputBorder(),
          //           icon: Icon(Icons.email),
          //           labelText: 'User Email *',
          //         ),
          //       ),
          //       //3
          //        SizedBox(height: 15,),
          //        TextFormField(
          //         controller:passwordController,
          //         decoration: const InputDecoration(
          //             border: OutlineInputBorder(),
          //           icon: Icon(Icons.lock),
          //           labelText: 'User Password *',
          //         ),
          //       ),
          //       ElevatedButton(onPressed: Register, child: Text('Register')),
          //          Text(' Click Here to Login'),
          //       TextButton(onPressed: (){
          //          Navigator.of(context).pushNamed("/login");
          //       }, child: Text('Log In'))
          //   ],
          // )
          ),
        ),
      
      
    );
  }
}
