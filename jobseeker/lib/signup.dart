import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobseeker/services/useermanagement.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {



  
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width:  750,height: 1334,allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Text("Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60.0,
                      fontFamily: 'Bungee',
                      fontWeight: FontWeight.w400
                    ),
                    ),
                    )
                  ),
                     
                ],
              ),

              SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                     child: Padding(
                       padding: EdgeInsets.only(right: 28,left: 28,top: 180),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           
                           Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                   onChanged: (value){
                     setState(() {
                      _email = value; 
                     });
                   },
                   decoration: InputDecoration(
                       labelText: 'Email Address',
                       labelStyle: TextStyle(color: Colors.black,fontSize: 15.0),
                       prefixIcon: Icon(Icons.email,color: Colors.blue),
                       border: OutlineInputBorder(),
                 ),
               ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
               onChanged: (value){
                 setState(() {
                  _password = value; 
                 });
               },
               obscureText: true,
               decoration: InputDecoration(
                 labelText: 'Enter Paswword',
                 labelStyle: TextStyle(color: Colors.black,fontSize: 15.0),
                    prefixIcon: Icon(Icons.lock,color: Colors.blue),
                    border: OutlineInputBorder(),
                    
                 
               ),
             ),
                  ),

                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: new InkWell(
               
                 onTap: (){ 
                   FirebaseAuth.instance.createUserWithEmailAndPassword(
                     email: _email,
                     password: _password
                   ).then((signedInUser){
                     Center(
                       child: CircularProgressIndicator(backgroundColor: Colors.red,),
                     );
                     UserManagement().storeNewUser(signedInUser, context);
                   }).catchError((e){
                     print(e);
                   });
                   
                 }, 
                 child: Container(
             height: ScreenUtil.getInstance().setHeight(100),
              width: double.infinity,
              child: Center(
                child: Text("Sign Up",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'Ubuntu-Bold',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0
                ),),
              ),
              decoration: BoxDecoration(
               color: Color(0xff525252),
                borderRadius: BorderRadius.circular(10.0),
                //border: Border.all(width: 3.0,color: Color(0xffFF5733))
                
              ),
                 ), 
               ),
                   ),         
                         ],
                       ),
                     ),
                    )
        ],
      ),    
      
    );
  }
}