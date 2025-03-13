void main() {
  Map<String, String> students = {
    'Alice': 'A',
    'Bob': 'B',
    'Charlie': 'C',
    'Diana': 'D'
  };

  print('List of students with grades:');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  students['Eve'] = 'A+';
  print('After adding Eve:');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  students.addAll({'Frank': 'B+', 'Grace': 'A-'});
  print('After adding Frank and Grace:');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  students.remove('Diana');
  print('After removing Diana:');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  students.remove(students.keys.elementAt(2));
  print('After removing the 3rd student (Charlie):');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  students.remove(students.keys.last);
  print('After removing the last student (Grace):');
  students.forEach((name, grade) => print('$name: $grade'));
  print('');

  String studentName = 'Alice';
  if (students.containsKey(studentName)) {
    print('$studentName found with grade: ${students[studentName]}');
  } else {
    print('$studentName not found.');
  }
}
