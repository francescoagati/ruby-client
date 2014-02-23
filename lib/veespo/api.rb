require 'faraday'
require 'json'

module Veespo

  Version  = 0.2
  API_ROOT = 'http://production.veespo.com/'

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
      @conn ||= Faraday.new(API_ROOT) do |c|
        c.use Faraday::Response::RaiseError
        c.use Faraday::Adapter::NetHttp
      end
      JSON.parse(@conn.get(path,params).body)['data']
    end



  end
end

