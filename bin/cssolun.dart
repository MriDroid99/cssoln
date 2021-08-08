import 'dart:io';

import 'student.dart';

void main() {
  var students = Students();
  loop:
  while (true) {
    print('***********************************');
    print('1. Add Student');
    print('2. Remove Student');
    print('3. Add Subject');
    print('4. One Student Data');
    print('5. All Students Data');
    print('6. Calculate Grade');
    print('7. exit');
    print('***********************************');

    var op = userInput('Enter Operation Number');

    switch (op) {
      case '1':
        var studentData =
            userInput('Enter id, name, address, age, email, phone').split(', ');
        students.addStudent(
          id: studentData[0],
          name: studentData[1],
          address: studentData[2],
          age: int.parse(studentData[3]),
          email: studentData[4],
          phone: studentData[5],
        );
        break;
      case '2':
        var userId = userInput('Enter Student id');
        students.removeStudent(userId);
        break;
      case '3':
        var sbjData = userInput('Enter Student id, Subject Name, Subject Grade')
            .split(', ');
        students.addSubject(
          sbjData[0],
          sbjData[1],
          double.parse(sbjData[2]),
        );
        break;
      case '4':
        var userId = userInput('Enter Student id');
        students.printStudentData(userId);
        break;
      case '5':
        students.printStudentData();
        break;
      case '6':
        var userId = userInput('Enter Student id');
        students.calculateGrade(userId);
        break;
      case '7':
        break loop;
      default:
        print('Enter Valid Operation');
    }
  }
}

String userInput(String label) {
  print(label);
  return stdin.readLineSync()!;
}
