

class Course {
  Course(this.name, this.career,this.semester,this.classmates);

   String name;
   String career;
   String semester;
   List<Classmate> classmates;
}

class Classmate {
  Classmate(this.firstName, this.lastName,this.email);

  final String firstName;
  final String lastName;
  final String email;
}

class Assitance {
  Assitance(this.name, this.date,this.detailsAssistance);

  final String name;
  final String date;
  final List<DetailsAssitance> detailsAssistance;
}

class DetailsAssitance {
  DetailsAssitance(this.firstName, this.lastName,this.details);

  final String firstName;
  final String lastName;
  final String details;
}

class User {
  User(this.firstName, this.lastName,this.password,this.email,this.rol);
  String firstName;
  String lastName;
  String password;
  String email;
  String rol;
}








