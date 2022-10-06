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

  List<Uniforme> getUniformes(QueryResult result) {
    List data = result.data!["uniformes"]["data"];
    List<Uniforme> resultado = [];
    for (var element in data) {
      resultado.add(Uniforme(element["attributes"]["nombre"],
          element["attributes"]["imagen"]["data"]["attributes"]["url"]));
    }

    return resultado;
  }

  List<Proyecto> getProyectos(QueryResult result) {
    List data = result.data!["proyectos"]["data"];
    List<Proyecto> resultado = [];
    for (var element in data) {
      resultado.add(Proyecto(
        element["attributes"]["titulo"],
        element["attributes"]["imagen"]["data"]["attributes"]["url"],
        DateTime.parse(element["attributes"]["fecha"]),
        element["attributes"]["descripcion"],
        element["attributes"]["pdf"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Producto> getProductos(QueryResult result) {
    List data = result.data!["productos"]["data"];
    List<Producto> resultado = [];
    for (var element in data) {
      resultado.add(Producto(
        element["attributes"]["titulo"],
        element["attributes"]["imagen"]["data"]["attributes"]["url"],
        DateTime.parse(element["attributes"]["fecha"]),
        element["attributes"]["descripcion"],
      ));
    }

    return resultado;
  }

  List<Revista> getRevistas(QueryResult result) {
    List data = result.data!["revistas"]["data"];
    List<Revista> resultado = [];
    for (var element in data) {
      resultado.add(Revista(
        element["attributes"]["titulo"],
        element["attributes"]["edicion"],
        element["attributes"]["gestion"],
        element["attributes"]["portada"]["data"]["attributes"]["url"],
        element["attributes"]["pdf"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Laboratorio> getLaboratorios(QueryResult result) {
    List data = result.data!["laboratorios"]["data"];
    List<Laboratorio> resultado = [];
    for (var element in data) {
      resultado.add(Laboratorio(
        element["attributes"]["nombre"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
        element["attributes"]["virtual"]["data"]["attributes"]["url"],
        element["attributes"]["objetivo"],
        element["attributes"]["acceso"],
      ));
    }

    return resultado;
  }

  List<Oferta> getOfertas(QueryResult result) {
    List data = result.data!["ofertas"]["data"];
    List<Oferta> resultado = [];
    for (var element in data) {
      resultado.add(Oferta(
        element["attributes"]["titulo"],
        element["attributes"]["nombre_director"],
        element["attributes"]["foto_director"]["data"]["attributes"]["url"],
        element["attributes"]["descripcion"],
      ));
    }

    return resultado;
  }

  List<Sociedad> getSociedades(QueryResult result) {
    List data = result.data!["sociedades"]["data"];
    List<Sociedad> resultado = [];
    for (var element in data) {
      resultado.add(Sociedad(
        element["attributes"]["titulo"],
        element["attributes"]["estudiante_nombre"],
        element["attributes"]["docente_nombre"],
        element["attributes"]["vision"],
        element["attributes"]["mision"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
        element["attributes"]["estatuto"]["data"]["attributes"]["url"],
        element["attributes"]["estudiante_imagen"]["data"]["attributes"]["url"],
        element["attributes"]["docente_imagen"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<CarreraModelo> getGrados(QueryResult result) {
    String _factoryHorarios(String semestre) {
      switch (semestre) {
        case "primer":
          {
            return "1er Semestre";
          }
        case "segundo":
          {
            return "2do Semestre";
          }
        case "tercero":
          {
            return "3er Semestre";
          }
        case "cuarto":
          {
            return "4to Semestre";
          }
        case "quinto":
          {
            return "5to Semestre";
          }
        case "sexto":
          {
            return "6to Semestre";
          }
        case "septimo":
          {
            return "7mo Semestre";
          }
        case "octavo":
          {
            return "8vo Semestre";
          }
        case "noveno":
          {
            return "9no Semestre";
          }

        default:
          {
            return "10mo Semestre";
          }
      }
    }

    List<Elemento> _listaDocumentos(List<dynamic> element, String categoria) {
      List<Elemento> resultado = [];
      for (var element in element) {
        resultado.add(Elemento(
            categoria == "semestre"
                ? _factoryHorarios(element["semestre"])
                : element[categoria],
            element["documento"]["data"]["attributes"]["url"].toString()));
      }
      return resultado;
    }

    List data = result.data!["grados"]["data"];
    List<CarreraModelo> resultado = [];
    for (var element in data) {
      resultado.add(CarreraModelo(
        element["attributes"]["titulo"],
        element["attributes"]["objetivo"],
        element["attributes"]["competencia"],
        element["attributes"]["campo"],
        _listaDocumentos(element["attributes"]["horarios"], "semestre"),
        _listaDocumentos(element["attributes"]["examenes"], "examen"),
        _listaDocumentos(element["attributes"]["defensas"], "defensa"),
        element["attributes"]["logo"]["data"]["attributes"]["url"],
        element["attributes"]["malla"]["data"]["attributes"]["url"],
        element["attributes"]["informacion"]["data"]["attributes"]["url"],
        element["attributes"]["contenido"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Actividad> getActividades(QueryResult result) {
    List<String> _listaImagenes(List<dynamic> element) {
      List<String> resultado = [];
      element.forEach((element) {
        resultado.add(element["attributes"]["url"].toString());
      });
      return resultado;
    }

    List data = result.data!["actividades"]["data"];
    List<Actividad> resultado = [];
    for (var element in data) {
      resultado.add(Actividad(
        element["attributes"]["titulo"],
        _listaImagenes(element["attributes"]["imagen"]["data"]),
        element["attributes"]["descripcion"],
      ));
    }

    return resultado;
  }

  List<TipoPosgrado> getTiposPosgrado(QueryResult result) {
    List<String> _lista(List lista) {
      List<String> posgrados = [];
      for (var element in lista) {
        posgrados.add(element["attributes"]["url"]);
      }
      posgrados.shuffle();
      return posgrados;
    }

    List data = result.data!["tiposPosgrados"]["data"];
    List<TipoPosgrado> resultado = [];
    for (var element in data) {
      resultado.add(TipoPosgrado(
        element["attributes"]["nombre"],
        _lista(element["attributes"]["portadas"]["data"]),
        element["attributes"]["logo"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Posgrado> getPosgrado(QueryResult result) {
    List<InformacionPosgrado> _listaInformacionPosgrado(List<dynamic> element) {
      List<InformacionPosgrado> resultado = [];
      for (var element in element) {
        resultado.add(InformacionPosgrado(
            element["campo"].toString(), element["valor"].toString()));
      }
      return resultado;
    }

    List data = result.data!["posgrados"]["data"];
    List<Posgrado> resultado = [];
    for (var element in data) {
      resultado.add(Posgrado(
        element["attributes"]["nombre"],
        element["attributes"]["tipo"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
        _listaInformacionPosgrado(element["attributes"]["informacion"]),
      ));
    }

    return resultado;
  }

  List<CarreraModelo> getTecnicas(QueryResult result) {
    String _factoryHorarios(String semestre) {
      switch (semestre) {
        case "primer":
          {
            return "1er Semestre";
          }
        case "segundo":
          {
            return "2do Semestre";
          }
        case "tercero":
          {
            return "3er Semestre";
          }
        case "cuarto":
          {
            return "4to Semestre";
          }
        case "quinto":
          {
            return "5to Semestre";
          }
        case "sexto":
          {
            return "6to Semestre";
          }
        case "septimo":
          {
            return "7mo Semestre";
          }
        case "octavo":
          {
            return "8vo Semestre";
          }
        case "noveno":
          {
            return "9no Semestre";
          }

        default:
          {
            return "10mo Semestre";
          }
      }
    }

    List<Elemento> _listaDocumentos(List<dynamic> element, String categoria) {
      List<Elemento> resultado = [];
      for (var element in element) {
        resultado.add(Elemento(
            categoria == "semestre"
                ? _factoryHorarios(element["semestre"])
                : element[categoria],
            element["documento"]["data"]["attributes"]["url"].toString()));
      }
      return resultado;
    }

    List data = result.data!["tecnicas"]["data"];
    List<CarreraModelo> resultado = [];
    for (var element in data) {
      resultado.add(CarreraModelo(
        element["attributes"]["titulo"],
        element["attributes"]["objetivo"],
        element["attributes"]["competencia"],
        element["attributes"]["campo"],
        _listaDocumentos(element["attributes"]["horarios"], "semestre"),
        _listaDocumentos(element["attributes"]["examenes"], "examen"),
        _listaDocumentos(element["attributes"]["defensas"], "defensa"),
        element["attributes"]["logo"]["data"]["attributes"]["url"],
        element["attributes"]["malla"]["data"]["attributes"]["url"],
        element["attributes"]["informacion"]["data"]["attributes"]["url"],
        element["attributes"]["contenido"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Ingles> getIngles(QueryResult result) {
    List data = result.data!["ingleses"]["data"];
    List<Ingles> resultado = [];
    for (var element in data) {
      resultado.add(Ingles(
        element["attributes"]["nombre"],
        element["attributes"]["descripcion"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<NoticiaPost> getNoticiasPost(Map<String, dynamic> result) {
    List<NoticiaElement> _listaNoticia(List<dynamic> element) {
      List<NoticiaElement> resultado = [];
      for (var element in element) {
        resultado.add(NoticiaElement(
            element["id"], element["media_type"], element["media_url"]));
      }
      return resultado;
    }

    List data = result["data"];
    List<NoticiaPost> resultado = [];
    for (var element in data) {
      resultado.add(NoticiaPost(
        element["caption"],
        element["media_type"],
        element["media_url"],
        element["media_type"] == "CAROUSEL_ALBUM"
            ? _listaNoticia(element["children"]["data"])
            : [NoticiaElement(" ", " ", " ")],
      ));
    }
    return resultado;
  }

  List<Convenio> getConvenios(QueryResult result) {
    List data = result.data!["convenios"]["data"];
    List<Convenio> resultado = [];
    for (var element in data) {
      resultado.add(Convenio(
        element["attributes"]["institucion"],
        element["attributes"]["objetivo"],
        element["attributes"]["direccion"],
        element["attributes"]["beneficios"],
        element["attributes"]["beneficiarios"],
        element["attributes"]["tipo"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<BecaDescuento> getDescuentos(QueryResult result) {
    List data = result.data!["descuentos"]["data"];
    List<BecaDescuento> resultado = [];
    for (var element in data) {
      resultado.add(BecaDescuento(
        element["attributes"]["nombre"],
        element["attributes"]["definicion"],
        element["attributes"]["requisitos"],
        element["attributes"]["porcentaje"],
      ));
    }
    return resultado;
  }

  List<BecaDescuento> getBecas(QueryResult result) {
    List data = result.data!["becas"]["data"];
    List<BecaDescuento> resultado = [];
    for (var element in data) {
      resultado.add(BecaDescuento(
        element["attributes"]["nombre"],
        element["attributes"]["definicion"],
        element["attributes"]["requisitos"],
        element["attributes"]["porcentaje"],
      ));
    }
    return resultado;
  }

  InstruccionModelo getinstruccion(QueryResult result) {
    String _factoryHorarios(String semestre) {
      switch (semestre) {
        case "primer":
          {
            return "1er Semestre";
          }
        case "segundo":
          {
            return "2do Semestre";
          }
        case "tercero":
          {
            return "3er Semestre";
          }
        case "cuarto":
          {
            return "4to Semestre";
          }
        case "quinto":
          {
            return "5to Semestre";
          }
        case "sexto":
          {
            return "6to Semestre";
          }
        case "septimo":
          {
            return "7mo Semestre";
          }
        case "octavo":
          {
            return "8vo Semestre";
          }
        case "noveno":
          {
            return "9no Semestre";
          }

        default:
          {
            return "10mo Semestre";
          }
      }
    }

    List<Elemento> _listaDocumentos(List<dynamic> element, String categoria) {
      List<Elemento> resultado = [];
      for (var element in element) {
        resultado.add(Elemento(
            categoria == "semestre"
                ? _factoryHorarios(element["semestre"])
                : element[categoria],
            element["documento"]["data"]["attributes"]["url"].toString()));
      }
      return resultado;
    }

    Map<String, dynamic> data = result.data!["instruccion"]["data"];
    InstruccionModelo resultado = InstruccionModelo(
      data["attributes"]["descripcion"],
      _listaDocumentos(data["attributes"]["horarios"], "semestre"),
      _listaDocumentos(data["attributes"]["examenes"], "examen"),
      _listaDocumentos(data["attributes"]["companias"], "nombre"),
      data["attributes"]["portada"]["data"]["attributes"]["url"],
      data["attributes"]["portada2"]["data"]["attributes"]["url"],
    );

    return resultado;
  }

  List<Oficial> getOrganigrama(QueryResult result) {
    List data = result.data!["organigrama"]["data"]["attributes"]["Oficiales"];
    List<Oficial> resultado = [];
    for (var element in data) {
      resultado.add(Oficial(
        element["nombre"],
        element["cargo"],
        element["foto"]["data"]["attributes"]["url"],
      ));
    }
    return resultado;
  }

  List<Elemento> getMovilidad(QueryResult result) {
    List data = result.data!["interinstitucionales"]["data"];
    List<Elemento> resultado = [];
    for (var element in data) {
      resultado.add(Elemento(
        element["attributes"]["nombre"],
        element["attributes"]["portada"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Plataforma> getVirtuales(QueryResult result) {
    List data = result.data!["bibliotecas"]["data"];
    List<Plataforma> resultado = [];
    for (var element in data) {
      resultado.add(Plataforma(
        element["attributes"]["nombre"],
        element["attributes"]["url"],
        element["attributes"]["logo"]["data"]["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Plataforma> getPlataformas(QueryResult result) {
    List data = result.data!["plataformas"]["data"];
    List<Plataforma> resultado = [];
    for (var element in data) {
      resultado.add(Plataforma(
        element["attributes"]["nombre"],
        element["attributes"]["tipo"],
        element["attributes"]["url"],
      ));
    }

    return resultado;
  }

  List<Elemento> getTramites(QueryResult result) {
    List data = result.data!["tramites"]["data"];
    List<Elemento> resultado = [];
    for (var element in data) {
      resultado.add(Elemento(element["attributes"]["nombre"],
          element["attributes"]["documento"]["data"]["attributes"]["url"]));
    }

    return resultado;
  }
}
