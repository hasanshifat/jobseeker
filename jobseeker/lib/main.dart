import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'signup.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'job',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _email;
  String _password;

  GoogleSignIn googleAuth = new GoogleSignIn();

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: ScreenUtil.getInstance().setHeight(120),
      height: 1.0,
      color: Colors.white.withOpacity(.5),
    ),
  );

  

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width:  750,height: 1334,allowFontScaling: true);

    return Scaffold(

          backgroundColor: Color(0xff313131),
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
                      child: Text("jobseeker",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontFamily: 'Righteous',
                      fontWeight: FontWeight.w400
                    ),
                    ),
                    )
                  ),
                  
                  
                ],
              ),
              
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28,right: 28,top: 60),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(280),
                      ),
                      Container(
                        width: double.infinity,
                        height: ScreenUtil.getInstance().setHeight(500),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [BoxShadow(
                            color: Colors.white,
                            blurRadius: 5.0,
                          )]
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16,right: 16,top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            
                            children: <Widget>[
                            SizedBox(
                                   height: ScreenUtil.getInstance().setHeight(20),
                                  ),
                    TextField(
                   onChanged: (value){
                           setState(() {
                           _email =value; 
                          });
                        },
                   
                   decoration: InputDecoration(
                     labelText: 'Enter Username',
                     labelStyle: TextStyle(color: Colors.black,fontSize: 15.0),
                     prefixIcon: Icon(Icons.email,color: Colors.blue),
                     border: OutlineInputBorder()
                 ),
               ),
               SizedBox(
                 height: ScreenUtil.getInstance().setHeight(20),
               ),

               TextField(
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
             SizedBox(
                 height: ScreenUtil.getInstance().setHeight(40),
               ),
               new InkWell(
               
                 onTap: (){ 
                   FirebaseAuth.instance.signInWithEmailAndPassword(
                     email: _email,
                     password: _password
                   ).then((FirebaseUser user){
                     Navigator.push(context, 
                     new MaterialPageRoute(builder: (BuildContext contetex)=>Dashboard()));

                   }).catchError((e){});
                 }, 
                 child: Container(
             height: ScreenUtil.getInstance().setHeight(100),
              width: double.infinity,
              child: Center(
                child: Text("LOGIN",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'Ubuntu-Bold',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0
                ),),
              ),
              decoration: BoxDecoration(
               color: Color(0xffEE4540),
                borderRadius: BorderRadius.circular(10.0),
                //border: Border.all(width: 3.0,color: Color(0xffFF5733))
                
              ),
                 ), 
               ),

                ],
                          ),
                        ),
                      ),
                SizedBox(
                 height: ScreenUtil.getInstance().setHeight(40),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   horizontalLine(),
                   Text("Social Login",
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 16.0
                   ),
                   ),
                    horizontalLine(),

                 ],
               ),
               SizedBox(
                 height: ScreenUtil.getInstance().setHeight(40),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       width: 45.0,
                       height: 45.0,
                       
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.red,
                       ),
                       child: GestureDetector(
                         child: Center(
                         child: Text("G",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 30.0,
                           fontFamily: 'Righteous',
                           fontWeight: FontWeight.w300
                         ),),
                       ),
                       onTap: (){
                         googleAuth.signIn().then((result){
                           result.authentication.then((googleKey){
                             

                           }).catchError((e){
                             print(e);
                           });
                         }).catchError((e){
                           print(e);
                         });
                        
                       },
                     ),
                       )
                   ),
                 
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(
                       width: 45.0,
                       height: 45.0,
                       
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: Colors.blueAccent,
                       ),
                       child: Center(
                         child: Text("f",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 30.0,
                           fontFamily: 'Righteous',
                           fontWeight: FontWeight.w400
                         ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
                SizedBox(
                 height: ScreenUtil.getInstance().setHeight(40),
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Center(
                     child: GestureDetector(
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have an account? Click to ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Sign Up",
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                          ),
                              )
                          ]

                      ),
                      ),
                      onTap: (){
                       
                        Navigator.push(context, 
                        new MaterialPageRoute(builder: (BuildContext context)=> SignUp()));
                      },
                     )
                   )
                 ],
               )


                    ],
                  ),
                ),
                
              ),
               
            ],
          ),
          
        );
  }
}

