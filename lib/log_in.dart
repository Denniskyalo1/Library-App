import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:library_app/api_service.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final response = await ApiService.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!mounted) return;

    if (response != null && response['status'] == 200) {
      if (response['token'] != null) {
        await ApiService.saveToken(response['token']);
      }

      if(!mounted) return;

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: const Text('Login successful!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  Future.delayed(const Duration(milliseconds: 300), () {
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
    } else {
      _showErrorDialog(message: response?['message'] ?? 'Login failed. Try again.');
    }
  }

  void _showErrorDialog({String message = 'Login failed, please try again'}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
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
            decoration: const BoxDecoration(color: Color(0xFF0A8159)),
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
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, left: 30),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildTextField("Email", _emailController, false),
                    const SizedBox(height: 20),
                    _buildTextField("Password", _passwordController, true),
                    _buildForgotPassword(),
                    const SizedBox(height: 30),
                    _buildLoginButton(),
                    const SizedBox(height: 90),
                    _buildSignUpPrompt(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, bool isPassword) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        autocorrect: false,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 17, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(right: 30, top: 10),
      child: Text.rich(
        TextSpan(
          text: "Forgotten Password?",
          style: const TextStyle(fontSize: 17, color: Color(0xFF0A8159)),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: MaterialButton(
        height: 50,
        minWidth: double.infinity,
        color: const Color(0xFF0A8159),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: _login,
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 30),
      child: Text.rich(
        TextSpan(
          text: "Don't have an account? ",
          style: const TextStyle(fontSize: 17, color: Colors.grey),
          children: [
            TextSpan(
              text: "Sign Up",
              style: const TextStyle(fontSize: 17, color: Color(0xFF0A8159)),
              recognizer: TapGestureRecognizer()..onTap = () => Navigator.pushNamed(context, '/signUp'),
            ),
          ],
        ),
      ),
    );
  }
}
