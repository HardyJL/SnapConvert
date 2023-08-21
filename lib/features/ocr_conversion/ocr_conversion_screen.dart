import 'package:flutter/cupertino.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class OCRConversionScreen extends StatefulWidget {
  const OCRConversionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OCRConversionScreenState createState() => _OCRConversionScreenState();
}

class _OCRConversionScreenState extends State<OCRConversionScreen> {
  String extractedText = '';
  final textDetector = GoogleMlKit.vision.textRecognizer();

  Future<void> pickImageAndDetectText() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final inputImage = InputImage.fromFilePath(pickedFile.path);
      final recognisedText = await textDetector.processImage(inputImage);
      setState(() {
        extractedText = recognisedText.text;
      });
    }
  }

  @override
  void dispose() {
    textDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('OCR Conversion'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoButton.filled(
                onPressed: pickImageAndDetectText,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Extracted Text:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(extractedText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
