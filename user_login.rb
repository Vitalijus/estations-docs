require "http"

base_address = "https://www.estations.io/graphql"

login_mutation = <<~GQL
       mutation userLogin {
         userLogin(
           email: "dev@estations.io"
           password: "password"
         ){
           authenticatable{
             email
           }
           credentials{
             accessToken
             client
             expiry
             tokenType
             uid
           }
         }
       }
       GQL

login_response = HTTP.post(base_address, params: { query: login_mutation })
p login_response.parse
