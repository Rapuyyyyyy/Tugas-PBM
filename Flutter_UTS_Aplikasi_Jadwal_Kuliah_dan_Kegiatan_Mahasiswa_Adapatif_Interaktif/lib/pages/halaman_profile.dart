import 'package:flutter/material.dart';

class AkunPage extends StatefulWidget {
  final void Function(bool isDark)? onThemeChanged;
  final void Function(MaterialColor color)? onColorChanged;

  const AkunPage({super.key, this.onThemeChanged, this.onColorChanged});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  bool _isDarkMode = false;

  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/FotoProfile.jpg'),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [
                        Text('Nama: Mahardika Rafaditya Dwi Putra Hastomo', textAlign: TextAlign.center),
                        SizedBox(height: 8),
                        Text('NPM: 4522210146', textAlign: TextAlign.center),
                        SizedBox(height: 8),
                        Text('Email: 4522210146@univpancasila.ac.id', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text('Mode Gelap:', style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Switch(
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() => _isDarkMode = value);
                          widget.onThemeChanged?.call(value);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Pilih Warna Tema:', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: _colors.map((color) {
                    return GestureDetector(
                      onTap: () => widget.onColorChanged?.call(color),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 20,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
