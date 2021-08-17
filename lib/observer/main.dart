import 'package:flutter_mtap/observer/Passport.dart';
import 'Person.dart';
import 'PostOffice.dart';

void main () {
  PostOffice postOffice = new PostOffice();
  Person chris = new Person("Chris");
  Person john = new Person("John");
  Passport passport = new Passport("John", "Dundee", "You've got a secret lover");

  postOffice.register(chris);
  postOffice.register(john);

  postOffice.addMail(passport);
}
