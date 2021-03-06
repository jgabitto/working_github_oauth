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
        token = data.values[0]
        p token[0]
        headers = {
            "Authorization" => "token #{token[0]}",
            "User-Agent" => "jgabitto"
        }
        info = HTTParty.get('https://api.github.com/user', :headers => headers)
        p info
        email = HTTParty.get('https://api.github.com/user/emails', :headers => headers)
        p email
        redirect_to "http://localhost:3000"
    end

end

# class Api::V1::OmniauthController < ApplicationController
#     def github
#         p params

#         render json: params
#     end
# end
