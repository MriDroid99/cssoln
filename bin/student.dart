import './person.dart';

class Student extends Person {
  String email, phone;
  Map<String, double> subjects = {};

  Student({
    required String id,
    required String name,
    required int age,
    required String address,
    required this.email,
    required this.phone,
  }) : super(
          id: id,
          name: name,
          address: address,
          age: age,
        );

  void addSubject(String sbjName, double sbjGrade) =>
      subjects.addAll({sbjName: sbjGrade});

  void studentData() {
    print('Student Name: $name');
    print('Student Email: $email');
    print('Student Phone: $phone');
    print('Student Subjects: $subjects');
  }
}

class Students {
  final List<Student> _studentsList = [];

  void addStudent({
    required String id,
    required String name,
    required String address,
    required int age,
    required String email,
    required String phone,
  }) =>
      _studentsList.add(
        Student(
          id: id,
          name: name,
          age: age,
          address: address,
          email: email,
          phone: phone,
        ),
      );

  void removeStudent(String id) =>
      _studentsList.removeWhere((element) => element.id == id);

  void printStudentData([String? id]) {
    if (id == null) {
      _studentsList.forEach((element) {
        element.studentData();
      });
    } else {
      _studentsList.firstWhere((element) => element.id == id).studentData();
    }
  }

  void addSubject(String id, String sbjName, double sbjGrade) => _studentsList
      .singleWhere((element) => element.id == id)
      .addSubject(sbjName, sbjGrade);

  void calculateGrade(String id) {
    var std = _studentsList.firstWhere((element) => element.id == id);
    Map<String, String> result;
    result = {};
    std.subjects.forEach((name, grade) {
      if (grade > 50) {
        result.addAll({name: 'success'});
      } else {
        result.addAll({name: 'fail'});
      }
    });
    print(result);
  }
}
