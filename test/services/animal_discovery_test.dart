import 'package:bear_grylls/services/animal_discovery.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

void main() {
  group('getFacts', () {
  	test('returns a properly formatted response when there is data', () async {
  		final client = MockClient();

  		when(client.send(any)).thenAnswer((_) async => http.Response("{'results': [{'text': 'Data'}]"));

  		expect(await AnimalDiscover().getFacts('test'), 'Data');
  	});

  	test('returns "No Information Found" when there is no data', () async {
  		final client = MockClient();

  		when(client.send(any)).thenAnswer((_) async => http.Response("{'results': []"));

  		expect(await AnimalDiscover().getFacts('test'), 'No Information Found');
  	});
  });
}
