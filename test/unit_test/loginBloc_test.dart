import 'package:learning_people/bloc/screen/loginBloc.dart';
import 'package:test/test.dart';

// flutter test test/counter_test.dart
void main() {
  group('LoginBloc', () {
    final bloc = LoginBloc.instance;

    test('email validation', () {
      expect(bloc.isEmailValid('abc'), false);
      expect(bloc.isEmailValid('abc@'), false);
      expect(bloc.isEmailValid('abc@we'), false);
      expect(bloc.isEmailValid('abc@we.com'), true);
    });

    test('password compliant', () {
      expect(bloc.isPasswordCompliant(null), false);
      expect(bloc.isPasswordCompliant(''), false);
      expect(bloc.isPasswordCompliant('abc'), false);
      expect(bloc.isPasswordCompliant('Aabc'), false);
      expect(bloc.isPasswordCompliant('A1abc'), false);
      expect(bloc.isPasswordCompliant('A1@abc'), false);
      expect(bloc.isPasswordCompliant('A!23abc'), true);
    });
  });
}
