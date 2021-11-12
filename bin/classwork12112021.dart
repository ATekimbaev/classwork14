import 'dart:mirrors';

void main() {
  var worker = Worker(22, 1400);
  worker.name = 'Ivan';
  worker.surname = 'Petrov';

  print(
      'name is ${worker.name}, surname is ${worker.surname}, slary is ${worker.getSlary()}');

  var mystring = MyString('abcde is edcba');
  print(mystring.revers());
  print(mystring.ucFirst());
  print(mystring.ucWords());

  var validator = Validator('atekimbaeva@tek.kg');
  print(validator.isEmail());
}

class Worker {
  String? name;
  String? surname;
  int? rate;
  int? days;
  Worker(this.days, this.rate);

  getSlary() {
    var slary = days! * rate!;
    return ('$slary dollar \$');
  }
}

class MyString {
  String a;

  MyString(this.a);

  revers() {
    var list = a.split('');
    var revers = list.reversed;
    var result = revers.toString();
    return result;
  }

  ucFirst() {
    String result = a.replaceFirst(a[0], a[0].toUpperCase());
    return result;
  }

  ucWords() {
    var list = a.split(' ');
    var result = list.map((e) => e[0].toUpperCase() + e.substring(1));

    return result.join(' ');
  }
}

class Validator {
  String? a;

  Validator(this.a);

  isEmail() {
    RegExp exp = RegExp('@');
    Iterable<RegExpMatch> matches = exp.allMatches(a!);
    if (matches.isEmpty) {
      return false;
    } else
      return (true);
  }
}
