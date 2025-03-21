
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {

  const LandingPage({super.key});


  @override
  State<LandingPage> createState() => _LandingPageState();


}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final double  height = MediaQuery.of(context).size.height;
    final double  width = MediaQuery.of(context).size.width;

     return Scaffold(
      body: Container(
        height: height ,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assets/Gradient Background.jpeg'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 40, right: 40, top: 150),
                padding: EdgeInsets.only(left: 60, right: 10, top: 20, bottom: 20),
                height: height * 0.3,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    "Build your own book world",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: height * 0.05,
                      height: 1
              
                    
                    ),
                    
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/signUp');
                },
                child: Text('Join Us'),
                )
            ],
          ),
          
        ),
      
      ),
       
     );
  }


}
