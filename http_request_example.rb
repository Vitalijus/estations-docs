require "http"

base_address = "https://www.estations.io/graphql"
query = <<~GQL
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

response = HTTP.post(base_address, params: { query: query })
p response.parse
