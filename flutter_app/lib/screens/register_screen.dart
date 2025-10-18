import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';
import '../widgets/centered_max_width.dart';

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
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Column(children: [
          InputField(
            controller: _idController,
            labelText: 'ID',
            obscureText: false,
          ),
          InputField(
            controller: _pwController,
            labelText: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 20),
          _loading ? const CircularProgressIndicator() : Column(
            children: [
              MainButton(
                onPressed: _register,
                text: 'Register',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
