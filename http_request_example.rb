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

# Response
# => {"data"=>{"userLogin"=>nil}, "errors"=>[{"message"=>"Invalid login credentials. Please try again.", "locations"=>[{"line"=>2, "column"=>3}], "path"=>["userLogin"], "extensions"=>{"code"=>"USER_ERROR"}}]}
