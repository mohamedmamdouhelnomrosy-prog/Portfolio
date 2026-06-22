import 'dart:convert';
import 'dart:io';

void main() async {
  // You'll update these paths according to your project structure
  const arJsonPath = 'assets/Languages/ar.json';
  const stringsDartPath = 'lib/Utilities/Constants/strings.dart';

  try {
    // Read ar.json file
    final arFile = File(arJsonPath);
    if (!await arFile.exists()) {
      print('ar.json not found at: $arJsonPath');
      return;
    }

    // Parse JSON and get keys
    final Map<String, dynamic> translations = json.decode(await arFile.readAsString());
    final keys = translations.keys.toList()..sort(); // Sort keys alphabetically

    // Generate Strings class content
    final StringBuffer codeContent = StringBuffer();
    codeContent.writeln('class Strings {');
    codeContent.writeln('  Strings._();');
    codeContent.writeln();

    // Add each key as a static const
    for (final key in keys) {
      codeContent.writeln('  static const String $key = "$key";');
    }

    codeContent.writeln('}');

    // Write to Strings.dart
    final stringsFile = File(stringsDartPath);
    await stringsFile.writeAsString(codeContent.toString());

    print('Successfully updated Strings.dart with ${keys.length} keys!');
  } catch (e) {
    print('Error: $e');
  }
}