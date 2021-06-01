
import 'package:faunatic_front_end/Screens/Login/Components/login_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fel mail returnerar felmeddelande',() {
    var resultat = EmailValidate.validate('');
    expect(resultat, 'Epostadressen har felaktigt format.');

  });
  
  test('korret bygd email returnerar null',() {
    var resultat = EmailValidate.validate('test@hotmail.com');
        expect(resultat, null);
  });

  test('lösenord kan inte vara tomt', (){
    var resultat = PasswordValidate.passwordValidate('');
    expect(resultat, 'Lösenord krävs.');
  });

  test('icke tomt lösenord', () {
    var resultat = PasswordValidate.passwordValidate('password');
    expect(resultat, null);

  });

}