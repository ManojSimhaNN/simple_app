import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html;
import 'dart:typed_data';

class DetailScreen extends StatefulWidget {
  final String title;
  final String description;

  DetailScreen({required this.title, required this.description});

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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                widget.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Center(
                child: _imageBytes == null
                    ? Text('No image selected.')
                    : Image.memory(
                        _imageBytes!,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: FloatingActionButton(
                  hoverColor: Colors.lightBlue,
                  onPressed: _pickImage,
                  child: Icon(
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
