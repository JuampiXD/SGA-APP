class QueryCollections {




  String getClassmates(String email) {
    return """ 
query {
  courses   (filters: { usuarios: {email:{eq: "$email" }} }){
    data {
      attributes {
        name
        career
        semester
        usuarios{
          data{
            attributes{
              firstName
              lastName
              email
            }
          }
        }
      }
    }
  }
}
  """;
  }






  String getMyAssistance(String email) {
    return """ 
query {
  assistances(
    filters: {
      asistencia: { usuario: { email: { eq: "$email" } } }
    }
  ) {
    data {
      attributes {
        name
        createdAt
        asistencia {
          detalle
          usuario {
            data {
              attributes {
                firstName
                lastName
              }
            }
          }
        }
      }
    }
  }
}
  """;
  }



  static String getProyectos = """ 
query {
  proyectos(sort: "fecha:desc") {
    data {
      attributes {
        titulo
        descripcion
        fecha
        pdf {
          data {
            attributes {
              url
            }
          }
        }
        imagen {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getProductos = """ 
query{
  productos(sort: "fecha:desc" ){
    data{
      attributes{
        titulo
        descripcion
        fecha
        imagen{
          data{
            attributes{
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getRevistas = """ 
query {
  revistas(sort: ["gestion:desc", "edicion:desc"]) {
    data {
      attributes {
        titulo
        edicion
        gestion
        portada {
          data {
            attributes {
              url
            }
          }
        }
        pdf {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getLaboratorios = """ 
query {
  laboratorios {
    data {
      attributes {
        nombre
        objetivo
        acceso
        logo{
          data{
            attributes{
            url
            }
          }
        }
        virtual {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getOfertas = """ 
query {
  ofertas {
    data {
      attributes {
        titulo
        nombre_director
        descripcion
        foto_director {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getSociedades = """ 
query {
  sociedades {
    data {
      attributes {
        titulo
        estudiante_nombre
        docente_nombre
        vision
        mision
        logo {
          data {
            attributes {
              url
            }
          }
        }

        estatuto {
          data {
            attributes {
              url
            }
          }
        }

        estudiante_imagen {
          data {
            attributes {
              url
            }
          }
        }

        docente_imagen {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;
  static String getTiposPosgrado = """ 
query {
  tiposPosgrados {
    data {
      attributes {
        nombre
        logo {
          data {
            attributes {
              url
            }
          }
        }
        portadas{
          data{
            attributes{
              url
            }
          }
        }
        
      }
    }
  }
}

  """;
  String getActividades(String categoria) {
    return """ 
query {
  actividades (filters: { categorias: { contains: "$categoria" } }){
    data {
      attributes {
        titulo
        descripcion
        imagen {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;
  }

  static String getGrados = """ 
query {
  grados {
    data {
      attributes {
        titulo
        objetivo
        competencia
        campo

        horarios {
          semestre
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        examenes {
          examen
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        defensas {
          defensa
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        logo {
          data {
            attributes {
              url
            }
          }
        }

        malla {
          data {
            attributes {
              url
            }
          }
        }

        informacion {
          data {
            attributes {
              url
            }
          }
        }

        contenido {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getPosgrados = """ 
query {
  posgrados {
    data {
      attributes {
        nombre
        tipo
        logo {
          data {
            attributes {
              url
            }
          }
        }
        informacion {
          campo
          valor
        }
      }
    }
  }
}
  """;

  static String getTecnicas = """ 
query {
 tecnicas{
    data {
      attributes {
        titulo
        objetivo
        competencia
        campo

        horarios {
          semestre
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        examenes {
          examen
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        defensas {
          defensa
          documento {
            data {
              attributes {
                url
              }
            }
          }
        }

        logo {
          data {
            attributes {
              url
            }
          }
        }

        malla {
          data {
            attributes {
              url
            }
          }
        }

       informacion {
          data {
            attributes {
              url
            }
          }
        }

        contenido {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;


  static String getIngles = """ 
query {
  ingleses {
    data {
      attributes {
        nombre
        descripcion
        logo {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;


  static String getInteraccionImagenes = """ 
query {
  descuentosImagen {
    data {
      attributes {
        texto
        imagenes {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }

  conveniosImagen {
    data {
      attributes {
        texto
        imagenes {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }

  becasImagen {
    data {
      attributes {
        texto
        imagenes {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}

  """;


  static String getBecas = """ 
query {
  becas(pagination: {limit: 50 })  {
    data {
      attributes {
        nombre
        definicion
        requisitos
        porcentaje
      }
    }
  }
}

  """;

  static String getDescuentos = """ 
query {
  descuentos (pagination: {limit: 50 }) {
    data {
      attributes {
        nombre
        definicion
        requisitos
        porcentaje
      }
    }
  }
}

  """;

  static String getConvenios = """ 
query {
  convenios(pagination: {limit: 50 }) {
    data {
      attributes {
        institucion
        objetivo
        direccion
        beneficios
        beneficiarios
        tipo
        logo {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;

  static String getUniformes = """ 
query{
  uniformes(sort: "id:asc" ){
    data{
      attributes{
        nombre
        imagen{
          data{
            attributes{
              url
            }
          }
        }
      }
    }
  }
}
  """;


  static String getInstruccion = """ 
query {
  instruccion {
    data {
      attributes {
        descripcion
        portada2{
          data{
            attributes{
              url
            }
          }
        }
        portada {
          data {
            attributes {
              url
            }
          }
        }
        horarios{
          semestre
          documento{
            data{
              attributes{
                url
              }
            }
          }
        }
        examenes{
          examen
          documento{
            data{
              attributes{
                url
              }
            }
          }
        }
        companias{
          nombre
          documento{
            data{
              attributes{
                url
              }
            }
          }
        }
      }
    }
  }
}
  """;

  static String getOrganigrama = """ 
query {
  organigrama {
    data {
      attributes {
        Oficiales(sort: ["orden:asc"]) {
          nombre
          cargo
          foto {
            data {
              attributes {
                url
              }
            }
          }
        }
      }
    }
  }
}
  """;



  static String getMovilidades = """ 
query {
  interinstitucionales {
    data {
      attributes {
        nombre
        portada {
            data {
              attributes {
                url
              }
            }
          }
      }
    }
  }
}
  """;


  static String getVirtuales = """ 
query {
  bibliotecas {
    data {
      attributes {
        nombre
        url
        logo {
            data {
              attributes {
                url
              }
            }
          }
      }
    }
  }
}
  """;


  static String getPlataformas = """ 
query {
  plataformas {
    data {
      attributes {
        nombre
        tipo
        url
      }
    }
  }
}

  """;


  static String getPortadas = """ 
query {
  portada {
    data {
      attributes {
        imagenes {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}

  """;

  static String getTramites = """ 
query {
  tramites {
    data {
      attributes {
        nombre
        documento {
          data {
            attributes {
              url
            }
          }
        }
      }
    }
  }
}
  """;






}
