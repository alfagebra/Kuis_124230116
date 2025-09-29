import 'package:flutter/material.dart';
import 'package:kuis/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2C8C74),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Welcome back to MiniLens!",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 3,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _usernameField(),
                      _passwordField(),
                      SizedBox(height: 20),
                      _loginButton(context),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: usernameC,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person, color: Colors.teal),
          hintText: "Username...",
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: passwordC,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.teal),
          hintText: "Password...",
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2C8C74),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  void _login() {
    String text = "", username, password;
    username = usernameC.text.trim();
    password = passwordC.text.trim();

    if (username == "eva" && password == "116") {
      setState(() {
        text = "Login Berhasil!";
        isLoginSuccess = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(username: username)),
      );
    } else {
      setState(() {
        text = "Login Gagal";
        isLoginSuccess = false;
      });
    }

    SnackBar snackBar = SnackBar(
      backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
      content: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
