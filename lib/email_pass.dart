import 'dart:io';

void main() {
  String? password;
  int trialcount = 0;

  do {
    print('Please enter your email address:');
    String? email = stdin.readLineSync();

    print("Enter your password?");
    password = stdin.readLineSync(); // null safety in name string

    if (email == 'pantisirp@gmail.com' && password == "Seemenomore@12") {
      print('Successful');

      print('Email address $email has been registered successfully.');
      break;
    } else if (trialcount == 3) {
      print('Your Account is Blocked');
      break;
    }

    trialcount++;
    print('Invalid Password, try again');
  } while (password != "Seemenomore@12");
}
