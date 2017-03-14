module Bitmovin::Encoding
  module Inputs
    def Inputs.list(limit = 100, offset = 0)
      response = Bitmovin.client.get '/v1/encoding/inputs', { limit: limit, offset: offset }
      result = (JSON.parse(response.body))['data']['result']
      list = result['items'].map do |item|
        case item['type'].downcase
        when "s3"
          S3Input.new(item)
        end
      end
      list
    end
  end
end
require 'bitmovin/encoding/inputs/s3_input'
require 'bitmovin/encoding/inputs/rtmp_input'
