class QueryCollections {
  String getClassmates(String email) {
    return """ 
  query {
  courses   (filters: { usuarios: {email:{eq: "$email" }} }){
    data {
      attributes {
        compania
        seccion
        numPatrulla
        
        usuarios{
          data{
            attributes{
              firstName
              lastNameF
              lastNameM
              chapadeGuerra
            }
          }
        }
      }
    }
  }
}
  """;
  }

  String getInfoUsers(String email) {
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
        date
        status
        asistencia {
          detalle
          usuario {
            data {
              attributes {
                firstName
                lastNameF
                lastNameM
              }
            }
          }
        }
      }
    }
  }

  usuarios(filters: { email: { eq: "$email" } }) {
    data {
      attributes {
        firstName
        lastNameF
        lastNameM
        password
        email
        rol
        alergias
        tipodeSangre
        factorRh
        chapadeGuerra
      }
    }
  }
}

  """;
  }
}
