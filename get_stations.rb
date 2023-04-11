require "http"

credentials = {
  "access_token": "I5t2bFSjF7grFNpxyU4poQ",
  "client": "I0jVCbnYVYYrBiXuLSE69w",
  "expiry": "1681212715",
  "token_type": "Bearer",
  "uid": "dev@estations.io"
}

get_stations_query = <<~GQL
  query getStations {
    getStations(
      filters: {
       latitude: 34.156839
       longitude: -118.434454
        distanceUnit: "mi"
        distanceRadius: 5
        plugTypes: ["CHAdeMO", "CCS"]
      },
       sortBy: {
        distanceToStation: "asc"
      },
      pagination: {
        size: 10
        from: 0
      }
    ){
      found
       stations{
        id
        access
        address
        city
        country
        description
        distanceToStation
        distanceUnit
        latitude
        longitude
        openingHours
        phoneNumber
        postcode
        provider
        state
        status
        street
        title
        connectors{
          id
          energyUnit
          kwhPrice
          plugType
          power
        }
      }
    }
  }
 GQL

get_stations_response = HTTP.headers(credentials).post(base_address, params: { query: get_stations_query })
p get_stations_response.parse
