import 'package:graphql_flutter/graphql_flutter.dart';
import 'objetos.dart';

class DataBase {
  Course getCourse(QueryResult result) {
    Course resultado = Course("", "", "", []);
    resultado.compania =
        result.data!["courses"]["data"][0]["attributes"]["compania"];
    resultado.seccion =
        result.data!["courses"]["data"][0]["attributes"]["seccion"];
    resultado.numPatrulla =
        result.data!["courses"]["data"][0]["attributes"]["numPatrulla"];

    List data =
        result.data!["courses"]["data"][0]["attributes"]["usuarios"]["data"];

    for (var element in data) {
      resultado.classmates.add(Classmate(
        element["attributes"]["firstName"],
        element["attributes"]["lastNameF"],
        element["attributes"]["lastNameM"],
        element["attributes"]["chapadeGuerra"],
      ));
    }

    return resultado;
  }

  List<Assitance> getAssistance(QueryResult result) {
    List<DetailsAssitance> detailsFormat(List element) {
      List<DetailsAssitance> resultado = [];

      for (var element in element) {
        resultado.add(DetailsAssitance(
            element["usuario"]["data"]["id"],
            element["usuario"]["data"]["attributes"]["firstName"],
            element["usuario"]["data"]["attributes"]["lastNameF"],
            element["usuario"]["data"]["attributes"]["lastNameM"],
            element["detalle"]));
      }

      return resultado;
    }

    List<Assitance> resultado = [];

    List data = result.data!["assistances"]["data"];

    for (var element in data) {
      resultado.add(Assitance(
          element["id"],
          element["attributes"]["name"],
          element["attributes"]["date"],
          element["attributes"]["status"],
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
          element["attributes"]["lastNameF"],
          element["attributes"]["lastNameM"],
          element["attributes"]["password"],
          element["attributes"]["email"],
          element["attributes"]["rol"],
          element["attributes"]["alergias"],
          element["attributes"]["tipodeSangre"],
          element["attributes"]["factorRh"],
          element["attributes"]["chapadeGuerra"]));
    }

    return resultado.first;
  }
}
