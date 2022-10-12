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






  String getInfoUsers(String email) {
    return """ 
    
    
    
query {
  assistances(
    filters: {
      asistencia: { usuario: { email: { eq:  "$email" } } }
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
  
    usuarios(filters: { email: { eq:  "$email"} }) {
    data {
      attributes {
        firstName
        lastName
        password
        rol
        email
      }
    }
  }
  
}

    
    
    
  """;
  }





}


