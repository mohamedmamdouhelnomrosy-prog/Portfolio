import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart run generate_module.dart <ModuleName>');
    return;
  }

  final String moduleName = args[0];
  final String snakeCaseName = moduleName
      .replaceAllMapped(RegExp(r'([a-z0-9])([A-Z])'), (Match m) => '${m[1]}_${m[2]}')
      .toLowerCase();

  final String baseDir = '../lib/Features/$snakeCaseName';

  final List<String> folders = [
    '$baseDir/data/datasources',
    '$baseDir/data/models',
    '$baseDir/data/repositories',
    '$baseDir/domain/entities',
    '$baseDir/domain/repositories',
    '$baseDir/domain/usecases',
    '$baseDir/presentation/cubit',
    '$baseDir/presentation/pages',
    '$baseDir/presentation/widgets',
  ];

  print('📂 Creating Module: $moduleName');

  for (var folder in folders) {
    Directory(folder).createSync(recursive: true);
    print('Created: $folder');
  }

  print('✅ Finished generating $moduleName module structure.');
}