import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _kegiatan = [
  ];

  final _namaController = TextEditingController();
  final _tanggalController = TextEditingController();

  void _tambahKegiatan() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Tambah Kegiatan Baru'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Kegiatan'),
              ),
              TextField(
                controller: _tanggalController,
                decoration: const InputDecoration(labelText: 'Hari / Tanggal'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _namaController.clear();
                _tanggalController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                final nama = _namaController.text.trim();
                final tanggal = _tanggalController.text.trim();
                if (nama.isNotEmpty && tanggal.isNotEmpty) {
                  setState(() {
                    _kegiatan.add({
                      'nama': nama,
                      'tanggal': tanggal,
                      'selesai': false,
                    });
                  });
                  _namaController.clear();
                  _tanggalController.clear();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Tambah'),
            ),
          ],
        );
      },
    );
  }

  void _selesaikanKegiatan(int index) {
    setState(() {
      _kegiatan[index]['selesai'] = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _kegiatan.removeAt(index);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kegiatan Mahasiswa'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: _kegiatan.isEmpty
          ? const Center(child: Text('Belum ada kegiatan.'))
          : ListView.builder(
              itemCount: _kegiatan.length,
              itemBuilder: (context, index) {
                final kegiatan = _kegiatan[index];
                final selesai = kegiatan['selesai'] as bool;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: CheckboxListTile(
                    title: Text(
                      kegiatan['nama'],
                      style: TextStyle(
                        decoration:
                            selesai ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Text(kegiatan['tanggal']),
                    value: selesai,
                    onChanged: (bool? value) {
                      if (!selesai && value == true) {
                        _selesaikanKegiatan(index);
                      }
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahKegiatan,
        tooltip: 'Tambah Kegiatan',
        child: const Icon(Icons.add),
      ),
    );
  }
}
