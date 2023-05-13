require "http"
 
base_address = "https://www.estations.io/graphql"
 
logout_mutation = <<~GQL
  mutation userLogout {
    userLogout{
      authenticatable{
        email
      }
    }
  }
GQL
 
logout_response = HTTP.post(base_address, params: { query: logout_mutation })
p logout_response.parse
