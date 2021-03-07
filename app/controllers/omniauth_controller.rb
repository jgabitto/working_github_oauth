class OmniauthController < ApplicationController
    require 'net/http'
    require 'httparty'
    require 'cgi'

    def github
        uri1 = URI('https://github.com/login/oauth/access_token')
        # uri2 = URI('https://api.github.com/user')

        response = Net::HTTP.post_form(uri1, 'client_id' => Rails.application.credentials.fetch(:client_id), 'client_secret' => Rails.application.credentials.fetch(:client_secret), 'code' => params[:code])
        data = CGI::parse(response.body)
        p data
        p data["access_token"]
        headers = {
            "Authorization" => "token #{data["access_token"]}",
            "User-Agent" => "jgabitto"
        }
        info = HTTParty.get('https://api.github.com/user', :headers => headers)
        p info
        redirect_to "https://sample-devise-omniauth.netlify.app/"
    end

end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
