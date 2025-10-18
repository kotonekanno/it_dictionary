import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_field.dart';
import '../widgets/centered_max_width.dart';
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
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: CenteredMaxWidth(
        maxWidth: 600,
        child: Column(
          children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(
                      onPressed: _login,
                      text: 'Login',
                    ),
                    SizedBox(width: 50),
                    MainButton(
                      onPressed: () {print('Logout pressed');},
                      text: 'Logout',
                    ),
                  ],
                ),
                Divider(height: 60),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  text: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Register'),
                      Icon(Icons.arrow_outward),
                    ],
                  ),
                  backgroundColor: const Color.fromARGB(255, 203, 211, 255),
                  textColor: Colors.indigo,
                  size: const Size(150, 40),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
