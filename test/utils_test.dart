// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planningpoker/utils.dart';

void main() {
  group('getTileDataFromName', () {
    test('should return green color', () {
      final tileData = getTileDataFromName('green');

      expect(tileData, Colors.green);
    });

    test('should return yellow color', () {
      final tileData = getTileDataFromName('yellow');

      expect(tileData, Colors.yellow);
    });

    test('should return orange color', () {
      final tileData = getTileDataFromName('orange');

      expect(tileData, Colors.orange);
    });

    test('should return purple color', () {
      final tileData = getTileDataFromName('purple');

      expect(tileData, Colors.purple);
    });

    test('should return red color', () {
      final tileData = getTileDataFromName('red');

      expect(tileData, Colors.red);
    });

    test('should return local_cafe icon', () {
      final tileData = getTileDataFromName('local_cafe');

      expect(tileData, Icons.local_cafe);
    });

    test('should return the input', () {
      final tileData = getTileDataFromName('foobar');

      expect(tileData, 'foobar');
    });
  });
}
