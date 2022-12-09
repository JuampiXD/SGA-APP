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

  String getInfoUsers(String email,String compania,String seccion,String patrulla) {
    return """ 
query {
  assistances(
    filters: {
      asistencia: { usuario: { email: { eq: "$email" } } }
    }
  ) {
    data {
      id
      attributes {
        
        name
        date
        status
          asistencia(
          filters: {
            usuario: {
              patrulla: {
                compania: { eq: "$compania" }
                seccion: { eq: "$seccion" }
                numPatrulla: { eq: "$patrulla" }
              }
            }
          }
        ){
          detalle
          usuario {
            data {
              id
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
          patrulla {
          data {
            attributes {
              compania
              seccion
              numPatrulla
            }
          }
        }
      }
    }
  }
}

  """;
  }
}
