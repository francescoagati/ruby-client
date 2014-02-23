require 'faraday'
require 'json'

module Veespo

  Version  = 0.1 
  API_ROOT = 'http://production.veespo.com'

  class Api
  
    def initialize(args={})
      @token = args[:token]
    end

    def get(path,params={})
      params[:token] = @token
      Api.http_get path,params
    end

    def self.get_token(params={})
      Api.http_get("/v1/auth/category/#{params[:category]}/user-token", api_key:params[:api_key],user:params[:user])['token']
    end


    def self.http_get(path,params)
        JSON.parse(Faraday.get("#{API_ROOT}/#{path}",params))['data']
    end

  end
end

