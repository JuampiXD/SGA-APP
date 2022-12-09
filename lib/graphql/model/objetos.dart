class Course {
  Course(this.compania, this.seccion, this.numPatrulla, this.classmates);

  String compania;
  String seccion;
  String numPatrulla;
  List<Classmate> classmates;
}

class Classmate {
  Classmate(this.firstName, this.lastNameF, this.lastNameM, this.chapadeGuerra);

  final String firstName;
  final String lastNameF;
  final String lastNameM;
  final String chapadeGuerra;
}

class Assitance {
  Assitance(this.id, this.name, this.date, this.status, this.detailsAssistance);
  final String id;
  final String name;
  final String date;
  final bool status;
  final List<DetailsAssitance> detailsAssistance;
}

class DetailsAssitance {
  DetailsAssitance(
      this.id, this.firstName, this.lastNameF, this.lastNameM, this.details);
  final String id;
  final String firstName;
  final String lastNameF;
  final String lastNameM;
  final String details;
}

class User {
  User(
      this.firstName,
      this.lastNameF,
      this.lastNameM,
      this.password,
      this.email,
      this.rol,
      this.alergias,
      this.sangre,
      this.factor,
      this.chapa,
      this.compania,
      this.seccion,
      this.patrulla);
  final String firstName;
  final String lastNameF;
  final String lastNameM;
  final String password;
  final String email;
  final String rol;
  final String alergias;
  final String sangre;
  final String factor;
  final String chapa;
  final String compania;
  final String seccion;
  final String patrulla;
}
