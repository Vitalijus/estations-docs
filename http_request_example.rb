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

# Success response
# {
#   "data": {
#     "userLogin": {
#       "authenticatable": {
#         "email": "dev@estations.io"
#       },
#       "credentials": {
#         "accessToken": "OvZRVbA011HisJRjCAcNhA",
#         "client": "q6ZRz4ib0LlMZWT-KbTJJg",
#         "expiry": 1672763368,
#         "tokenType": "Bearer",
#         "uid": "dev@estations.io"
#       }
#     }
#   }
# }

# Error response
# {"data"=>{"userLogin"=>nil}, "errors"=>[{"message"=>"Invalid login credentials. Please try again.", "locations"=>[{"line"=>2, "column"=>3}], "path"=>["userLogin"], "extensions"=>{"code"=>"USER_ERROR"}}]}
