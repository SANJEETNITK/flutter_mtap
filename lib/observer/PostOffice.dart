import 'Observer.dart';
import 'Passport.dart';
import 'Subject.dart';

class PostOffice extends Subject
{

  List<Passport> allMail = [];
  List<Observer> observers = [];


 void addMail(Passport m){
    allMail.add(m);
    Notify();
  }

  List<Passport> getState()
  {
    return allMail;
  }

  void register(Observer o)
  {
    observers.add(o);
  }

  void unRegister(Observer o)
  {
    observers.remove(o);
  }

  void Notify()
  {
    for (int i = 0; i < observers.length; i++)
      observers[i].update(this);
  }
}