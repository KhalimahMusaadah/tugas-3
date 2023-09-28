import 'package:flutter/material.dart';
import 'package:tugas3/schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  void _saveUsername() async {
    //inisialisasi Share Preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Simpan username ke local storage
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namaController, placeholder, isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: namaController,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: placeholder,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  _showDialog(pesan, alamat){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  )
                );
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, "Masukkan Username", false),
            _showInput(_passwordController, "Masukkan Password", true),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  if (_usernameController.text == 'khalim' &&
                      _passwordController.text == 'khalim') {
                    _saveUsername();
                    _showDialog("Berhasil Login", const Schedule());
                  } else {
                    _showDialog("Username dan password salah", const LoginPage());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}