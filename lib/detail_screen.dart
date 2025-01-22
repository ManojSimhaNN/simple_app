// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class DetailScreen extends StatefulWidget {
  final String title;
  final String description;

  const DetailScreen({super.key, required this.title, required this.description});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Uint8List? _imageBytes;
  String? _imageName;

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: true,
    );

    if (result != null && result.files.single.bytes != null) {
      final file = result.files.single;

      setState(() {
        _imageBytes = file.bytes!;
        _imageName = file.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: _imageBytes == null
                    ? const Text('No image selected.')
                    : Image.memory(
                        _imageBytes!,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FloatingActionButton(
                  hoverColor: Colors.lightBlue,
                  onPressed: _pickImage,
                  child: const Icon(
                    Icons.camera_alt,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
