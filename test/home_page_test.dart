import 'package:assessment/Features/Home/Data/repo_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';



// Create a MockPathProvider


void main() async {
  // Ensure widgets binding is initialized for testing
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock the PathProvider behavior
  final mockPathProvider = MockPathProvider();

  // Assign the mock to the PathProviderPlatform instance
  PathProviderPlatform.instance = mockPathProvider;

  // Initialize Hive with a mocked directory
  Hive.init('/mocked_directory'); // Do not use await here
  await Hive.openBox("dogBox");

  // Define the test
  test("fetch data repo when call function gives dog list modal", () async {
    // Arrange
    final FetchDataImp fetchDataImp = FetchDataImp();

    // Act
    var res = await fetchDataImp.fetchData();

    // Assert
    expect(res, isA<List<Map<String, dynamic>>>());
  });
}

class MockPathProvider extends Mock {
  @override
  Future<String> getApplicationDocumentsDirectory() async {
    return '/mocked_directory'; // Mocked directory path
  }
}
