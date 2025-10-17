import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _loading = false;

  void _login() async {
    setState(() => _loading = true);
    bool success = await _authService.login(_idController.text, _pwController.text);
    setState(() => _loading = false);

    final snackBar = SnackBar(content: Text(success ? 'Login Success' : 'Login Failed'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _idController, decoration: const InputDecoration(labelText: 'ID')),
            TextField(controller: _pwController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 20),
            _loading ? const CircularProgressIndicator() : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        fixedSize: const Size(125, 50),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Login')
                    ),
                    ElevatedButton(
                      onPressed: () {print('Logout pressed');},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        fixedSize: const Size(125, 50),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      child: const Text('Logout')
                    ),
                  ],
                ),
                Divider(height: 60),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 40),
                    backgroundColor: const Color.fromARGB(255, 203, 211, 255),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Register'),
                ),
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text('Reset Password'),
                ),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
