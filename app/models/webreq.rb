class Webreq < ApplicationRecord
    def content_length
        # uri = URI.parse(url)
        # response = Net::HTTP.start(uri.host, uri.port) { |http| http.request_head(uri.path) }
        # response["content-length"].to_i
        0
    end
end
