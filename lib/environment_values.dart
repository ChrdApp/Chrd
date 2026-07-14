import 'dart:convert';
import 'package:flutter/services.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'Production';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _projectURL = data['projectURL'];
      _anonKey = data['anonKey'];
      _iosClientID = data['iosClientID'];
      _webClientID = data['webClientID'];
      _termsAndCondition = data['termsAndCondition'];
      _privacyPolicy = data['privacyPolicy'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _projectURL = '';
  String get projectURL => _projectURL;

  String _anonKey = '';
  String get anonKey => _anonKey;

  String _iosClientID = '';
  String get iosClientID => _iosClientID;

  String _webClientID = '';
  String get webClientID => _webClientID;

  String _termsAndCondition = '';
  String get termsAndCondition => _termsAndCondition;

  String _privacyPolicy = '';
  String get privacyPolicy => _privacyPolicy;
}
