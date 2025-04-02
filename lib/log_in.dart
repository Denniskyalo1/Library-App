import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:library_app/api_service.dart';
import 'package:library_app/store_user_details.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false; 

  Future<void> _login() async {
    setState(() {
      _isLoading = true; 
    });

    final response = await ApiService.login(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false; 
    });

    if (response != null && response['status'].toString() == "200") {
      var user = response['user'];
      String userName = user['name'];
      String userEmail = user['email'];
      String authToken = response['token'] ?? '';

      await UserDetails.storeUserDetails(userName, userEmail, authToken);

      if (!mounted) return;

      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Text('Login successful! Welcome back $userName'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  Navigator.pushReplacementNamed(context, '/homePage');
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
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(color: Color(0xFF0A8159)),
        child: Column(
          children: [
            SizedBox(height: height * 0.30, child: _buildHeader()),
            Expanded(child: _buildLoginForm()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/logo.png', height: 40, width: 40),
          const SizedBox(width: 10),
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
    );
  }

  Widget _buildLoginForm() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _emailController,
            cursorColor: Colors.black,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 17,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: const TextStyle(
                fontFamily: 'Lato',
                color: Colors.grey,
                fontSize: 17,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _passwordController,
            cursorColor: Colors.black,
            obscureText: _obscurePassword,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 17,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: const TextStyle(
                fontFamily: 'Lato',
                color: Colors.grey,
                fontSize: 17,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgotten Password?",
                style: TextStyle(color: Color(0xFF0A8159)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 30, top: 10, right: 30),
            child: MaterialButton(
              height: height * 0.06,
              minWidth: width,
              color: Color(0xFF0A8159),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              ),
              onPressed: _isLoading ? null : _login, 
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Color(0xFF0A8159),
                        strokeWidth: 2,
                      ),
                    )
                  : const Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
          const Spacer(),
          Center(
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: const TextStyle(color: Color(0xFF0A8159)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, '/signUp'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
