import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:library_app/api_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreeToTerms = false;
  bool _obscurePassword = true; 

  
Future<void> _signUp() async {

  final response = await ApiService.register(
    _nameController.text,
    _emailController.text,
    _passwordController.text,
  );


  if (!mounted) return;

  if (response != null && response['status'].toString() == "200") {
    if (response['token'] != null) {
      await ApiService.saveToken(response['token']);
    }

    if(!mounted) return;

    showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: const Text('Sign up successful!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(dialogContext).pop(); 
            Future.delayed(Duration(milliseconds: 300), () {
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/homePage');
              }
            });
          },
          child: const Text('Ok'),
        ),
      ],
    );
  },
);
}else{
    if (response == null || response['status'].toString() != "200") {
      _showErrorDialog(message: response?['message'] ?? 'Sign up failed. Try again.');
    }
}
}

void _showErrorDialog({
  String message = 'Sign up failed, please try again'
  })
   {
    showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}


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
                    child: SizedBox(
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
                              ),
                            ),
                          ),
                          const Text(
                            "Shelfie",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontStyle: FontStyle.normal,
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
                              controller: _nameController,
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
                              controller: _emailController,
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
                              controller: _passwordController,
                              cursorColor: Colors.black,
                              autocorrect: false,
                              obscureText: _obscurePassword, // Toggle visibility
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
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword;
                                    });
                                  },
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
                                  value: _agreeToTerms,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _agreeToTerms = value ?? false;
                                    });
                                  },
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
                                          fontFamily: "Lato",
                                          fontSize: 17,
                                          color: Color(0xFF0A8159),
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          print('Privacy tapped');
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
                                          fontFamily: 'Lato',
                                          fontSize: 17,
                                          color: Color(0xFF0A8159),
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = () {
                                          print('Policy tapped');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                              onPressed: _agreeToTerms ? _signUp : null,
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
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
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