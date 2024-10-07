import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validasi Form',
      home: Scaffold(
        appBar: AppBar(title: const Text('Validasi Form')),
        body: const FormPage(),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _namaDepanController = TextEditingController();
  final _namaBelakangController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomorTeleponController = TextEditingController();
  final _alamatController = TextEditingController();
  final _namaPenggunaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaDepanController,
                decoration: const InputDecoration(labelText: 'Nama Depan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama depan diperlukan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaBelakangController,
                decoration: const InputDecoration(labelText: 'Nama Belakang'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama belakang diperlukan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email diperlukan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Kata Sandi'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Kata sandi harus memiliki minimal 6 karakter';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomorTeleponController,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor telepon diperlukan';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Alamat harus memiliki minimal 10 karakter';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaPenggunaController,
                decoration: const InputDecoration(labelText: 'Nama Pengguna'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama pengguna diperlukan';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Kata sandi tidak cocok';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Memproses Data')),
                    );

                    // Reset form
                    _formKey.currentState!.reset();
                    _namaDepanController.clear();
                    _namaBelakangController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                    _nomorTeleponController.clear();
                    _alamatController.clear();
                    _namaPenggunaController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Periksa kesalahan di form')),
                    );
                  }
                },
                child: const Text('Kirim'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
