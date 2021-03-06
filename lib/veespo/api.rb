require 'faraday'
require 'json'

module Veespo

  Version  = 0.2

  class Api
    class << self
      def get_token(params={})
        Api.http_get(params[:api_path],"/v1/auth/category/#{params[:category]}/user-token", api_key:params[:api_key],user:params[:user])['token']
      end

      def http_get(api_path,path,params)
        conn = connection(api_path) 
        response = JSON.parse(conn.get(path,params).body)
        if response['error'] != nil
          raise response['error']['ruby_msg']
        end
        response['data']
      end

      def connection(api_path) 
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
      response = JSON.parse(@connection.get(path,params).body)
      if response['error'] != nil
        raise response['error']['ruby_msg']
      end
      response['data']
    end
  
  end

end

