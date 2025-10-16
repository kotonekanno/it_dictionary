import 'package:flutter/material.dart';
import '../services/auth_service.dart';

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

  void _register() async {
    setState(() => _loading = true);
    bool success = await _authService.register(_idController.text, _pwController.text);
    setState(() => _loading = false);
    final snackBar = SnackBar(content: Text(success ? 'Registered!' : 'Registration Failed'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login / Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: _idController, decoration: const InputDecoration(labelText: 'ID')),
          TextField(controller: _pwController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
          const SizedBox(height: 20),
          _loading ? const CircularProgressIndicator() : Column(
            children: [
              ElevatedButton(onPressed: _login, child: const Text('Login')),
              ElevatedButton(onPressed: _register, child: const Text('Register')),
            ],
          ),
        ]),
      ),
    );
  }
}
