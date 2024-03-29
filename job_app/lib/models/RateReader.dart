import 'dart:io';
import 'package:path_provider/path_provider.dart';

const fileName = 'rate.txt';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/$fileName');
}

Future<File> writeCounter(double rate) async {
  final file = await _localFile;

  // Write the file.
  return file.writeAsString('$rate');
}

Future<double> readCounter() async {
  try {
    final file = await _localFile;

    // Read the file.
    String contents = await file.readAsString();

    return double.parse(contents);
  } catch (e) {
    // If encountering an error, return 0.
    return 0;
  }
}
