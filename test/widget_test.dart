import 'package:flutter_test/flutter_test.dart';
import 'package:anime_plus/utils/routes.dart';

void main() {
  test('the app exposes its main navigation route', () {
    expect(Routes.mainScreen, '/');
  });
}
