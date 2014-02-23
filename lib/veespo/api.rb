require 'faraday'
require 'json'

module Veespo

  Version  = 0.2
  API_ROOT = 'http://production.veespo.com/'

  class Api
    class << self
      def self.get_token(params={})
        Api.http_get("/v1/auth/category/#{params[:category]}/user-token", api_key:params[:api_key],user:params[:user])['token']
      end

      def self.http_get(api_path,path,params)
        conn = connection(api_path) 
        JSON.parse(conn.get(path,params).body)['data']
      end

      def self.connection(api_path) 
        Faraday.new(api_path) do |c|
          c.use Faraday::Response::RaiseError
          c.use Faraday::Adapter::NetHttp
        end
      end
    end
  end

  class Api
  
    def initialize(args={})
      @token = args[:token]
      @api_path = args[:api_path]
      @connection = Api.connection(@api_path)
    end

    def get(path,params={})
      params[:token] = @token
      @connection.http_get path,params
    end
  
  end

end

