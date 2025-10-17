import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _loading = false;

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
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: _idController, decoration: const InputDecoration(labelText: 'ID')),
          TextField(controller: _pwController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
          const SizedBox(height: 20),
          _loading ? const CircularProgressIndicator() : Column(
            children: [
              ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(125, 50),
                    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                child: const Text('Register'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
