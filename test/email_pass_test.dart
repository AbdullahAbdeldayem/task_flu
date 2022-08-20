

import 'package:flutter_test/flutter_test.dart';
import 'package:task_flu/ui/login/login_view.dart';

void main() {

  test('empty email returns error string', () {

    final result = emailValidator.validator('');
    expect(result, 'please enter your Email');
  });

  test('non-empty email returns null', () {

    final result = emailValidator.validator('email');
    expect(result, null);
  });

  test('empty password returns error string', () {

    final result = passlValidator.validator('');
    expect(result, 'please enter your password');
  });

  test('non-empty password returns null', () {

    final result = passlValidator.validator('password');
    expect(result, null);
  });
  test('non-empty password and less that 6', () {

    final result = passlValidator.validator('pas');
    expect(result, 'password should be at least 6 characters');
  });
}