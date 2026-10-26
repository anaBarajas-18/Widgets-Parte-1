import 'package:flutter/material.dart';

import 'widgets/custom_elevated_button.dart';
import 'widgets/custom_radio_list_tile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widgets Refactorizados',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Refactorizados')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomElevatedButton(
              label: 'Presionar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botón presionado')),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text('Selecciona una opción:'),
            CustomRadioListTile<String>(
              value: 'opcion1',
              groupValue: _selectedOption,
              onChanged: (value) => setState(() => _selectedOption = value),
              title: 'Opción 1',
            ),
            CustomRadioListTile<String>(
              value: 'opcion2',
              groupValue: _selectedOption,
              onChanged: (value) => setState(() => _selectedOption = value),
              title: 'Opción 2',
            ),
          ],
        ),
      ),
    );
  }
}
