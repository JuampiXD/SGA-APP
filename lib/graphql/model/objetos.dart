

class Course {
  Course(this.name, this.career,this.semester,this.classmates);

   String name;
   String career;
   String semester;
   List<Classmate> classmates;
}

class Classmate {
  Classmate(this.firstName,  this.lastNameF,this.lastNameM);

  final String firstName;
  final String lastNameF;
  final String lastNameM;
}

class Assitance {
  Assitance(this.name, this.date,this.detailsAssistance);

  final String name;
  final String date;
  final List<DetailsAssitance> detailsAssistance;
}

class DetailsAssitance {
  DetailsAssitance(this.firstName, this.lastNameF,this.lastNameM,this.details);

  final String firstName;
  final String lastNameF;
  final String lastNameM;
  final String details;
}

class User {
  User(this.firstName, this.lastNameF,this.lastNameM,this.password,this.email,this.rol,this.alergias,this.sangre,this.factor,this.chapa);
  final String firstName;
  final  String lastNameF;
  final String lastNameM;
  final String password;
  final String email;
  final String rol;
  final String alergias;
  final String sangre;
  final String factor;
  final String chapa;
}








