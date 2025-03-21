import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              color: Color(0xFF0A8159),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.30,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0A8159),
                  ),
                  child: Center(
                    child: Container(
                      width: width * 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: height * 0.05,
                            width: height * 0.05,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('Assets/logo.png'),
                                fit: BoxFit.cover,
                                )
                            ),
                            
                          ),
                          const Text(
                            "Shelfie",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontStyle:FontStyle.normal,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.75,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, left: 30),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            fontFamily: 'Lato',
                            fontStyle: FontStyle.normal,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: height * 0.05,
                            width: width,
                            margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
                            child: TextField(
                              cursorColor: Colors.black,
                              autocorrect: false,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Name",
                                hintStyle: const TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: height * 0.05,
                            width: width,
                            margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
                            child: TextField(
                              cursorColor: Colors.black,
                              autocorrect: false,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Email",
                                hintStyle: const TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: height * 0.05,
                            width: width,
                            margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
                            child: TextField(
                              cursorColor: Colors.black,
                              autocorrect: false,
                              style: const TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 17,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                                filled: true,
                                fillColor: Color(0xFFF5F5F5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.05,
                            width: width,
                            margin: const EdgeInsets.only(left: 60, top: 30),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: false, 
                                  onChanged: (bool? value) { },
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "I agree with",
                                    style: TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 17,
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " privacy",
                                        style: TextStyle(
                                          fontFamily:"Lato",
                                           fontSize: 17,
                                           color: Color(0xFF0A8159), 
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap =(){
                                            print('Tapped');
                                          },
                                      ),
                                      TextSpan(
                                        text: " and",
                                        style: TextStyle(
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " policy",
                                        style: TextStyle(
                                          fontFamily:'Lato',
                                          fontSize: 17,
                                          color: Color(0xFF0A8159),
                                        ),
                                        recognizer: TapGestureRecognizer()
                                         ..onTap = (){
                                          print('Tapped');
                                         }
                                      )
                                    ]
                                  )
                                ),
                              ]
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
                            child: MaterialButton(
                              height: height * 0.06,
                              minWidth: width,
                              color: Color(0xFF0A8159),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                            
                              ),
                              onPressed: (){},
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            
                            ),
                          ),
                          SizedBox(height: 90),
                          Container(
                            height: height * 0.05,
                            width: width,
                            margin: const EdgeInsets.only(left: 100, top: 30),
                            child: Text.rich(
                             TextSpan(
                               text: "Already have an account? ",
                               style: TextStyle(
                               fontSize: 17,
                               fontFamily: 'Lato',
                               color: Colors.grey,
                            ),
                               children: [
                                 TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Lato',
                                  color: Color(0xFF0A8159),
                                ),
                                  recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/login');
                                },
                              ),
                              ],
                            ),
                              ),
                          )

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}