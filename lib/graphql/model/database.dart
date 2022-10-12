import 'package:graphql_flutter/graphql_flutter.dart';
import 'objetos.dart';

class DataBase {
  Course getCourse(QueryResult result) {
    Course resultado = Course("", "", "", []);
    resultado.name = result.data!["courses"]["data"][0]["attributes"]["name"];
    resultado.career =
        result.data!["courses"]["data"][0]["attributes"]["career"];
    resultado.semester =
        result.data!["courses"]["data"][0]["attributes"]["semester"];

    List data =
        result.data!["courses"]["data"][0]["attributes"]["usuarios"]["data"];

    for (var element in data) {
      resultado.classmates.add(Classmate(
        element["attributes"]["firstName"],
        element["attributes"]["lastName"],
        element["attributes"]["email"],
      ));
    }

    return resultado;
  }

  List<Assitance> getAssistance(QueryResult result) {
    List<DetailsAssitance> detailsFormat(List element) {
      List<DetailsAssitance> resultado = [];

      for (var element in element) {
        resultado.add(DetailsAssitance(
            element["usuario"]["data"]["attributes"]["firstName"],
            element["usuario"]["data"]["attributes"]["lastName"],
            element["detalle"]));
      }

      return resultado;
    }

    List<Assitance> resultado = [];

    List data = result.data!["assistances"]["data"];

    for (var element in data) {
      resultado.add(Assitance(
          element["attributes"]["name"],
          element["attributes"]["createdAt"],
          detailsFormat(element["attributes"]["asistencia"])));
    }

    return resultado;
  }

  User getInfoUser(QueryResult result) {
    List<User> resultado = [];

    List data = result.data!["usuarios"]["data"];

    for (var element in data) {
      resultado.add(User(
          element["attributes"]["firstName"],
          element["attributes"]["lastName"],
          element["attributes"]["password"],
          element["attributes"]["email"],
          element["attributes"]["rol"]));
    }

    return resultado.first;
  }
}
