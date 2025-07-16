import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:assessment/Features/Home/Data/repo_implementation.dart';

void main() {
  late Directory testDir;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    testDir = await Directory.systemTemp.createTemp();
    Hive.init(testDir.path);
    await Hive.openBox("dogBox");
  });

  tearDownAll(() async {
    await Hive.deleteBoxFromDisk("dogBox");
    Hive.close();
  });

  test("fetch data repo when call function gives dog list modal", () async {
    // Arrange
    final fetchDataImp = FetchDataImp();

    // Act
    final res = await fetchDataImp.fetchData();

    // Assert
    expect(res, isA<List<Map<String, dynamic>>>());
  });
}
