import 'dart:io';

void main() {
  String? password;
  int trialcount = 0;

  do {
    print("Enter your password?");
    password = stdin.readLineSync(); // null safety in name string

    if (password == "1234") {
      print('Successful');
      break;
    } else if (trialcount == 3) {
      print('Your Account is Blocked');
      break;
    }

    trialcount++;
    print('Invalid Password, try again');
  } while (password != "1234");
}
