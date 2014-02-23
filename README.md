#Veespo Api

###Wrapper for Veespo Api


In your GemFile

```
gem 'veespo-api', git:'https://github.com/francescoagati/ruby-client.git'
```


and in your ruby file


```

api_key  = 'Replace with your api key'
category = 'the category for generate the token'
user     = 'ther user id'

token = Veespo::Api.get_token api_key:api_key,category:category,user:user

api = Veespo::Api.new token:token
#call the api
puts api.get("/v1/info/category/cities/tags",lang:'en')


```
